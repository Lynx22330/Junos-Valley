/obj/random/mob/roaches
	name = "random roach"
	icon_state = "hostilemob-brown"
	alpha = 128
	mobs = list(/mob/living/carbon/superior_animal/roach = 10,
				/mob/living/carbon/superior_animal/roach/tank = 8,
				/mob/living/carbon/superior_animal/roach/hunter = 7,
				/mob/living/carbon/superior_animal/roach/toxic = 7	, // Small cast of Roaches early on. Relatively tame.
				)

/obj/random/mob/roaches/item_to_spawn()
	if(GLOB.chaos_level > 1)
		mobs += list(/mob/living/carbon/superior_animal/roach/glowing = (5 * GLOB.chaos_level)) // This is where the more supportive roaches begin.
		mobs += list(/mob/living/carbon/superior_animal/roach/support = (5 * GLOB.chaos_level))
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

	/* All sums are of decimal values. These are the percent weights. 0.22 = 22% spawn chance. Please update this if any changes are made.

	  Total Weight sums: 43.54

	 Default Roach = 10/43.54 = 0.22
	 Tank = 8/43.54 = 0.18
	 Hunter = 7/43.54 = 0.16 / 2 variants = 0.8
	 Toxic = 7/43.54 = 0.16 / 2 variants = 0.8      	Both share same weights, hence, split between both, are 0.8% individually.
	 Glowing = 5/43.54 = 0.11 / 2 variants = 0.057
	 Support = 5/43.54 = 0.11 / 2 variants = 0.057  	Both share same weights, hence, split between both, are 0.57% individually.
	 Fuhrer = 4/43.54 = 0.09
	 Nanite = 3/43.54 = 0.068 / 2 variants = 0.034
	 EMP Roach = 3/43.54 = 0.068 / 2 variants = 0.034	Both share same weights, hence, split between both, are 0.34% individually.
	 Kaiser = 0.4/43.54 = 0.0091 					Kaiser is intended to be very, very rare, just a little below 1%, chaos level increases spawn chance as well however.
	 Tazntz = 2/43.54 = 0.04
	 Nitro = 1 / 43.54 = 0.02  					Nitro increases with chaos level as well, I do not want these to spawn very often.


	 NOTE:
	 	Some spawn rates have their Chaos_Level divided by 2 in order to ensure that they do not overpopulate/dominate the spawn lists, such as the Fuhrer roach, which is
		intended to primarily be a 'utility' / 'leader' that does not spawn very often once chaos hits level 2, and same for level 4. Higher tiered variants SHOULD
		be more common, but a select few should not dominate the list.
	*/

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

/obj/random/cluster/roachlings
	name = "hoard of roachlings"
	icon_state = "hostilemob-brown-cluster"
	alpha = 128
	min_amount = 6
	max_amount = 16
	spread_range = 0

/obj/random/cluster/roachlings/item_to_spawn()
	return /mob/living/carbon/superior_animal/roach/roachling
