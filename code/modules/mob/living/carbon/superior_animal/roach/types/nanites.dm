/mob/living/carbon/superior_animal/roach/nanite
	name = "Kraftwerk Roach"
	desc = "A deformed mess of a roach that is covered in metallic outcrops and formations. It seems to have a production center on its thorax."
	icon_state = "naniteroach"

	meat_type = /obj/item/reagent_containers/food/snacks/meat/roachmeat/kraftwerk
	meat_amount = 3
	turns_per_move = 1
	maxHealth = 145 * ROACH_HEALTH_MOD
	health = 145 * ROACH_HEALTH_MOD      // More HP to accomodate their rarity and ability to swarm people with weaker flies.

	knockdown_odds = 3
	melee_damage_lower = 15
	melee_damage_upper = 20             // We are robotic. We have sharp, metallic pincers designed for piercing through metal.

	blattedin_revives_left = 1

	breath_required_type = NONE
	breath_poison_type = NONE
	min_breath_required_type = 0
	min_breath_poison_type = 0

	min_air_pressure = 0
	min_bodytemperature = 0
	armor_divisor = 2
	never_stimulate_air = TRUE

	var/list/nanite_swarms = list()
	var/max_swarms = 5

/mob/living/carbon/superior_animal/roach/nanite/UnarmedAttack(atom/A, proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(33) && nanite_swarms.len < max_swarms)
			var/sound/screech = pick('sound/machines/robots/robot_talk_light1.ogg','sound/machines/robots/robot_talk_light2.ogg','sound/machines/robots/robot_talk_heavy4.ogg')
			playsound(src, screech, 30, 1, -3)
			var/mob/living/simple_animal/hostile/naniteswarm/M = new /mob/living/simple_animal/hostile/naniteswarm(get_turf(src), src)
			nanite_swarms.Add(M)
			M.friends += friends
			say("10101010011100010101")

/mob/living/carbon/superior_animal/roach/nanite/death()
	for(var/mob/living/simple_animal/hostile/naniteswarm/NS in nanite_swarms)
		nanite_swarms.Remove(NS)
		NS.gib()
	..()

/mob/living/carbon/superior_animal/roach/nanite/Destroy()
	for(var/mob/living/simple_animal/hostile/naniteswarm/NS in nanite_swarms)
		nanite_swarms.Remove(NS)
		NS.gib()
	.=..()


/mob/living/simple_animal/hostile/naniteswarm
	name = "nanite infested miniroach cluster"
	desc = "A swarm of disgusting locusts infested with nanomachines."
	icon = 'icons/mob/mobs-roach.dmi'
	icon_state = "naniteswarm"
	icon_living = "naniteswarm"
	pass_flags = PASSTABLE
	density = FALSE
	health = 30
	maxHealth = 30
	melee_damage_lower = 2
	melee_damage_upper = 4
	attacktext = "cut"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	faction = "roach"

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	cant_gib = TRUE

	var/mob/living/carbon/superior_animal/roach/nanite/parent

/mob/living/simple_animal/hostile/naniteswarm/New(loc, nuparent)
	..()
	parent = nuparent

/mob/living/simple_animal/hostile/naniteswarm/death()
	..()
	if(parent)
		parent.nanite_swarms.Remove(src)
		parent.friends.Remove(src)
		parent = null
	new /obj/effect/decal/cleanable/blood/oil(get_turf(src))
	qdel(src)

/mob/living/simple_animal/hostile/naniteswarm/Destroy()
	if(parent)
		parent.nanite_swarms.Remove(src)
		parent.friends.Remove(src)
		parent = null
	.=..()

/mob/living/simple_animal/hostile/naniteswarm/UnarmedAttack(atom/A, proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(20))
			var/sound/screech = pick('sound/machines/robots/robot_talk_light1.ogg','sound/machines/robots/robot_talk_light2.ogg','sound/machines/robots/robot_talk_heavy4.ogg')
			playsound(src, screech, 15, 1, -3)
			say("11010")
