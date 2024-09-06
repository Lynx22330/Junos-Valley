/obj/item/cave_in_trap
	name = "ominous pile of rocks"
	desc = "The roof above these rocks appear to be crumbling down. Small granules of dust trickle from the roof. Perhaps you should cross safely?"
	density = 0
	alpha = 133
	anchored = 1
	icon = 'icons/obj/mining.dmi'
	icon_state = "boulder1"
	var/cavedin = "cavein"
	var/delay = 40

// These traps only apply to human mobs since they do not naturally live in caves.
/obj/item/cave_in_trap/ominousrockpile/Crossed(mob/living/carbon/human/M as mob|obj)
	if (istype(M, /mob/observer)) // Anti ghost check since the Crossed proc doesn't check that automatically.
		return

	//Used for the 'instinctual' diving for true directions so we dont fly off diagonally.
	var/client/C = M.client
	var/_dir = C.true_dir

	//If you're being careful, the rocks wont fall. Termites are immune to this trap.
	if (MOVING_DELIBERATELY(M))
		to_chat(M, SPAN_NOTICE("The dust settles on your shoulders safely..."))
		return
	//However, if you're not being careful...

	//You're aware enough to understand that, holy shit, the roof is caving in! Vigilance check of 25.
	if (M.stat_check(STAT_VIG, STAT_LEVEL_ADEPT))
		to_chat(M, SPAN_NOTICE("You instinctively dive out of the way!"))
		M.throw_at(get_edge_target_turf(src, _dir), 1, 1) //Instincts drive you forward!
		M.update_lying_buckled_and_verb_status()
		M.AdjustWeakened(1)

	// If you fail the Vigilance check.
	else
		to_chat(M, SPAN_DANGER("YOU ARE CRUSHED BY A BOULDER!!!"))
		M.update_lying_buckled_and_verb_status()
		M.AdjustWeakened(6)
		M.adjustBruteLoss(15) //Reminder that there is also an AOE check in the spawn_rubble proc. 20 + 25 = 45

	// Rubble, sound, and a boulder always spawns if you don't pass deliberately, AKA walking.
	playsound(src.loc, 'sound/effects/impacts/rumble4.ogg', 300, 1)
	spawn_rubble(src.loc, 2, 33)
	new /obj/structure/boulder(src.loc)
	qdel(src)

/obj/item/cave_in_trap/proc/spawn_rubble(var/turf/T, var/spread = 0, var/chance = 0)

	// It's a cave-in. Any mob around us should be hurt!
	for (var/mob/living/M in dview(spread, T))
		if (M)
			M.adjustBruteLoss(15) // 20 + 15 = 30
			to_chat(M, SPAN_DANGER("You are pelted by the rubble!"))
			new /obj/effect/decal/cleanable/rubble(M.loc) // Always spawn rubble under a mob.

 	// We only want at most 3 decals, mobs or boulders in total.
	var/rubble_amount = 5
	while (rubble_amount > 0)
		rubble_amount--

		var/list/floors = list()
		for (var/turf/simulated/floor/F in dview(spread, T))
			if (F.is_wall)
				continue

			if (locate(/obj/effect/decal/cleanable/rubble) in F)
				continue

			// We don't want rocks to spawn on mobs!
			if (locate(/mob/living/) in F)
				continue
			floors |= F

			if (!floors.len)
				log_and_message_admins("Cave in trap triggered in [src.loc] with no flooring!") //Just to help figure out where it happened.
				return FALSE

 		// Prob determines how many rocks spawns or if a mob could spawn.
		if (prob(chance))
			new /obj/structure/boulder(pick(floors))

			// HOLY SHIT IS THAT A FUCKING KAISER!? 0.1% - 0.5% chance! Multiple can spawn, but INCREDIBLY rare!
			if (prob(0.1))
				new /mob/living/carbon/superior_animal/roach/kaiser
				visible_message(SPAN_DANGER("HOLY SHIT IS THAT A KAISER!?"), SPAN_DANGER("You feel a massive presence nearby!"))
		else
			//Rubble will spawn in place if boulders can't spawn.
			new /obj/effect/decal/cleanable/rubble(pick(floors))
	return TRUE
