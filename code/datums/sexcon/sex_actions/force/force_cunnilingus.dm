/datum/sex_action/force_cunnilingus
	name = "Force them to suck"
	require_grab = TRUE
	stamina_cost = 1.0

/datum/sex_action/force_cunnilingus/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user == target)
		return FALSE
	if(!user.organ_list_by_process(OP_VAGINA))
		return FALSE
	return TRUE

/datum/sex_action/force_cunnilingus/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(user, BP_GROIN))
		return FALSE
	if(!get_location_accessible(target, BP_MOUTH))
		return FALSE
	if(!user.organ_list_by_process(OP_VAGINA))
		return FALSE
	return TRUE

/datum/sex_action/force_cunnilingus/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] forces [target]'s head against her cunt!"))

/datum/sex_action/force_cunnilingus/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] forces [target] to suck her cunt."))
	target.make_sucking_noise()

	user.sexcon.perform_sex_action(user, 2, 4, TRUE)
	user.sexcon.handle_passive_ejaculation()

	user.sexcon.perform_sex_action(target, 0, 2, FALSE)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/force_cunnilingus/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] pulls [target]'s head away."))

/datum/sex_action/force_cunnilingus/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE
