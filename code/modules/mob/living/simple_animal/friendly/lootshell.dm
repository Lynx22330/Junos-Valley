/mob/living/simple_animal/lootshell
	name = "loot shell"
	desc = "It's a loot shell! Quick, kill it before it escapes! Or, capture it! They're quite valuable pets!"
	icon_state = "lootshell"
	icon_dead = "lootshell_dead"
	maxHealth = 100
	health = 100
	response_help = "jangles"
	response_disarm = "gently pushes"
	response_harm = "passively smacks"
	harm_intent_damage = 0.1  // I mean. If it really wanted to hit something...
	melee_damage_lower = 0
	melee_damage_upper = 0.1
	attacktext = list("slugged")
	speak_chance = 1
	speak = list("Fweeeeee!",
				"Fppbbl!",
				"Fppplb!")
	emote_hear = list("glorbles!","jangles.")
	emote_see = list("glimmers gently","stares around with immense paranoia")
	colony_friend = TRUE
	can_burrow = TRUE    // They aren't meant to be easy to catch, y'know!
	sanity_damage = -1
