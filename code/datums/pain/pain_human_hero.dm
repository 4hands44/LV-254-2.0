/datum/pain/human_hero
	max_pain = 1000

	threshold_mild = null
	threshold_discomforting = null
	threshold_moderate = null
	threshold_distressing = null
	threshold_severe = null
	threshold_horrible = null

	feels_pain = FALSE

/datum/pain/human_hero/apply_pain(amount = 0, type = BRUTE)
	return FALSE

/datum/pain/human_hero/lesser
	max_pain = 600

	threshold_mild = null
	threshold_discomforting = null
	threshold_moderate = null
	threshold_distressing = null
	threshold_severe = 200
	threshold_horrible = 400

	feels_pain = FALSE

/datum/pain/human_hero/lesser/activate_severe()
	new /datum/effects/pain/human/discomforting(source_mob)

/datum/pain/human_hero/lesser/activate_horrible()
	pain_slowdown = PAIN_SPEED_LOW
	new /datum/effects/pain/human/distressing(source_mob)
