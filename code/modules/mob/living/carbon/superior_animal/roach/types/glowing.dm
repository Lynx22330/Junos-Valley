/mob/living/carbon/superior_animal/roach/glowing
	name = "Gluhend Roach"
	desc = "A huge dog-sized roach that has been exposed to radiation, becoming stronger and glowing sickly green from exposure."
	icon_state = "glowingroach"
	light_range = 2
	light_color = COLOR_LIGHTING_GREEN_DARK

	meat_amount = 3
	turns_per_move = 1
	maxHealth = 45
	health = 45

	contaminant_immunity = TRUE

	knockdown_odds = 3
	melee_damage_lower = 3
	melee_damage_upper = 7 //Weaker than hunter

/mob/living/carbon/superior_animal/roach/glowing/UnarmedAttack(var/atom/A, var/proximity)
	. = ..()

	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(25))
			var/damage = rand(melee_damage_lower, melee_damage_upper)
			L.damage_through_armor(damage, TOX)
			playsound(src, 'sound/voice/insect_battle_screeching.ogg', 30, 1, -3)
			L.visible_message(SPAN_DANGER("\the [src] globs up some toxic bile all over \the [L]!"))