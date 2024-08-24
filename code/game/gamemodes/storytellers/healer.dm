/datum/storyteller/healer
	config_tag = "healer"
	name = "The Healer"
	welcome = "Welcome to the Nadezhda colony! We hope you enjoy your stay!"
	description = "Peaceful and relaxed storyteller who will try to help the colony a little. Reduced chaos levels."

	GLOB.chaos_storyteller_gain_multiplier = 0.6 // Chaos Gain is heavily reduced by 33%, designated to keep rounds calm for a very extended duration.
	gain_mult_mundane = 1.2
	gain_mult_moderate = 0.7
	gain_mult_major = 0.6
	gain_mult_roleset = 0.3 //Antags are prone to hurt the colony. Should be much less of a focus. The "Chronicler" is the go to Antag storyteller anyways.


	repetition_multiplier = 0.95
	tag_weight_mults = list(TAG_COMBAT = 0.75, TAG_NEGATIVE = 0.5, TAG_POSITIVE = 2)

	//Healer will not send anything major until enough time has passed.
	points = list(
	EVENT_LEVEL_MUNDANE = 0, //Mundane
	EVENT_LEVEL_MODERATE = -15, //Moderate
	EVENT_LEVEL_MAJOR = -25, //Major
	EVENT_LEVEL_ROLESET = -999 //Roleset
	)
