/datum/storyteller/jester
	config_tag = "jester"
	name = "The Jester"
	welcome = "Welcome to the house of fun. We're all mad here!"
	description = "Aggressive and chaotic storyteller who generates a larger quantity of random events."

	GLOB.chaos_storyteller_gain_multiplier = 1.5 // 50% more chaos. Just a bit more.
	gain_mult_mundane = 1.2
	gain_mult_moderate = 1.2
	gain_mult_major = 1.2

	variance = 0.25
	repetition_multiplier = 0.65
	event_schedule_delay = 25      //Jester is chaotic. Shit might just happen on top of eachother pretty closely, especially with reduced combat events. Helps with more 'goofy' events when they are eventually introduced.

	tag_weight_mults = list(TAG_COMBAT = 0.50) // Combat should occur less due to the increase in chaos. This is, afterall, not the Warrior. This simply has more events.

	//Jester generates lots of random events, but not so many antags
	points = list(
	EVENT_LEVEL_MUNDANE = 15, //Mundane
	EVENT_LEVEL_MODERATE = 35, //Moderate
	EVENT_LEVEL_MAJOR = 75, //Major
	EVENT_LEVEL_ROLESET = -999 //Roleset
	)
