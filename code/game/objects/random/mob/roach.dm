/obj/random/mob/roaches
	name = "random roach"
	icon_state = "hostilemob-brown"
	alpha = 128
	mobs = list(/mob/living/carbon/superior_animal/roach = 10,
				/mob/living/carbon/superior_animal/roach/tank = 8,
				/mob/living/carbon/superior_animal/roach/hunter = 7,
				/mob/living/carbon/superior_animal/roach/support = 7, // Small cast of Roaches early on. Relatively tame.
				)

/obj/random/mob/roaches/item_to_spawn()
	if(GLOB.chaos_level > 0) //Higher weights as chaose increase
		mobs += list(/mob/living/carbon/superior_animal/roach/fuhrer = (0.5 * GLOB.chaos_level))
	if(GLOB.chaos_level > 1)
		mobs += list(/mob/living/carbon/superior_animal/roach/glowing = (5 * GLOB.chaos_level)) // This is where the more supportive roaches begin.
		mobs += list(/mob/living/carbon/superior_animal/roach/toxic = (5 * GLOB.chaos_level))
	if(GLOB.chaos_level > 2) //Higher weights as chaose increase
		mobs += list(/mob/living/carbon/superior_animal/roach/fuhrer = (4 * (GLOB.chaos_level / 2))) //They finally get some order. Utility starts here.
	if(GLOB.chaos_level > 3)
		mobs += list(/mob/living/carbon/superior_animal/roach/nanite = (3 * GLOB.chaos_level))		// Finally, some power. Damage starts here.
		mobs += list(/mob/living/carbon/superior_animal/roach/elektromagnetisch = (3 * (GLOB.chaos_level / 2)))
	if(GLOB.chaos_level > 5) // These should only be active if players ever decide to vote on it to allow chaos to surpass the cap of 4.
		mobs += list(/mob/living/carbon/superior_animal/roach/kaiser = (0.4 * GLOB.chaos_level)) //0.10, then 0.12, 0.14, so on, so forth. Starts off 0.1% chance spawning.
		mobs += list(/mob/living/carbon/superior_animal/roach/tazntz = (2 * GLOB.chaos_level)) // The roaches are now mutating. True chaos unfolds.
		mobs += list(/mob/living/carbon/superior_animal/roach/nitro = (1 * GLOB.chaos_level)) // Boom Roaches stay here. Makes sense.
	return pickweight(mobs)

/obj/random/mob/roaches/low_chance
	name = "low chance random roach"
	icon_state = "hostilemob-brown-low"
	spawn_nothing_percentage = 60

/obj/random/cluster/roaches
	name = "cluster of roaches"
	icon_state = "hostilemob-brown-cluster"
	alpha = 128
	min_amount = 3
	max_amount = 9
	spread_range = 0

/obj/random/cluster/roaches/item_to_spawn()
	return /obj/random/mob/roaches

/obj/random/cluster/roaches_hoard
	name = "hoard of roaches"
	icon_state = "hostilemob-brown-cluster"
	alpha = 128
	min_amount = 20
	max_amount = 30
	spread_range = 0

/obj/random/cluster/roaches_hoard/item_to_spawn()
	return /obj/random/mob/roaches

/obj/random/cluster/roaches/low_chance
	name = "low chance cluster of roaches"
	icon_state = "hostilemob-brown-cluster-low"
	spawn_nothing_percentage = 60

/obj/random/cluster/roaches/lower_chance
	name = "lower chance cluster of roaches"
	icon_state = "hostilemob-brown-cluster-low"
	spawn_nothing_percentage = 80

// For Scrap Beacon
/obj/random/cluster/roaches/beacon/item_to_spawn()
	return /mob/living/carbon/superior_animal/roach/nanite

/obj/random/cluster/roachlings
	name = "hoard of roachlings"
	icon_state = "hostilemob-brown-cluster"
	alpha = 128
	min_amount = 1
	max_amount = 2
	spread_range = 0

/obj/random/cluster/roachlings/item_to_spawn()
	return /mob/living/carbon/superior_animal/roach/roachling
