

/datum/weather_event/costal_fog
	name = "Heavy Fog"
	display_name = "Heavy Fog"
	length = 15 MINUTES
	fullscreen_type = /atom/movable/screen/fullscreen/weather/high
	turf_overlay_icon_state = "common_fog"
	turf_overlay_alpha = 120

	effect_message = "You feel the damp humid air stick to your skin."
	damage_per_tick = 0
	damage_type = BRUTE

	ambience = 'sound/ambience/coastal_fog.ogg'

	fire_smothering_strength = 1

/datum/weather_event/costal_rain
	name = "Costal Rain Storm"
	display_name = "Costal Rain Storm"
	length = 20 MINUTES
	fullscreen_type = /atom/movable/screen/fullscreen/weather/high

	turf_overlay_icon_state = "strata_storm"
	turf_overlay_alpha = 115

	effect_message = null
	damage_per_tick = 0


	ambience = 'sound/ambience/costal_rain.ogg'

	has_process = TRUE
	lightning_chance = 6

	fire_smothering_strength = 4

/datum/weather_event/costal_acid_rain
	name = "Acid rain Warning"
	display_name = "Acid rain Warning"
	length = 6 MINUTES
	fullscreen_type = /atom/movable/screen/fullscreen/weather/high

	turf_overlay_icon_state = "strata_storm"
	turf_overlay_alpha = 115

	effect_message = "The rain sizzles and hisses as it burns your skin."
	damage_per_tick = 1
	damage_type = BURN


	ambience = 'sound/ambience/costal_rain.ogg'

	has_process = TRUE
	lightning_chance = 6

	fire_smothering_strength = 4
