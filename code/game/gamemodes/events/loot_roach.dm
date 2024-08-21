/*
	This event spawns a special loot roach!
*/

/datum/storyevent/loot_shell
	id = "loot_shell"
	name = "loot shell"

	event_type =/datum/event/loot_shell
	event_pools = list(EVENT_LEVEL_MODERATE = POOL_THRESHOLD_MODERATE)
	tags = list(TAG_COMMUNAL, TAG_COMBAT, TAG_POSITIVE)

//////////////////////////////////////////////////////////

/datum/event/loot_shell
	endWhen = 1000
	var/list/drones_list = list()
	var/list/viable_turfs = list()
	var/drones_to_spawn = 40




/datum/event/loot_shell/setup()
	//We'll pick space tiles which have windows nearby
	//This means that drones will only be spawned in places where someone could see them
		//And thusly, places where they might fire into the ship
	var/area/spess = locate(/area/nadezhda/hallway) in world
	for (var/turf/T in spess)
		if (!(T.z in GLOB.maps_data.station_levels))
			continue

			//Should begin by spawning in a hallway, typically.

	//We will then use pickweight and this will be more likely to choose tiles with many windows, for maximum exposure


	announceWhen = rand(40, 60)
	endWhen = rand(600,1200)

/datum/event/loot_shell/announce()
	var/msg
	if(prob(33))
		msg = "Scans indicate a roach bearing valuable items has been detected in the colony. Locate the roach and terminate it to claim its boon. "
	else if(prob(1))
		msg = " *KSSh-* Miners. I have a proposition for you. Scans indicate that a valuable roach bearing unknown minerals has been detected on - Eh, Wait... What? We're connected to the wrong...? Ahem. If you may excuse me... *KKKsh-* "
	command_announcement.Announce(msg, "Loot Roach alert")

/datum/event/loot_shell/start()
	//Pick a list of spawn locatioons
	var/list/spawn_locations = pickweight_mult(viable_turfs, roach_to_spawn)

	log_and_message_admins("Spawning [roach_to_spawn]")
	for(var/turf/T in spawn_locations)
		var/mob/living/simple_animal/hostile/retaliate/malf_drone/D = new /mob/living/simple_animal/hostile/retaliate/malf_drone(T)
		drones_list.Add(D)

/datum/event/loot_shell/end()
	var/num_recovered = 0
	for(var/mob/living/simple_animal/hostile/retaliate/malf_drone/D in drones_list)
		var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
		sparks.set_up(3, 0, D.loc)
		sparks.start()
		D.z = GLOB.maps_data.admin_levels[1]
		D.has_loot = 0

		qdel(D)
		num_recovered++

	if(num_recovered > drones_list.len * 0.75)
		command_announcement.Announce("Soteria drone control reports the malfunctioning wing has been recovered safely.", "Rogue drone alert")
	else
		command_announcement.Announce("Soteria drone control registers disappointment at the loss of the drones, but the survivors have been recovered.", "Rogue drone alert")
