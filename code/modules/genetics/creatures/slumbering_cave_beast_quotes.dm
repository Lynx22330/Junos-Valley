
//This to add more quotes.
// "\" Words go here. \""
//	"\" \""
/mob/living/carbon/superior_animal/genetics/fratellis/slumber

	//"Slumber" can speak. They are an ancient beast, after all.
	var/speech_cooldown = 5

	//This may seem redundant, but I do not want people spamming "doesn't respond" emotes over and over.
	var/spam_prevention = 3

	//Every so often we give some idle chatter.
	var/idle_chatter

	//Context sensitive variables for speech progression.
	var/greeted = FALSE
	var/greet_duration

	var/list/idle_cave_beast = list(
		"\"If you need any help... I am welcome to provide you <B>Knowledge</B>... Just ask...  \""
	)

	//We say hello to 'Slumber'
	var/list/greeting_cave_beast = list(
		"hello",
		"slumberson",
		"slum slum",
		"slumby",
		"slumbies",
		"hey slum",
		"whats up slum",
		"greetings"

	)

	var/list/greeting_cave_beast_response = list(
		"\"Greetings...\"",
		"\"Hello...\"",
		"\"Welcome...\"",
		"\"A pleasure to meet you...\""

	)

	//We ask who is 'Slumber'.
	var/list/whois_cave_beast = list(
		"what are you",
		"who are you",
		"what the fuck are you",
		"what the hell are you",
		"what is you"

	)


	var/list/whois_cave_beast_response = list(

		"\"I... am Slumber.\"",
		"\"Slumber... \"",
		"\"It is... Slumber. \""

	)

	//We tell 'Slumber' our name, because we are nice. Or... what our name should be.
	var/list/namegiven_cave_beast = list(
		"my name is,",
		"my name is",
		"m'names,",
		"m'names",
		"name is,",
		"name is"
	)

	var/list/namegiven_cave_beast_response = list(
		"\"... How peculiar.\"",
		"\", a fine name...\"",
		"\", a fitting name...\"",
		"\"? Quite a name.\""
	)

	//We ask 'Slumber' for some random advice. Or question their intelligence.
	var/list/advice_cave_beast = list(
		"are you smart",
		"how smart are you",
		"share advice",
		"share tips",
		"share knowledge",
		"advice"

	)

	var/list/advice_cave_beast_response = list(
		"\" Ah, I know... I have always seen... You colonists carrying medkits in your bags. They are life savers... You should never travel without one... They are the difference between life... and death...\"",
		"\" Mmm... A gun is only as deadly as the one who wields it... Be Vigilant... So you can see the finer details, how your gun reloads... How you hold your grip on your weapon... And how precise your shots are... \"",
		"\" Hm... Ah, you know... I've watched you colonists grab bears and throw them... Onto landmines... Exploding them into a shower of gore... Perhaps you could try it... Just be wary to not do it when its right next to you... More as a last resort... \"",
		"\" Hmmh... Well, I know that shields are your best friend... I've seen battles of you colonists fighting Renders... Clashing claws against metal... It's quite a sight indeed, yet... Be warned. I've also seen a weakling take a shield, only to get pummeled and torn... In two, because they lacked the Toughness... \""

	)

	//Good morning Slumber!
	var/list/goodmorning_cave_beast = list(
		"good morning",
		"mornin'"

	)

	var/list/goodmorning_cave_beast_response = list(
		"\"Good morning...\"",
		"\"Ah, good morning...\"",
		"\"Mmm... I hadn't seen the sun in ages... But good morning.\"",
		"\"If only the light would bleed through the cavern further... Good Morning, nonetheless.\"",
		"\"Mhm... Good morning.\""
	)

	//Good day Slumber!
	var/list/goodafternoon_cave_beast = list(
		"good afternoon",
		"good day",
		"g'day"


	)

	var/list/goodafternoon_cave_beast_response = list(
		"\"Mmm... Good Afternoon...\"",
		"\"Noon... I can feel its warmth only subtly seep into the cavern...\"",
		"\"Hm... I wonder what it looks like outside... Hope the day has been treating you well, regardless.\"",
		"\"I used to bask in the sun... Now I bask in the shadows... A shame...\""

	)

	//Good night Slumber!
	var/list/goodnight_cave_beast = list(
		"goodnight",
		"night",
		"sleep well",
		"rest well"

	)

	var/list/goodnight_cave_beast_response = list(
		"\"Good night...\"",
		"\"Sleep well...\"",
		"\"Assuming you're leaving... May I see you again... Goodnight.\""

	)
