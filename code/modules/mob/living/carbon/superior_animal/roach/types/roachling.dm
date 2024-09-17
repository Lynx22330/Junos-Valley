/mob/living/carbon/superior_animal/roach/roachling
	name = "Roachling"
	desc = "A tiny cockroach. It never stays still for long."
	icon_state = "roachling"

	turns_per_move = 3
	maxHealth = 25 * ROACH_HEALTH_MOD
	health = 25 * ROACH_HEALTH_MOD
	move_to_delay = 3.5

	knockdown_odds = 3
	melee_damage_lower = 2
	melee_damage_upper = 3

	armor = list(melee = 1, bullet = 0, energy = 0, bomb = 0, bio = 5, rad = 0, agony = 0)

	meat_type = /obj/item/reagent_containers/food/snacks/meat/roachmeat
	meat_amount = 1
	eating_time = 90 SECONDS //Takes less time
	life_cycles_before_sleep = 800 //We need more time to eat
	probability_egg_laying = 95 //We are the quickest are we dont want to waste eggs!
	var/amount_grown = 0
	var/big_boss = FALSE



/mob/living/carbon/superior_animal/roach/roachling/Life()
	.=..()
	if(!stat)
		amount_grown += rand(0,2) // Roachling growing up

		if(amount_grown >= 50) // Old enough to turn into an adult
			var/spawn_type
			if (fed > 0) // If roachling has eaten a corpse
				if (big_boss == TRUE && prob(fed)) // has eaten a fuhrer roach and has eaten a bunch otherwise
					spawn_type = /mob/living/carbon/superior_animal/roach/kaiser// or got lucky
				spawn_type += list(/mob/living/carbon/superior_animal/roach = 9,
				/mob/living/carbon/superior_animal/roach/tank = 2,
				/mob/living/carbon/superior_animal/roach/toxic = 2,
				/mob/living/carbon/superior_animal/roach/hunter = 4)
				if(GLOB.chaos_level > 1) //Higher weights as chaose increase
					spawn_type += list(/mob/living/carbon/superior_animal/roach/fuhrer = (0.5 * GLOB.chaos_level)) //They finally get some order.
				if(GLOB.chaos_level > 2)
					spawn_type += list(/mob/living/carbon/superior_animal/roach/nitro = (0.5 * GLOB.chaos_level))
					spawn_type += list(/mob/living/carbon/superior_animal/roach/glowing = (2 * GLOB.chaos_level)) // This is where the more supportive roaches begin.
					spawn_type += list(/mob/living/carbon/superior_animal/roach/support = (2 * GLOB.chaos_level))
				if(GLOB.chaos_level > 3)
					spawn_type += list(/mob/living/carbon/superior_animal/roach/nanite = (0.2 * GLOB.chaos_level))
					spawn_type += list(/mob/living/carbon/superior_animal/roach/elektromagnetisch = (0.2 * GLOB.chaos_level))
				if(GLOB.chaos_level > 5) // These should only be active if players ever decide to vote on it.
					spawn_type += list(/mob/living/carbon/superior_animal/roach/kaiser = (0.02 * GLOB.chaos_level)) //0.10, then 0.12, 0.14, so on, so forth. Starts off 0.1% chance spawning.
					spawn_type += list(/mob/living/carbon/superior_animal/roach/tazntz = (1 * GLOB.chaos_level)) // The roaches are now mutating. True chaos unfolds.
					spawn_type += list(/mob/living/carbon/superior_animal/roach/bluespace = (0.05 * GLOB.chaos_level)) // Teleporting Roaches? Chaos... Chaos!
				return pickweight(spawn_type)



			if (ispath(spawn_type, /mob/living/carbon/superior_animal/roach))
				new spawn_type(src.loc, src, list("friends" = src.friends.Copy()))
			else if(ispath(spawn_type, /mob))
				var/mob/living/carbon/superior_animal/roach/roach = new spawn_type(src.loc, src)
				roach.friends += src.friends
			qdel(src)
