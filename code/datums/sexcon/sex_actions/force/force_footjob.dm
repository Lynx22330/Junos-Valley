/datum/sex_action/force_footjob
	name = "Use their feet to get off"
	check_same_tile = FALSE
	require_grab = TRUE
	stamina_cost = 1.0

/datum/sex_action/force_footjob/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user == target)
		return FALSE
	if(!user.organ_list_by_process(OP_PENIS))
		return
	return TRUE

/datum/sex_action/force_footjob/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(target, BP_L_FOOT))
		return FALSE
	if(!get_location_accessible(target, BP_R_FOOT))
		return FALSE
	if(!get_location_accessible(user, BP_GROIN))
		return FALSE
	if(!user.organ_list_by_process(OP_PENIS))
		return
	return TRUE

/datum/sex_action/force_footjob/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] grabs [target]'s feet and clamps them around their cock!"))

/datum/sex_action/force_footjob/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] uses [target] feet to jerk off."))
	playsound(user, 'sound/misc/mat/fingering.ogg', 20, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(user, 2, 4, TRUE)
	user.sexcon.handle_passive_ejaculation()

/datum/sex_action/force_footjob/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] pulls their cock out from inbetween [target]'s feet."))
