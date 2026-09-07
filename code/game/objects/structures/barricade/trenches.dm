#define TRENCH_STAGE_POSTS 0
#define TRENCH_STAGE_DIG 1
#define TRENCH_STAGE_PANELS 2
#define TRENCH_STAGE_SCREWDRIVER 3
#define TRENCH_STAGE_FINAL 4
#define TRENCH_STAGE_CREATE 5

/obj/structure/trench_frame
	name = "Wooden Trench Frame"
	icon = 'icons/obj/structures/trenches.dmi'
	unslashable = FALSE
	wrenchable = FALSE
	unacidable = FALSE
	breakable = TRUE
	health = 500
	anchored = TRUE
	debris = list(/obj/item/stack/sheet/wood, /obj/item/stack/sheet/wood)
	throwpass = 1
	projectile_coverage = PROJECTILE_COVERAGE_MEDIUM
	can_block_movement = TRUE
	var/stage = 0
	icon_state = "build_0"

/obj/structure/trench_frame/Initialize()
	update_icon()
	return ..()

/obj/structure/trench_frame/update_icon()
	. = ..()
	icon_state = "build_[stage]"

	overlays.Cut()

/obj/structure/trench_frame/attackby(obj/item/item, mob/user)
	if(user.action_busy)
		return

	if(istool(item) && !skillcheck(user, SKILL_CONSTRUCTION, SKILL_CONSTRUCTION_DEFAULT))
		to_chat(user, SPAN_WARNING("You are not trained to configure [src]..."))
		return TRUE

	switch(stage)
		if(TRENCH_STAGE_POSTS)
			if(!istype(item, /obj/item/tool/shovel))
				return

			to_chat(user, SPAN_NOTICE("You start digging."))
			playsound(user.loc, 'sound/effects/thud.ogg', 40, 1, 6)

			if(!do_after(user, 5 SECONDS * user.get_skill_duration_multiplier(SKILL_CONSTRUCTION), INTERRUPT_NO_NEEDHAND|BEHAVIOR_IMMOBILE, BUSY_ICON_FRIENDLY, src))
				return

			to_chat(user, SPAN_NOTICE("You dig the [src]."))
			stage = TRENCH_STAGE_DIG
			update_icon()

	switch(stage)
		if(TRENCH_STAGE_DIG)
			if(!istype(item, /obj/item/tool/shovel))
				return

			to_chat(user, SPAN_NOTICE("You start digging."))
			playsound(user.loc, 'sound/effects/thud.ogg', 40, 1, 6)

			if(!do_after(user, 25 SECONDS * user.get_skill_duration_multiplier(SKILL_CONSTRUCTION), INTERRUPT_NO_NEEDHAND|BEHAVIOR_IMMOBILE, BUSY_ICON_FRIENDLY, src))
				return

			to_chat(user, SPAN_NOTICE("You dig the [src]."))
			stage = TRENCH_STAGE_PANELS
			update_icon()

	switch(stage)
		if(TRENCH_STAGE_PANELS)
			if(!istype(item, /obj/item/stack/tile/wood))
				return

			var/obj/item/stack/tile/wood/panels = item

			to_chat(user, SPAN_NOTICE("You start adding wood panels to sides walls of [src]."))
			playsound(loc, 'sound/items/Screwdriver.ogg', 25, 1)

			if(!do_after(user, 10 SECONDS * user.get_skill_duration_multiplier(SKILL_CONSTRUCTION), INTERRUPT_NO_NEEDHAND|BEHAVIOR_IMMOBILE, BUSY_ICON_FRIENDLY, src))
				return

			if(panels.use(4))
				to_chat(user, SPAN_NOTICE("You add some panels to [src]."))
				stage = TRENCH_STAGE_SCREWDRIVER
				update_icon()
			else
				to_chat(user, SPAN_NOTICE("You failed to construct the trench walls. You need more panels."))

	switch(stage)
		if(TRENCH_STAGE_SCREWDRIVER)
			if(!HAS_TRAIT(item, TRAIT_TOOL_SCREWDRIVER))
				return

			to_chat(user, SPAN_NOTICE("You start elevating the frame and screwing it up top."))
			playsound(loc, 'sound/items/Ratchet.ogg', 25, 1)

			if(!do_after(user, 7 SECONDS * user.get_skill_duration_multiplier(SKILL_CONSTRUCTION), INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD))
				return

			to_chat(user, SPAN_NOTICE("You elevate the the frame and screw it up top."))
			stage = TRENCH_STAGE_FINAL
			update_icon()
	switch(stage)
		if(TRENCH_STAGE_FINAL)
			if(!istype(item, /obj/item/stack/tile/wood))
				return

			var/obj/item/stack/tile/wood/panels = item

			to_chat(user, SPAN_NOTICE("You start adding wood panels to sides walls of [src]."))
			playsound(loc, 'sound/items/Screwdriver.ogg', 25, 1)

			if(!do_after(user, 10 SECONDS * user.get_skill_duration_multiplier(SKILL_CONSTRUCTION), INTERRUPT_NO_NEEDHAND|BEHAVIOR_IMMOBILE, BUSY_ICON_FRIENDLY, src))
				return

			if(panels.use(4))
				to_chat(user, SPAN_NOTICE("You add some panels to [src]."))
				stage = TRENCH_STAGE_CREATE
				update_icon()
				new /obj/structure/trench(src.loc)
				qdel(src)
			else
				to_chat(user, SPAN_NOTICE("You failed to construct the trench walls. You need more panels."))
			update_icon()

/obj/structure/trench_frame/get_examine_text(mob/user)
	. = ..()
	switch(stage)
		if(TRENCH_STAGE_POSTS)
			. += SPAN_NOTICE("Use a [SPAN_HELPFUL("Shovel")] to dig the [src].")
			return
		if(TRENCH_STAGE_DIG)
			. += SPAN_NOTICE("Use a [SPAN_HELPFUL("Shovel")] to dig the [src].")
			return
		if(TRENCH_STAGE_PANELS)
			. += SPAN_NOTICE("Add 4 wooden [SPAN_HELPFUL("floor tiles")] to construct the [src].")
			return
		if(TRENCH_STAGE_SCREWDRIVER)
			. += SPAN_NOTICE("Use a [SPAN_HELPFUL("screwdriver")] to construct the [src].")
			return
		if(TRENCH_STAGE_FINAL)
			. += SPAN_NOTICE("Add 4 wooden [SPAN_HELPFUL("floor tiles")] to construct the [src].")
			return

/obj/structure/trench
	name = "Wooden Trench"
	desc = "This is a trench. Its like you're fighting the Kaiser again. In space."
	icon = 'icons/obj/structures/trenches.dmi'
	icon_state = "trench"
	climb_delay = CLIMB_DELAY_LONG
	unacidable = FALSE
	unslashable = FALSE
	wrenchable = FALSE
	density = FALSE
	breakable = TRUE
	health = 10000
	anchored = TRUE
	throwpass = TRUE
	projectile_coverage = 90
	projectile_coverage_distance_limit = 6
	can_block_movement = TRUE

	var/list/adjacent_trenches = list()
	var/modifies_adjacent = 1 // Set this flag to 0 on children to prevent icon redrawing on creation/destruction

/obj/structure/trench/proc/remove_wall(direction)
	if(!direction) return
	switch(direction)
		if("N")
			if(adjacent_trenches.Find("N") == 0) adjacent_trenches.Add("N")
		if("E")
			if(adjacent_trenches.Find("E") == 0) adjacent_trenches.Add("E")
		if("W")
			if(adjacent_trenches.Find("W") == 0) adjacent_trenches.Add("W")
		if("S")
			if(adjacent_trenches.Find("S") == 0) adjacent_trenches.Add("S")
	update_icon()

/obj/structure/trench/proc/add_wall(direction)
	if(!direction) return
	switch(direction)
		if("N")
			if(adjacent_trenches.Find("N") != 0) adjacent_trenches.RemoveAll("N")
		if("E")
			if(adjacent_trenches.Find("E") != 0) adjacent_trenches.RemoveAll("E")
		if("W")
			if(adjacent_trenches.Find("W") != 0) adjacent_trenches.RemoveAll("W")
		if("S")
			if(adjacent_trenches.Find("S") != 0) adjacent_trenches.RemoveAll("S")
	update_icon()

/obj/structure/trench/proc/check_neighbors()
	var/turf/adjacent_turf = locate(src.x,src.y + 1,src.z)
	for(var/obj/structure/trench/adjacent_trench in adjacent_turf)
		if(adjacent_trench)
			if(adjacent_trenches.Find("N") == 0) adjacent_trenches.Add("N")
			INVOKE_ASYNC(adjacent_trench,PROC_REF(remove_wall),"S")
	adjacent_turf = locate(src.x + 1,src.y,src.z)
	for(var/obj/structure/trench/adjacent_trench in adjacent_turf)
		if(adjacent_trench)
			if(adjacent_trenches.Find("E") == 0) adjacent_trenches.Add("E")
			INVOKE_ASYNC(adjacent_trench,PROC_REF(remove_wall),"W")
	adjacent_turf = locate(src.x - 1,src.y,src.z)
	for(var/obj/structure/trench/adjacent_trench in adjacent_turf)
		if(adjacent_trench)
			if(adjacent_trenches.Find("W") == 0) adjacent_trenches.Add("W")
			INVOKE_ASYNC(adjacent_trench,PROC_REF(remove_wall),"E")
	adjacent_turf = locate(src.x,src.y - 1,src.z)
	for(var/obj/structure/trench/adjacent_trench in adjacent_turf)
		if(adjacent_trench)
			if(adjacent_trenches.Find("S") == 0) adjacent_trenches.Add("S")
			INVOKE_ASYNC(adjacent_trench,PROC_REF(remove_wall),"N")

/obj/structure/trench/proc/remove_neighbors()
	if(adjacent_trenches.Find("N") != 0)
		var/turf/adjacent_turf = locate(src.x,src.y + 1,src.z)
		for(var/obj/structure/trench/adjacent_trench in adjacent_turf)
			if(adjacent_trench)
				adjacent_trench.add_wall("S")
	if(adjacent_trenches.Find("E") != 0)
		var/turf/adjacent_turf = locate(src.x + 1,src.y,src.z)
		for(var/obj/structure/trench/adjacent_trench in adjacent_turf)
			if(adjacent_trench)
				adjacent_trench.add_wall("W")
	if(adjacent_trenches.Find("W") != 0)
		var/turf/adjacent_turf = locate(src.x - 1,src.y,src.z)
		for(var/obj/structure/trench/adjacent_trench in adjacent_turf)
			if(adjacent_trench)
				adjacent_trench.add_wall("E")
	if(adjacent_trenches.Find("S") != 0)
		var/turf/adjacent_turf = locate(src.x,src.y - 1,src.z)
		for(var/obj/structure/trench/adjacent_trench in adjacent_turf)
			if(adjacent_trench)
				adjacent_trench.add_wall("N")

/obj/structure/trench/update_icon()
	src.overlays.Cut()
	src.overlays += image(icon = icon,icon_state = "ground",layer=BETWEEN_OBJECT_ITEM_LAYER)
	if(adjacent_trenches.Find("N") == 0)
		src.overlays += image(icon = icon,icon_state = "wall_north",layer=BETWEEN_OBJECT_ITEM_LAYER + 0.01)
	if(adjacent_trenches.Find("E") == 0)
		src.overlays += image(icon = icon,icon_state = "wall_east",layer=BETWEEN_OBJECT_ITEM_LAYER + 0.02)
	if(adjacent_trenches.Find("W") == 0)
		src.overlays += image(icon = icon,icon_state = "wall_west",layer=BETWEEN_OBJECT_ITEM_LAYER + 0.02)
	if(adjacent_trenches.Find("S") == 0)
		src.overlays += image(icon = icon,icon_state = "wall_south",layer=ABOVE_MOB_LAYER + 0.03)

/obj/structure/trench/Initialize(mapload, ...)
	. = ..()
	if(modifies_adjacent)
		check_neighbors()
		update_icon()

/obj/structure/trench/Destroy()

	if(modifies_adjacent) remove_neighbors()

	. = ..()


