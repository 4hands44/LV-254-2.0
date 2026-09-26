/datum/weather_ss_map_holder/point_rain
	name = "Point Rain Map Holder"

	warn_time = 1 MINUTES
	min_time_between_events = 12 MINUTES
	min_time_between_checks = 0
	min_check_variance = 0

	no_weather_turf_icon_state = "strata_clearsky"

	potential_weather_events = list(
		/datum/weather_event/costal_fog,
		/datum/weather_event/costal_rain,
		/datum/weather_event/costal_acid_rain,
	)

/datum/weather_ss_map_holder/point_rain/should_affect_area(area/A)
	return !CEILING_IS_PROTECTED(A.ceiling, CEILING_GLASS)

/datum/weather_ss_map_holder/point_rain/should_start_event()
	return prob(PROB_WEATHER_LV624)
