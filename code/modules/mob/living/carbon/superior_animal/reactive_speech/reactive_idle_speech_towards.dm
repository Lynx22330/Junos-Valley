// The way this is layed out is that mobs will choose a random topic to listen and respond to based on a probability from the first words spoken.
// This is essentially a new way of worldbuilding by no longer having the mobs remain as idle, and boring entities for when players are playing.
// Please begin by looking into reactive_idle_speech_towards.dm to understand how this works.
// HEY look! You're here!


// To start, pick the first topic. It should generally be of the same thing, just reflavored in different ways.

// Then, once we pick the first topic, we go to reactive_idle_speech_back.dm

//Topic: "When and what did you eat?"
/mob/living/carbon/superior_animal/var/list/reactive_idle_speech_towards_0 = list(
	"Hey, when's the last time you've eaten?",
	"Man I'm starving. When's the last time you've eaten?",
	"Ugh my stomach is cramping... I can't remember the last time we ate, can you?",
	"Food. Food's a good starter. What's the last thing you ate?"
)


/mob/living/carbon/superior_animal/var/list/reactive_idle_speech_towards_1 = list(
)
