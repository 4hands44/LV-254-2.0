/client/proc/change_lighting()
	set name = "Set Daylight"
	set category = "Admin.Events"

	if(!check_rights(R_ADMIN))
		return
	var/list/preset = list(
		"00:00 - 04:00 (Night)" = "00:00",
		"04:00 - 06:00 (Dawn)" = "04:00",
		"06:00 - 08:00 (Sunrise)" = "06:00",
		"08:00 - 20:30 (Day)" = "08:00",
		"20:31 - 22:00 (Dusk)" = "20:31",
		"22:00 - 00:00 (Night)" = "22:00"
	)
	var/lighting_mode = tgui_input_list(usr, "Choose how to set daylight.", "Daylight Mode", list(
		"Manual",
		"Preset"
	))
	if(!lighting_mode)
		return FALSE

	if(lighting_mode == "Preset")
		var/preset_choice = tgui_input_list(usr, "Choose a time-of-day preset.", "Daylight Preset", preset)
		if(!preset_choice)
			return FALSE
		var/confirm_preset = tgui_alert(usr, "Apply the [preset_choice] lighting preset?", "Confirm", list("Yes", "No"), 1 HOURS)
		if(confirm_preset != "Yes")
			return FALSE
		var/preset_time = preset[preset_choice]
		GLOB.time_offset = text2duration(preset_time) - world.time
		SSsun.update_sun(preset_time)
		message_admins("[key_name(usr)] applied the [preset_choice] daylight preset.")
		return TRUE

	var/light_str = input(usr, "Set the light power.", "Daytime Brightness", "0.3") as null|num
	var/color_source = tgui_input_list(usr, "Choose the manual daylight color source.", "Daylight Color", list(
		"Custom color",
		"Sunlight palette"
	))
	if(!color_source)
		return FALSE
	var/daytime_color
	if(color_source == "Sunlight palette")
		var/list/sunlight_palette = list(
			"Night" = "#000000",
			"Dawn / Dusk" = "#333399",
			"Sunrise" = "#FF9966",
			"Day" = "#FFEFD2"
		)
		var/palette_choice = tgui_input_list(usr, "Choose a sunlight palette color.", "Daylight Color", sunlight_palette)
		if(!palette_choice)
			return FALSE
		daytime_color = sunlight_palette[palette_choice]
	else
		daytime_color = input(usr, "Please select the color to use.", "Daytime Color") as color|null
		if(!daytime_color)
			return FALSE
	var/new_time = input(usr, "Optionally enter a new operation time (HH:MM), or leave blank to keep the current time.", "Operation Time", "") as null|text
	var/new_time_offset
	if(new_time)
		var/list/time_parts = splittext(new_time, ":")
		if(length(time_parts) != 2 || text2num(time_parts[1]) < 0 || text2num(time_parts[1]) > 23 || text2num(time_parts[2]) < 0 || text2num(time_parts[2]) > 59)
			to_chat(usr, SPAN_WARNING("Enter a valid operation time in the 24 hour HH:MM format. ie. 14:32"))
			return FALSE
		new_time_offset = text2duration(new_time) - world.time
	var/confirm = tgui_alert(usr, "Are you sure you wish to change daytime on the map to these settings?, THIS WILL LAG, and may take some time to update all tiles.", "Confirm", list("Yes", "No"), 1 HOURS)
	if(confirm != "Yes")
		return FALSE
	if(!isnull(new_time_offset))
		GLOB.time_offset = new_time_offset
	message_admins("[key_name(usr)] changed lighting on map to [daytime_color] color with [light_str].")
	SSsun.apply_lighting(light_str, daytime_color)
	return TRUE
