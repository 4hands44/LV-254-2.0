SUBSYSTEM_DEF(sun)
	name = "Sun"
	priority = SS_PRIORITY_LIGHTING
	runlevels = RUNLEVEL_GAME

/datum/controller/subsystem/sun/Initialize(timeofday)
	if(SSticker)
		SSticker.OnRoundstart(CALLBACK(src, PROC_REF(update_sun)))
	can_fire = FALSE
	return SS_INIT_SUCCESS

/datum/controller/subsystem/sun/proc/update_sun(time_text = null)
	var/list/operation_clock = splittext(time_text || worldtime2text(), ":")
	var/current_minutes = text2num(operation_clock[1]) * 60 + text2num(operation_clock[2])
	var/brightness = 0
	var/light_color = "#000000"
	switch(current_minutes)
		if(240 to 359)
			brightness = 1
			light_color = "#333399"
		if(360 to 479)
			brightness = 2
			light_color = "#FF9966"
		if(480 to 1230)
			brightness = 2
			light_color = "#FFEFD2"
		if(1231 to 1320)
			brightness = 1
			light_color = "#333399"
	apply_lighting(brightness, light_color)

/datum/controller/subsystem/sun/proc/apply_lighting(brightness, light_color)
	var/list/lightturfs = block(locate(world.maxx, world.maxy, 5), locate(1, 1, 2))
	for(var/atom/A as anything in lightturfs)
		if(istype(A.loc, /area/))
			var/area/targeted = A.loc
			if(!targeted.daytime_affected)
				lightturfs -= A
	for(var/turf/T as anything in lightturfs)
		T.set_light(1, brightness, l_color = light_color)
