/mob/living/carbon/superior_animal/roach/hunter
	name = "Jager Roach"
	desc = "A monstrous, dog-sized cockroach. This one has bigger claws."
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
	armor_penetration = 1.2
