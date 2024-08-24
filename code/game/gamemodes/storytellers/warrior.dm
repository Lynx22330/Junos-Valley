/datum/storyteller/warrior
	config_tag = "warrior"
	name = "The Warrior"
	welcome = "Ready your weapons, and prepare for battle..."
	description = "Aggressive storyteller with a focus on generating monsters and antagonists that will do battle with the colonists."

	multipliergain = 1.5 // 50% chaos for more variants sooner. Intended to actually focus on fighting and for spawning many events.

	gain_mult_mundane = 1.1
	gain_mult_moderate = 1.5   // Very aggressive focus on moderate events, mundane events can still occur however.
	gain_mult_major = 1.5      // Major events are on par with Moderate events.
	gain_mult_roleset = 1.3
	event_schedule_delay = 35 // Events happen more frequently as opposed to the 45 minutes.

	repetition_multiplier = 0.90

	tag_weight_mults = list(TAG_COMBAT = 1.75)

	//Warrior has starting values that will cause moderate and major events very early in the round
	points = list(
	EVENT_LEVEL_MUNDANE = 0, //Mundane
	EVENT_LEVEL_MODERATE = 35, //Moderate
	EVENT_LEVEL_MAJOR = 75, //Major
	EVENT_LEVEL_ROLESET = -999 //Roleset
	)
