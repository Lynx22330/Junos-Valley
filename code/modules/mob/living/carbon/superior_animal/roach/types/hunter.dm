/mob/living/carbon/superior_animal/roach/hunter
	name = "Jager Roach"
	desc = "A monstrous, dog-sized cockroach, notorious for its spider hunting abilities. This one has bigger claws, and specially curved pincers."
	icon_state = "jager"

	turns_per_move = 1 // Should always be moving, actively hunting for their next host.
	maxHealth = 45 * ROACH_HEALTH_MOD
	health = 45 * ROACH_HEALTH_MOD
	move_to_delay = 3  // A fast mob. Meant for hunting and chasing down prey.

	blattedin_revives_left = 2

	knockdown_odds = 0		 // We are hunters, we kill, not cap.
	melee_damage_lower = 6   // We are hunters, meant to kill, not meant to tickle.
	melee_damage_upper = 10

	meat_type = /obj/item/reagent_containers/food/snacks/meat/roachmeat/jager
	meat_amount = 3
	armor_penetration = 2

/mob/living/carbon/superior_animal/roach/hunter/UnarmedAttack(var/atom/A, var/proximity)
	. = ..()
	if(isliving(A))
		var/mob/living/L = A
		if(issuperiorspider(L))
			var/damage = rand(melee_damage_lower, melee_damage_upper) + 10 //Bonus damage vs spiders
			L.damage_through_armor(damage, BRUTE)
			playsound(src, 'sound/voice/insect_battle_screeching.ogg', 30, 1, -3)
			L.visible_message(SPAN_DANGER("\the [src] pierces with its mandibles into \the [L] exoskeleton!"))
