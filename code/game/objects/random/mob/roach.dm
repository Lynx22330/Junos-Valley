/obj/random/mob/roaches
	name = "random roach"
	icon_state = "hostilemob-brown"
	alpha = 128
	mobs = list(/mob/living/carbon/superior_animal/roach = 9,
				/mob/living/carbon/superior_animal/roach/tank = 2,
				/mob/living/carbon/superior_animal/roach/toxic = 2,
				/mob/living/carbon/superior_animal/roach/hunter = 4, // Small cast of Roaches early on. Relatively tame.
				)

/obj/random/mob/roaches/item_to_spawn()
	if(GLOB.chaos_level > 1) //Higher weights as chaose increase
		mobs += list(/mob/living/carbon/superior_animal/roach/fuhrer = (0.5 * GLOB.chaos_level)) //They finally get some order.
	if(GLOB.chaos_level > 2)
		mobs += list(/mob/living/carbon/superior_animal/roach/nitro = (0.5 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/roach/glowing = (2 * GLOB.chaos_level)) // This is where the more supportive roaches begin.
		mobs += list(/mob/living/carbon/superior_animal/roach/support = (2 * GLOB.chaos_level))
	if(GLOB.chaos_level > 3)
		mobs += list(/mob/living/carbon/superior_animal/roach/nanite = (0.2 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/roach/elektromagnetisch = (0.2 * GLOB.chaos_level))
	if(GLOB.chaos_level > 5) // These should only be active if players ever decide to vote on it.
		mobs += list(/mob/living/carbon/superior_animal/roach/kaiser = (0.02 * GLOB.chaos_level)) //0.10, then 0.12, 0.14, so on, so forth. Starts off 0.1% chance spawning.
		mobs += list(/mob/living/carbon/superior_animal/roach/tazntz = (1 * GLOB.chaos_level)) // The roaches are now mutating. True chaos unfolds.
		mobs += list(/mob/living/carbon/superior_animal/roach/bluespace = (0.05 * GLOB.chaos_level)) // Teleporting Roaches? Chaos... Chaos!
	return pickweight(mobs)

/obj/random/mob/roaches/low_chance
	name = "low chance random roach"
	icon_state = "hostilemob-brown-low"
	spawn_nothing_percentage = 50 // lets gamble our fate evenly, shall we? To help populate a little more.

/obj/random/cluster/roaches
	name = "cluster of roaches"
	icon_state = "hostilemob-brown-cluster"
	alpha = 128
	min_amount = 3
	max_amount = 6  // 3 less, to compensate for the new buffs to make each encounter a little more interesting, alongside with the new changes to variety tied to chaos.
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
