/obj/random/mob/spiders
	name = "random spider"
	icon_state = "hostilemob-black"
	alpha = 128
	mobs = list(/mob/living/carbon/superior_animal/giant_spider = 35,\
				/mob/living/carbon/superior_animal/giant_spider/nurse = 30,\
				/mob/living/carbon/superior_animal/giant_spider/nurse/midwife = 15,\
				/mob/living/carbon/superior_animal/giant_spider/nurse/orb_weaver = 15,\
				/mob/living/carbon/superior_animal/giant_spider/hunter = 35,\
				/mob/living/carbon/superior_animal/giant_spider/tarantula = 10,\
				)

/obj/random/mob/spiders/item_to_spawn()
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
