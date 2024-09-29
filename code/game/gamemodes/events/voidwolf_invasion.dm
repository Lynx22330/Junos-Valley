/*
	This event spawns a ton of spaceborne fighter drones which crowd around the hull and fire lasers in
	through windows. They can be quite lethal if you stand around infront of them, but closing firelocks works
*/

/datum/storyevent/voidwolf_invasion
	id = "voidwolf_invasion"
	name = "Voidwold Invasion"

	event_type =/datum/event/voidwolf_invasion
	event_pools = list(EVENT_LEVEL_MAJOR = POOL_THRESHOLD_MAJOR)
	tags = list(TAG_COMMUNAL, TAG_COMBAT, TAG_DESTRUCTIVE, TAG_SCARY, TAG_EXTERNAL)

//////////////////////////////////////////////////////////

/datum/event/voidwolf_invasion
	endWhen = 1000
	var/list/viable_turfs = list()
	var/list/viable_bomb_turfs_east = list()
	var/list/viable_bomb_turfs_west = list()
	var/voidwolves_to_spawn = 100
	var/explosions_to_spawn = 40




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

	var/area/spessbombeast = locate(/area/nadezhda/security/maingate/east) in world
	for (var/turf/T in spessbombeast)
		if (!(T.z in GLOB.maps_data.station_levels))
			continue

		var/numbomeast
		for (var/turf/simulated/floor/asteroid/dirt/W in view(4, T))
			numbomeast++

		//And the square of it is entered into the list as a weight
		if (numbomeast)
			viable_bomb_turfs_east[T] = numbomeast*numbomeast

	var/area/spessbombwest = locate(/area/nadezhda/security/maingate/west) in world
	for (var/turf/T in spessbombwest)
		if (!(T.z in GLOB.maps_data.station_levels))
			continue

		var/numbomwest
		for (var/turf/simulated/floor/asteroid/dirt/W in view(4, T))
			numbomwest++

		//And the square of it is entered into the list as a weight
		if (numbomwest)
			viable_bomb_turfs_west[T] = numbomwest*numbomwest

	endWhen = rand(600,1200)

/datum/event/voidwolf_invasion/announce()
	var/msg
	msg = "A voidwolf fleet has been sighted above the colony, do not go outside. Scans indicate a missile bombardment to expose our walls is imminent. Remain in-doors at all times, secure yourself inside of a safe location, and do not attempt to engage unarmed. Reports claim they do not intend on leaving. All capable personel are requested to fight back against the invaders."
	command_announcement.Announce(msg, "Voidwolf Invasion - EVACUATE FROM THE COLONY GARDENS AND WALLS IMMEDIATELY")

/datum/event/voidwolf_invasion/start()
	//Pick a list of spawn locatioons
	var/list/spawn_locations = pickweight_mult(viable_turfs, voidwolves_to_spawn)
	var/list/explosion_locations_east = pickweight_mult(viable_bomb_turfs_east, explosions_to_spawn)
	var/list/explosion_locations_west = pickweight_mult(viable_bomb_turfs_west, explosions_to_spawn)

	log_and_message_admins("Spawning [voidwolves_to_spawn]")
	for(var/turf/T in spawn_locations)
		if(/mob/living/carbon/human.client in dview(10))
			continue
		spawn(rand(60, 75) SECONDS)
			new /obj/random/mob/voidwolf(T)
		log_and_message_admins("Voidwolf spawned at [jumplink(T)],")
	for(var/turf/T in explosion_locations_east)
		spawn(rand(20, 60) SECONDS)
			explosion(T, 1, 2, 5, 4)
	for(var/turf/T in explosion_locations_west)
		spawn(rand(20, 60) SECONDS)
			explosion(T, 1, 2, 5, 4)
