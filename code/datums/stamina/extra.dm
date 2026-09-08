/datum/stamina/extra
	current_stamina = 250
	max_stamina = 250
	current_level = STAMINA_LEVEL_1

	stamina_levels = list(
		STAMINA_LEVEL_1 = 250,
		STAMINA_LEVEL_2 = 150,
		STAMINA_LEVEL_3 = 100,
		STAMINA_LEVEL_4 = 50,
		STAMINA_LEVEL_5 = 0
	)

/datum/stamina/extra/process()
	. = ..()
/datum/stamina/extra/apply_damage()
	. = ..()
/datum/stamina/extra/update_stamina_level()
	. = ..()
/datum/stamina/extra/activate_stamina_debuff()
	. = ..()
