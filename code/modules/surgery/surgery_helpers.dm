/proc/get_location_accessible(mob/victim, location = BP_CHEST, grabs = FALSE, skipundies = FALSE)
	var/covered_locations = NONE	//based on body_parts_covered
	if(iscarbon(victim))
		var/mob/living/carbon/carbon_victim = victim
		for(var/obj/item/equipped_item in carbon_victim.get_equipped_items())
			if(zone2covered(location, equipped_item.body_parts_covered))
				return FALSE
		if(ishuman(carbon_victim))
			var/mob/living/carbon/human/human_victim = carbon_victim
			if(!skipundies)
				if(human_victim.worn_underwear)
					covered_locations |= BP_GROIN
			if(grabs)
				for(var/obj/item/grab/grabbing in human_victim.grabbed_by)
					if(grabbing.last_hit_zone == BP_GROIN)
						covered_locations |= BP_GROIN
					if(grabbing.last_hit_zone == BP_MOUTH)
						covered_locations |= BP_MOUTH
			if(zone2covered(location, covered_locations))
				return FALSE
	return TRUE

/proc/zone2covered(location, covered_locations)
	switch(location)
		if(BP_HEAD)
			if(covered_locations & HEAD)
				return TRUE
		if(BP_HEAD)
			if(covered_locations & EARS)
				return TRUE
		if(BP_EYES)
			if(covered_locations & EYES)
				return TRUE
		if(BP_MOUTH)
			if(covered_locations & FACE)
				return TRUE
		if(BP_CHEST)
			if(covered_locations & UPPER_TORSO)
				return TRUE
		if(BP_GROIN)
			if(covered_locations & LOWER_TORSO)
				return TRUE
		if(BP_L_ARM)
			if(covered_locations & ARM_LEFT)
				return TRUE
		if(BP_R_ARM)
			if(covered_locations & ARM_RIGHT)
				return TRUE
		if(BP_L_LEG)
			if(covered_locations & LEG_LEFT)
				return TRUE
		if(BP_R_LEG)
			if(covered_locations & LEG_RIGHT)
				return TRUE
		if(BP_L_HAND)
			if(covered_locations & ARMS)
				return TRUE
		if(BP_R_HAND)
			if(covered_locations & ARMS)
				return TRUE
		if(BP_L_FOOT)
			if(covered_locations & LEGS)
				return TRUE
		if(BP_R_FOOT)
			if(covered_locations & LEGS)
				return TRUE

	return FALSE
