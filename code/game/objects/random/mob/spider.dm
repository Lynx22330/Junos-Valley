/obj/random/mob/spiders
	name = "random spider"
	icon_state = "hostilemob-black"
	alpha = 128
	mobs = list(/mob/living/carbon/superior_animal/giant_spider = 20,\
				/mob/living/carbon/superior_animal/giant_spider/hunter = 20,\
				/mob/living/carbon/superior_animal/giant_spider/nurse = 15,\
				/mob/living/carbon/superior_animal/giant_spider/nurse/midwife = 15,\
				/mob/living/carbon/superior_animal/giant_spider/nurse/orb_weaver = 15,\
				/mob/living/carbon/superior_animal/giant_spider/tarantula = 10,\
				)

/obj/random/mob/spiders/item_to_spawn()
	if(GLOB.chaos_level > 1) //Higher weights as chaose increase
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/nurse/carrier = (5 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/nurse/recluse = (5 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/hunter/shocker = (10 * GLOB.chaos_level)) // The more supportive spiders come out.
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/hunter/pepper = (10 * GLOB.chaos_level))
	if(GLOB.chaos_level > 2)
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/hunter/cloaker = (15 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/tarantula/burrowing = (10 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/tarantula/pit = (5 * GLOB.chaos_level))
	if(GLOB.chaos_level > 3)
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/nurse/cave_spider = (5 * GLOB.chaos_level)) // Frost oil should be scary.
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/hunter/viper = (2 * GLOB.chaos_level))     // More venomous, scary spiders occur here.
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/tarantula/ogre = (2 * GLOB.chaos_level))
	if(GLOB.chaos_level > 5) // These should only be active if players ever decide to vote on it.
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/hunter/viper_cloaker = (5 * GLOB.chaos_level)) // Your worst nightmare.
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/nurse/queen = (3 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/tarantula/emperor = (2 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/plasma = (1 * GLOB.chaos_level)) // Spider go boom! Very rare.
	return pickweight(mobs)
	/* All sums are of decimal values. These are the percent weights. 0.22 = 22% spawn chance. Please update this if any changes are made.

	  Total Weight sums: 175

	  Default Spider = 20/175 = 0.11 / 2 variants = 0.057
	  Hunter = 20/175 = 0.11 / 2 variants = 0.057 				Both share same weights, hence, split between both, are 0.57% individually.
	  Nurse = 15/175 = 0.085 / 4 variants = 0.021
  	  Midwife = 15/175 = 0.085 / 4 variants = 0.021
	  Orb Weaver = 15/175 = 0.085 / 4 variants = 0.021
	  Cloaker = 15/175 = 0.085 / 4 variants = 0.021				All 4 share same weights, hence, split between all 4, are 0.021% individually.
	  Tarantula = 10/175 = 0.057 / 4 variants = 0.014
	  Shocker = 10/175 = 0.057 / 4 variants = 0.014
	  Pepper = 10/175 = 0.057 / 4 variants = 0.014
	  Burrowing = 10/175 = 0.057 / 4 variants = 0.014			All 4 share same weights, hence, split between all 4, are 0.021% individually.
	  Carrier = 5/175 = 0.028 / 5 variants = 0.0057
	  Recluse = 5/175 = 0.028 / 5 variants = 0.0057
	  Pit = 5/175 = 0.028 / 5 variants = 0.0057
	  Cave Spider = 5/175 = 0.028 / 5 variants = 0.0057
	  Viper Cloaker = 5/175 = 0.028 / 5 variants = 0.0057		All 5 share same weights, hence, split between all 5, are 0.0057% individually.
	  Queen = 3/175 = 0.017
	  Viper = 2/175 = 0.01 / 3 variants = 0.0038
	  Ogre = 2/175 = 0.01 / 3 variants = 0.0038
	  Emperor = 2/175 = 0.01 / 3 variants = 0.0038 				All 3 share same weights, hence, split between all 3, are 0.0038% individually.
	  Plasma = 1/175 = 0.0057										Very rare. Plasma spiders cause big explosions and a lot of damage.

	NOTE!
		All mobs that are spawned under chaos levels have increased spawn rates based on the current chaos level. What may seem like a low spawn chance here,
		may in fact be much higher in-game. For example, plasma spiders, if chaos_level is set to 5, their spawn rate is instead "0.02", which isn't inherently
		a 2% chance, but has a higher chance to appear than normal.

	*/

/obj/random/mob/spiders/low_chance
	name = "low chance random spider"
	icon_state = "hostilemob-black-low"
	spawn_nothing_percentage = 50 // Lets gamble our fate evenly, shall we? To help populate a little more.

/obj/random/cluster/spiders
	name = "cluster of spiders"
	icon_state = "hostilemob-black-cluster"
	alpha = 128
	min_amount = 1
	max_amount = 4    // Same as roaches, compensation for variety amount and to reduce load on the Mobs subsystem.
	spread_range = 0

/obj/random/cluster/spiders/item_to_spawn()
	return /obj/random/mob/spiders

/obj/random/cluster/spiders/low_chance
	name = "low chance cluster of spiders"
	icon_state = "hostilemob-black-cluster-low"
	spawn_nothing_percentage = 50

/obj/random/mob/spiders/spider_ling //just sont have carrer
	name = "random spiderling spider"
	icon_state = "hostilemob-black"
	alpha = 128
	mobs = list(/mob/living/carbon/superior_animal/giant_spider = 35,\
				/mob/living/carbon/superior_animal/giant_spider/nurse = 30,\
				/mob/living/carbon/superior_animal/giant_spider/nurse/midwife = 15,\
				/mob/living/carbon/superior_animal/giant_spider/nurse/orb_weaver = 15,\
				/mob/living/carbon/superior_animal/giant_spider/hunter = 35,\
				/mob/living/carbon/superior_animal/giant_spider/tarantula = 10,\
				)

/obj/random/mob/spiders/spider_ling/item_to_spawn()
	if(GLOB.chaos_level > 1) //Higher weights as chaose increase
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/nurse/carrier = (8 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/nurse/recluse = (4 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/hunter/shocker = (10 * GLOB.chaos_level)) // The more supportive spiders come out.
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/hunter/pepper = (10 * GLOB.chaos_level))
	if(GLOB.chaos_level > 2)
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/hunter/cloaker = (12 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/tarantula/burrowing = (6 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/tarantula/pit = (4 * GLOB.chaos_level))
	if(GLOB.chaos_level > 3)
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/nurse/cave_spider = (4 * GLOB.chaos_level)) // Frost oil should be scary.
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/plasma = (2 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/hunter/viper = (2 * GLOB.chaos_level))     // More venomous, scary spiders occur here.
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/tarantula/ogre = (6 * GLOB.chaos_level))
	if(GLOB.chaos_level > 5) // These should only be active if players ever decide to vote on it.
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/hunter/viper_cloaker = (2 * GLOB.chaos_level)) // Your worst nightmare.
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/tarantula/emperor = (1 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/giant_spider/nurse/queen = (2 * GLOB.chaos_level))
	return pickweight(mobs)
