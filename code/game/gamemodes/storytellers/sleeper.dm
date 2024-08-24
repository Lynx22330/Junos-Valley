/datum/storyteller/sleeper
	config_tag = "sleeper"
	name = "The Sleeper"
	welcome = "Welcome to the Nadezhda colony! It's going to be a quiet day"
	description = "A passive storyteller that does almost nothing. It will be a very uneventful day."


	GLOB.chaos_storyteller_gain_multiplier = 0.90 // 10% less chaos. Keeping things relatively tame, but not for a long time unlike the Healer.

	gain_mult_mundane = 0.7
	gain_mult_moderate = 0.4
	gain_mult_major = 0.3
	gain_mult_roleset = 0.1    // Antags should rarely occur here, it is, afterall, a very uneventful day.
	event_schedule_delay = 60 // Events could possibly stack between each hour. Gives a long time before something occurs.
