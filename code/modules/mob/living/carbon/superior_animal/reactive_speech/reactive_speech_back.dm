// The way this is layed out is that mobs will choose a random topic to listen and respond to based on a probability from the first words spoken.
// This is essentially a new way of worldbuilding by no longer having the mobs remain as idle, and boring entities for when players are playing.
// Please begin by looking into reactive_idle_speech_towards.dm to understand how this works.

/mob/living/carbon/superior_animal/var/list/reactive_speech_back_0 = list(
	"I'll gut you!",
	"I'll pop your eyes out of your skull!",
	"Can't wait to skin your fingers off with a potato peeler!"
)

/mob/living/carbon/superior_animal/var/list/reactive_speech_back_1 = list(
	"Fuck off.",
	"Bugger off."
)

/mob/living/carbon/superior_animal/var/list/reactive_speech_back_2 = list(
	"No clue, don't care.",
	"Didn't ask.",
	"Pipe it, dweeb."
)

/mob/living/carbon/superior_animal/var/list/reactive_speech_back_3 = list(
	"Excuse me?",
	"Disgusting."
)
