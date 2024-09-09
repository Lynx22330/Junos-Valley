// Commented out due to a metric fuckton of runtimes -R4d6

// How about I fix that? These look and sound very interesting. - Lynx

// Lets start with making them actually tie to a mobs sanity, shall we?
/mob/living/carbon/superior_animal/ambusher
	name = "Genetic Atrocity"
	desc = "An experiment taken too far. Its flesh stretches and distorts in ways you wish weren't possible. Spindly, mutated spider legs twist from its body, it appears to be in utter agony."
	icon = 'icons/mob/mobs-monster.dmi'
	icon_state = "ambusher"
	icon_living = "ambusher"
	pass_flags = PASSTABLE

	mob_size = MOB_MEDIUM

	maxHealth = 70
	health = 70
	attack_sound = 'sound/weapons/heavyslash.ogg'
	attacktext = "mauls"
	speak_emote = list("twitches.","oozes saliva.","convulses.")
	emote_see = list("screeches in pain.","clicks its mandibles.")
	speak_chance = 5

	armor = list(melee = 7, bullet = 7, energy = 0, bomb = 0, bio = 100, rad = 100)

	move_to_delay = 2
	see_in_dark = 10
	stop_automated_movement_when_pulled = 0

	melee_damage_lower = 20
	melee_damage_upper = 25
	flash_resistances = 10 //its eyes are useless, it uses echo-location to find its prey
	move_to_delay = 2
	faction = "roach"

	colony_friend = FALSE
	friendly_to_colony = FALSE

	//This variable detects how much sanity
	var/sanity_value = 0
	var/insane_target = null

/mob/living/carbon/superior_animal/ambusher/New()
	..()

/mob/living/carbon/superior_animal/ambusher/UnarmedAttack(var/atom/A, var/proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && !L.weakened && prob(10))
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			else
				L.Weaken(3)
				L.visible_message(SPAN_DANGER("\the [src] uses its many limbs to knock down \the [L]!"))

	. = ..()

/mob/living/carbon/superior_animal/ambusher/HasProximity(atom/movable/AM as mob|obj)
	if(ishuman(AM))
		var/mob/living/carbon/human/H = AM
		if(AM.sanity.level < 20)


/mob/living/carbon/superior_animal/ambusher/Life()
	. = ..()
	// We will stick to the ceiling if we heal back to full. Even if a player is watching.
	if (health >= maxHealth && cooldown <= 0)
		new /mob/living/carbon/superior_animal/shadow(src.loc)
		qdel(src)

/mob/living/carbon/superior_animal/ambusher/death(gibbed, deathmessage = "emplodes into a shower of gore.")
	..()
	new /obj/effect/gibspawner/generic(src.loc)
	qdel(src)
	return

/mob/living/carbon/superior_animal/ambusher/injured
	bruteloss = 30

/mob/living/carbon/superior_animal/ambusher/injured/New()
	..()
	src.Weaken(1)

/mob/living/carbon/superior_animal/shadow
	name = "odd shadow"
	desc = "You see an odd shadow, cast by something above you. A brown, pungent substance drips onto the ground. A quick glance and you're greeted with a malformed visage, chittering mindlessly to itself."
	icon = 'icons/mob/mobs-monster.dmi'
	icon_state = "shadow"
	icon_living = "shadow"
	maxHealth = 30
	health = 30
	melee_damage_lower = 0 // We are literally a fucking shadow we shouldn't deal damage.
	melee_damage_upper = 0
	move_to_delay = 7
	speak_chance = 0
	mob_size = MOB_MEDIUM
	flags = PROXMOVE
	faction = "roach"
	density = 0


/mob/living/carbon/superior_animal/shadow/HasProximity(atom/movable/AM as mob|obj)
	if(ishuman(AM))
		var/mob/living/carbon/human/H = AM
		visible_message(SPAN_WARNING("\red The [src] drops from the ceiling, revealing a distorted form of flesh!"))
		playsound(src.loc, 'sound/sanity/piano.ogg', 300, 1)
		H.Weaken(4)
		new /mob/living/carbon/superior_animal/ambusher(src.loc)
		qdel(src)

/mob/living/carbon/superior_animal/shadow/death()
	new /mob/living/carbon/superior_animal/ambusher/injured(src.loc)
	visible_message(SPAN_WARNING("\red The [src] drops from the ceiling, disoriented and heavily injured!"))
	qdel(src)

