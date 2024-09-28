/*
	This event spawns a ton of spaceborne fighter drones which crowd around the hull and fire lasers in
	through windows. They can be quite lethal if you stand around infront of them, but closing firelocks works
*/

/datum/storyevent/voidwolf_invasion
	id = "voidwolf_invasion"
	name = "Voidwold Invasion"

	event_type =/datum/event/voidwolf_invasion
	event_pools = list(EVENT_LEVEL_MODERATE = POOL_THRESHOLD_MODERATE)
	tags = list(TAG_COMMUNAL, TAG_COMBAT, TAG_DESTRUCTIVE, TAG_SCARY, TAG_EXTERNAL)

//////////////////////////////////////////////////////////

/datum/event/voidwolf_invasion
	endWhen = 1000
	var/list/viable_turfs = list()
	var/voidwolves_to_spawn = 40




/datum/event/voidwolf_invasion/setup()
	//We'll pick space tiles which have windows nearby
	//This means that drones will only be spawned in places where someone could see them
		//And thusly, places where they might fire into the ship
	var/area/spess = locate(/area/nadezhda/outside/inside_colony) in world
	for (var/turf/T in spess)
		if (!(T.z in GLOB.maps_data.station_levels))
			continue

		//The number of windows near each tile is recorded
		var/numwin
		for (var/turf/simulated/floor/asteroid/grass/W in view(4, T))
			numwin++

		//And the square of it is entered into the list as a weight
		if (numwin)
			viable_turfs[T] = numwin*numwin

	//We will then use pickweight and this will be more likely to choose tiles with many windows, for maximum exposure


	announceWhen = rand(40, 60)
	endWhen = rand(600,1200)

/datum/event/voidwolf_invasion/announce()
	var/msg
	if(prob(33))
		msg = "Voidwolves have began positioning within colony walls. Lock down all exterior exits and windows. Take caution when going into the colony yard, reports say they do not intend on leaving."

/datum/event/voidwolf_invasion/start()
	//Pick a list of spawn locatioons
	var/list/spawn_locations = pickweight_mult(viable_turfs, voidwolves_to_spawn)

	log_and_message_admins("Spawning [voidwolves_to_spawn]")
	for(var/turf/T in spawn_locations)
		var/obj/random/mob/voidwolf/D = new /obj/random/mob/voidwolf(T)
		log_and_message_admins("Voidwolf spawned at [jumplink(T)],")
