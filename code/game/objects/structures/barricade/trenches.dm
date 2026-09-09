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
	. = ..()
	if(locate(/obj/structure/trench) in get_turf(src))
		visible_message(SPAN_WARNING("[src] overlaps an existing trench and falls apart."))
		new /obj/item/stack/sheet/wood(get_turf(src), 4)
		return INITIALIZE_HINT_QDEL
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

			var/turf/T = get_turf(src.loc)
			var/turfdirt = T.get_dirt_type()
			if(turfdirt)

				to_chat(user, SPAN_NOTICE("You start digging."))
				playsound(user.loc, 'sound/effects/thud.ogg', 40, 1, 6)

				if(!do_after(user, 5 SECONDS * user.get_skill_duration_multiplier(SKILL_CONSTRUCTION), INTERRUPT_NO_NEEDHAND|BEHAVIOR_IMMOBILE, BUSY_ICON_FRIENDLY, src))
					return

				to_chat(user, SPAN_NOTICE("You dig the [src]."))
				stage = TRENCH_STAGE_DIG
				update_icon()
			else
				playsound(user.loc, 'sound/effects/burrowing_b.ogg', 40, 1, 6)
				playsound(user.loc, 'sound/effects/clang.ogg', 40, 1, 6)
				new /obj/item/stack/sheet/wood(src.loc)
				new /obj/item/stack/sheet/wood(src.loc)
				new /obj/item/stack/sheet/wood(src.loc)
				new /obj/item/stack/sheet/wood(src.loc)
				to_chat(user, SPAN_WARNING("There ground is too hard, you cant dig a trench here!"))
				to_chat(user, SPAN_NOTICE("The [src] falls apart."))
				qdel(src)

	switch(stage)
		if(TRENCH_STAGE_DIG)
			if(!istype(item, /obj/item/tool/shovel))
				return

			to_chat(user, SPAN_NOTICE("You start digging."))
			playsound(user.loc, 'sound/effects/thud.ogg', 40, 1, 6)

			if(!do_after(user, 10 SECONDS * user.get_skill_duration_multiplier(SKILL_CONSTRUCTION), INTERRUPT_NO_NEEDHAND|BEHAVIOR_IMMOBILE, BUSY_ICON_FRIENDLY, src))
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

			if(!do_after(user, 5 SECONDS * user.get_skill_duration_multiplier(SKILL_CONSTRUCTION), INTERRUPT_NO_NEEDHAND|BEHAVIOR_IMMOBILE, BUSY_ICON_FRIENDLY, src))
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

			if(!do_after(user, 5 SECONDS * user.get_skill_duration_multiplier(SKILL_CONSTRUCTION), INTERRUPT_NO_NEEDHAND|BEHAVIOR_IMMOBILE, BUSY_ICON_FRIENDLY, src))
				return

			if(panels.use(4))
				to_chat(user, SPAN_NOTICE("You add some panels to [src]."))
				stage = TRENCH_STAGE_CREATE
				update_icon()
				new /obj/structure/trench(src.loc)
				if(prob(75))
					new /obj/effect/decal/cleanable/blood/mud(src.loc)
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
	desc = "This is a trench. Its like you're fighting the Kaiser again. In space. It can be upgraded with wood."
	icon = 'icons/obj/structures/trenches.dmi'
	icon_state = "ground"
	layer = TURF_LAYER
	climb_delay = CLIMB_DELAY_LONG
	unacidable = FALSE
	unslashable = FALSE
	wrenchable = FALSE
	density = FALSE
	breakable = TRUE
	health = 10000
	anchored = TRUE
	throwpass = TRUE
	can_block_movement = TRUE

	var/list/adjacent_trenches = list()
	var/modifies_adjacent = 1 // Set this flag to 0 on children to prevent icon redrawing on creation/destruction
	var/Canopy = null
	var/vehicle_bridge = FALSE
	var/obj/structure/roof/trench_canopy/canopy_roof
	var/mobpresent = 0
	var/maxhealth = 10000

/obj/structure/roof/trench_canopy
	icon = 'icons/obj/structures/trenches.dmi'
	layer = ABOVE_MOB_LAYER + 0.04

/obj/structure/roof/trench_canopy/Initialize(mapload, canopy_icon_state, canopy_color)
	icon_state = canopy_icon_state
	. = ..()
	under_image.alpha = 100
	normal_image.color = canopy_color
	under_image.color = canopy_color

/obj/structure/roof/trench_canopy/LateInitialize()
	. = ..()
	if(!linked_master)
		return
	for(var/obj/effect/roof_node/node in linked_master.connected_nodes)
		for(var/mob/living/living in node.loc)
			linked_master.add_under_roof(living)

/obj/structure/trench/proc/update_adjacent_berm_health(damage, nomessage)
	for(var/direction in CARDINAL_DIRS)
		var/turf/adjacent_turf = get_step(src, direction)
		for(var/obj/structure/platform/stone/trench/berm in adjacent_turf)
			if(berm.get_parent_trench() != src)
				continue
			berm.health = clamp(berm.health - damage, 0, berm.maxhealth)
			if(!berm.health)
				berm.broken(nomessage)
			else
				berm.update_icon()

/obj/structure/trench/proc/sync_berm_health()
	for(var/direction in CARDINAL_DIRS)
		var/turf/adjacent_turf = get_step(src, direction)
		for(var/obj/structure/platform/stone/trench/berm in adjacent_turf)
			if(berm.get_parent_trench() != src)
				continue
			berm.health = health
			berm.update_icon()

/obj/structure/trench/update_health(damage, nomessage)
	health = clamp(health - damage, 0, maxhealth)
	update_adjacent_berm_health(damage, nomessage)
	if(!health)
		if(!nomessage)
			visible_message(SPAN_DANGER("[src] falls apart!"))
		qdel(src)

/obj/structure/trench/ex_act(severity, direction)
	if(explo_proof)
		return
	update_health(severity)

/obj/structure/trench/Crossed(atom/movable/O)
	. = ..()
	if(ismob(O))
		mobpresent++
		update_icon()

/obj/structure/trench/Uncrossed(atom/movable/O)
	if(ismob(O))
		mobpresent = max(0, mobpresent - 1)
		update_icon()
	return ..()

/obj/structure/trench/attackby(obj/item/item, mob/user)
	if(istype(item, /obj/item/tool/shovel) && user.a_intent != INTENT_HARM)
		var/obj/item/tool/shovel/shovel = item
		if(shovel.folded)
			to_chat(user, SPAN_WARNING("The shovel must be unfolded to deconstruct [src]."))
			return TRUE
		if(!shovel.dirt_amt)
			to_chat(user, SPAN_WARNING("The shovel must be filled with dirt to deconstruct [src]."))
			return TRUE
		if(user.action_busy)
			return TRUE
		user.visible_message(
			SPAN_NOTICE("[user] starts filling in [src] with [shovel]."),
			SPAN_NOTICE("You start filling in [src] with [shovel].")
		)
		playsound(user.loc, "rustle", 30, 1, 6)
		if(!do_after(user, shovel.shovelspeed * user.get_skill_duration_multiplier(SKILL_CONSTRUCTION), INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD, src))
			return TRUE
		if(!shovel.dirt_amt)
			return TRUE
		shovel.dirt_amt = 0
		shovel.check_dirt_type()
		shovel.update_icon()
		user.visible_message(
			SPAN_NOTICE("[user] fills in [src] with [shovel]."),
			SPAN_NOTICE("You fill in [src] with [shovel].")
		)
		new /obj/item/stack/sheet/wood(get_turf(src), 6)
		deconstruct(TRUE)
		return TRUE


	if(!istype(item, /obj/item/stack/sheet/wood))
		return ..()

	var/list/upgrade_options = list(
		"Camo netting(Jungle) (1x wood)",
		"Camo netting(Urban) (1x wood)",
		"Camo netting(Desert) (1x wood)",
		"Camo netting (Snow) (1x wood)",
		"Tarp(Urban) (1x wood)",
		"Tarp(Jungle) (1xwood)",
		"Tarp(Desert) (1x wood)",
		"Tarp(Snow) (1x wood)",
		"Remove canopy"
		)
	if(!istype(src, /obj/structure/trench/dugout))
		upgrade_options += "Build dugout (20x wood)"
	var/canopy_choice = tgui_input_list(user, "Choose an upgrade for [src].", "select upgrade", upgrade_options)
	if(!canopy_choice)
		return
	var/obj/structure/trench/long_bridge_partner = get_long_bridge_partner()
	if(long_bridge_partner)
		upgrade_options += "Vehicle bridge (16x wood)"
	else if(has_opposing_ramps())
		upgrade_options += "Vehicle bridge (8x wood)"

	if(canopy_choice == "Build dugout (20x wood)")
		var/obj/item/stack/sheet/wood/wood = item
		if(!wood.use(20))
			to_chat(user, SPAN_WARNING("You need 20 wood to build [src] into a dugout."))
			return TRUE
		var/turf/dugout_turf = get_turf(src)
		var/dugout_dir = dir
		qdel(src)
		var/obj/structure/trench/dugout/dugout = new(dugout_turf)
		dugout.setDir(dugout_dir)
		return TRUE

	if(canopy_choice == "Remove canopy")
		if(Canopy)
			Canopy = null
			qdel(canopy_roof)
			canopy_roof = null
			new /obj/item/stack/sheet/wood(get_turf(src))
			update_icon()
		return TRUE
	if(canopy_choice == "Vehicle bridge (8x wood)" || canopy_choice == "Vehicle bridge (16x wood)")
		var/obj/item/stack/sheet/wood/bridge_wood = item
		var/bridge_cost = canopy_choice == "Vehicle bridge (16x wood)" ? 16 : 8
		if(!bridge_wood.use(bridge_cost))
			to_chat(user, SPAN_WARNING("You need [bridge_cost] wood to build a vehicle bridge on [src]."))
			return TRUE
		vehicle_bridge = TRUE
		Canopy = null
		update_icon()
		if(long_bridge_partner)
			long_bridge_partner.vehicle_bridge = TRUE
			long_bridge_partner.Canopy = null
			long_bridge_partner.update_icon()
		return TRUE

	var/obj/item/stack/sheet/wood/wood = item
	if(!wood.use(1))
		to_chat(user, SPAN_WARNING("You need wood to add a canopy to [src]."))
		return
	if(Canopy)
		new /obj/item/stack/sheet/wood(get_turf(src))

	switch(canopy_choice)
		if("Camo netting(Jungle) (1x wood)")
			Canopy = list("trench_netting", "#4f6b35")
		if("Camo netting(Urban) (1x wood)")
			Canopy = list("trench_netting", "#777777")
		if("Camo netting(Desert) (1x wood)")
			Canopy = list("trench_netting", "#b98a52")
		if("Camo netting (Snow) (1x wood)")
			Canopy = list("trench_netting", "#d8dedf")
		if("Tarp(Urban) (1x wood)")
			Canopy = list("trench_canopy", "#555555")
		if("Tarp(Jungle) (1xwood)")
			Canopy = list("trench_canopy", "#344d2b")
		if("Tarp(Desert) (1x wood)")
			Canopy = list("trench_canopy", "#8f693f")
		if("Tarp(Snow) (1x wood)")
			Canopy = list("trench_canopy", "#b8c4c9")
	if(canopy_roof)
		qdel(canopy_roof)
	canopy_roof = new /obj/structure/roof/trench_canopy(get_turf(src), Canopy[1], Canopy[2])
	update_icon()
	return TRUE

/obj/structure/trench/dugout
	name = "Dugout Trench"
	desc = "A trench reinforced with a covered dugout."

/obj/structure/trench/dugout/update_icon()
	overlays.Cut()
	overlays += image(icon = icon, icon_state = "ground_dugout", layer = ABOVE_TURF_LAYER)
	if(adjacent_trenches.Find("N") == 0)
		overlays += image(icon = icon, icon_state = "dugout_north", layer = ABOVE_MOB_LAYER + 0.01)
	if(adjacent_trenches.Find("E") == 0)
		overlays += image(icon = icon, icon_state = "dugout_east", layer = ABOVE_MOB_LAYER + 0.02)
	if(adjacent_trenches.Find("W") == 0)
		overlays += image(icon = icon, icon_state = "dugout_west", layer = ABOVE_MOB_LAYER + 0.02)
	if(adjacent_trenches.Find("S") == 0)
		overlays += image(icon = icon, icon_state = "dugout_south", layer = ABOVE_MOB_LAYER + 0.03)
	var/image/roof_overlay = image(icon = icon, icon_state = "dugout_roof", layer = ABOVE_MOB_LAYER + 0.04)
	roof_overlay.alpha = mobpresent ? 100 : 255
	overlays += roof_overlay

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
	if(locate(/obj/structure/trench_ramp) in adjacent_turf)
		if(adjacent_trenches.Find("N") == 0) adjacent_trenches.Add("N")
	for(var/obj/structure/trench_ramp/ramp in adjacent_turf)
		ramp.check_neighbors()
	adjacent_turf = locate(src.x + 1,src.y,src.z)
	for(var/obj/structure/trench/adjacent_trench in adjacent_turf)
		if(adjacent_trench)
			if(adjacent_trenches.Find("E") == 0) adjacent_trenches.Add("E")
			INVOKE_ASYNC(adjacent_trench,PROC_REF(remove_wall),"W")
	if(locate(/obj/structure/trench_ramp) in adjacent_turf)
		if(adjacent_trenches.Find("E") == 0) adjacent_trenches.Add("E")
	for(var/obj/structure/trench_ramp/ramp in adjacent_turf)
		ramp.check_neighbors()
	adjacent_turf = locate(src.x - 1,src.y,src.z)
	for(var/obj/structure/trench/adjacent_trench in adjacent_turf)
		if(adjacent_trench)
			if(adjacent_trenches.Find("W") == 0) adjacent_trenches.Add("W")
			INVOKE_ASYNC(adjacent_trench,PROC_REF(remove_wall),"E")
	if(locate(/obj/structure/trench_ramp) in adjacent_turf)
		if(adjacent_trenches.Find("W") == 0) adjacent_trenches.Add("W")
	for(var/obj/structure/trench_ramp/ramp in adjacent_turf)
		ramp.check_neighbors()
	adjacent_turf = locate(src.x,src.y - 1,src.z)
	for(var/obj/structure/trench/adjacent_trench in adjacent_turf)
		if(adjacent_trench)
			if(adjacent_trenches.Find("S") == 0) adjacent_trenches.Add("S")
			INVOKE_ASYNC(adjacent_trench,PROC_REF(remove_wall),"N")
	if(locate(/obj/structure/trench_ramp) in adjacent_turf)
		if(adjacent_trenches.Find("S") == 0) adjacent_trenches.Add("S")
	for(var/obj/structure/trench_ramp/ramp in adjacent_turf)
		ramp.check_neighbors()

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
	src.overlays += image(icon = icon,icon_state = "ground",layer=ABOVE_TURF_LAYER)
	if(adjacent_trenches.Find("N") == 0)
		src.overlays += image(icon = icon,icon_state = "wall_north",layer=BETWEEN_OBJECT_ITEM_LAYER + 0.01)
	if(adjacent_trenches.Find("E") == 0)
		src.overlays += image(icon = icon,icon_state = "wall_east",layer=BETWEEN_OBJECT_ITEM_LAYER + 0.02)
	if(adjacent_trenches.Find("W") == 0)
		src.overlays += image(icon = icon,icon_state = "wall_west",layer=BETWEEN_OBJECT_ITEM_LAYER + 0.02)
	if(adjacent_trenches.Find("S") == 0)
		src.overlays += image(icon = icon,icon_state = "wall_south",layer=ABOVE_MOB_LAYER + 0.03)

	if(vehicle_bridge)
		var/obj/structure/trench/long_bridge_partner = get_long_bridge_partner()
		if(long_bridge_partner)
			var/long_bridge_direction = long_bridge_partner.x > x ? EAST : long_bridge_partner.x < x ? WEST : long_bridge_partner.y > y ? NORTH : SOUTH
			var/long_bridge_ramp_direction = reverse_direction(long_bridge_direction)
			var/long_bridge_icon = bridge_wall_icon_state(long_bridge_ramp_direction)
			src.overlays += image(icon = icon, icon_state = "wall_[long_bridge_icon]", layer = bridge_wall_layer(long_bridge_ramp_direction))
			src.overlays += image(icon = icon, icon_state = "trench_bridge_[long_bridge_icon]", layer = ABOVE_MOB_LAYER - 0.01)
		else
			for(var/direction in CARDINAL_DIRS)
				if(locate(/obj/structure/trench_ramp) in get_step(src, direction))
					var/bridge_direction = bridge_wall_icon_state(direction)
					src.overlays += image(icon = icon, icon_state = "wall_[bridge_direction]", layer = bridge_wall_layer(direction))
					src.overlays += image(icon = icon, icon_state = "trench_bridge_[bridge_direction]", layer = ABOVE_MOB_LAYER - 0.01)

/obj/structure/trench/proc/has_opposing_ramps()
	return (get_ramp_at(NORTH) && get_ramp_at(SOUTH)) || (get_ramp_at(EAST) && get_ramp_at(WEST))

/obj/structure/trench/proc/get_ramp_at(direction)
	var/turf/adjacent_turf = get_step(src, direction)
	for(var/obj/structure/trench_ramp/ramp in adjacent_turf)
		return ramp
	return null

/obj/structure/trench/proc/get_long_bridge_partner()
	for(var/direction in CARDINAL_DIRS)
		var/obj/structure/trench/adjacent_trench = locate(/obj/structure/trench, get_step(src, direction))
		if(!adjacent_trench)
			continue
		if(!get_ramp_at(reverse_direction(direction)))
			continue
		if(!adjacent_trench.get_ramp_at(direction))
			continue
		return adjacent_trench
	return null

/obj/structure/trench/proc/bridge_wall_icon_state(direction)
	switch(direction)
		if(NORTH)
			return "north"
		if(EAST)
			return "east"
		if(SOUTH)
			return "south"
		if(WEST)
			return "west"

/obj/structure/trench/proc/bridge_wall_layer(direction)
	if(direction == SOUTH)
		return ABOVE_MOB_LAYER + 0.03
	if(direction == NORTH)
		return BETWEEN_OBJECT_ITEM_LAYER + 0.01
	return BETWEEN_OBJECT_ITEM_LAYER + 0.02

/obj/structure/trench/proc/sync_platforms(atom/ignored_connection)
	for(var/direction in CARDINAL_DIRS)
		var/turf/adjacent_turf = get_step(src, direction)
		var/obj/structure/trench/neighbor = locate(/obj/structure/trench, adjacent_turf)
		var/obj/structure/trench_ramp/ramp = locate(/obj/structure/trench_ramp, adjacent_turf)
		var/obj/structure/machinery/m56d_hmg/mg_turret/turret = locate(/obj/structure/machinery/m56d_hmg/mg_turret, adjacent_turf)

		if(turret)
			for(var/obj/structure/platform/stone/trench/platform in adjacent_turf)
				if(platform.dir == reverse_direction(direction))
					qdel(platform)
			continue

		if((neighbor && neighbor != ignored_connection) || (ramp && ramp != ignored_connection))
			for(var/obj/structure/platform/stone/trench/platform in adjacent_turf)
				if(platform.dir == reverse_direction(direction))
					qdel(platform)
			for(var/obj/structure/platform/stone/trench/platform in loc)
				if(platform.dir == direction)
					qdel(platform)
			continue

		var/has_platform = FALSE
		for(var/obj/structure/platform/stone/trench/platform in adjacent_turf)
			if(platform.dir == reverse_direction(direction))
				has_platform = TRUE

		if(has_platform)
			continue

		var/obj/structure/platform/stone/trench/new_platform
		switch(direction)
			if(NORTH)
				new_platform = new /obj/structure/platform/stone/trench(adjacent_turf)
			if(SOUTH)
				new_platform = new /obj/structure/platform/stone/trench/north(adjacent_turf)
			if(EAST)
				new_platform = new /obj/structure/platform/stone/trench/west(adjacent_turf)
			if(WEST)
				new_platform = new /obj/structure/platform/stone/trench/east(adjacent_turf)
		if(new_platform)
			new_platform.health = health
			new_platform.update_icon()
	sync_berm_health()

/obj/structure/trench/Initialize(mapload, ...)
	. = ..()
	if(modifies_adjacent)
		check_neighbors()
		update_icon()
		sync_platforms()

/obj/structure/trench/Destroy()
	if(canopy_roof)
		qdel(canopy_roof)
		canopy_roof = null

	for(var/obj/structure/platform/stone/trench/platform in loc)
		qdel(platform)

	for(var/direction in CARDINAL_DIRS)
		var/turf/adjacent_turf = get_step(src, direction)
		var/obj/structure/trench/neighbor = locate(/obj/structure/trench, adjacent_turf)
		if(neighbor)
			neighbor.sync_platforms(src)
			continue

		for(var/obj/structure/platform/stone/trench/platform in adjacent_turf)
			if(platform.dir == reverse_direction(direction))
				qdel(platform)
	return ..()

/obj/structure/trench_ramp
	name = "Trench Ramp"
	desc = "A ramp through a trench berm. Use a screwdriver to rotate it."
	icon = 'icons/obj/structures/trenches.dmi'
	icon_state = "trench_ramp"
	layer = TURF_LAYER
	anchored = TRUE
	density = FALSE
	breakable = TRUE
	health = 10000
	throwpass = TRUE
	can_block_movement = TRUE
	var/list/adjacent_trenches = list()

/obj/structure/trench_ramp/attackby(obj/item/item, mob/user)
	if(istype(item, /obj/item/tool/shovel) && user.a_intent != INTENT_HARM)
		var/obj/item/tool/shovel/shovel = item
		if(shovel.folded)
			to_chat(user, SPAN_WARNING("The shovel must be unfolded to fill in [src]."))
			return TRUE
		if(!shovel.dirt_amt)
			to_chat(user, SPAN_WARNING("The shovel must be filled with dirt to fill in [src]."))
			return TRUE
		if(user.action_busy)
			return TRUE
		user.visible_message(
			SPAN_NOTICE("[user] starts filling in [src] with [shovel]."),
			SPAN_NOTICE("You start filling in [src] with [shovel].")
		)
		playsound(user.loc, "rustle", 30, 1, 6)
		if(!do_after(user, shovel.shovelspeed * user.get_skill_duration_multiplier(SKILL_CONSTRUCTION), INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD, src))
			return TRUE
		if(!shovel.dirt_amt)
			return TRUE
		shovel.dirt_amt = 0
		shovel.check_dirt_type()
		shovel.update_icon()
		user.visible_message(
			SPAN_NOTICE("[user] fills in [src] with [shovel]."),
			SPAN_NOTICE("You fill in [src] with [shovel].")
		)
		deconstruct(TRUE)
		return TRUE

	if(HAS_TRAIT(item, TRAIT_TOOL_SCREWDRIVER))
		playsound(src, 'sound/items/Screwdriver.ogg', 25, 1)
		user.visible_message("[user] rotates [src].", "You rotate [src].")
		setDir(turn(dir, -90))
		check_neighbors()
		for(var/direction in CARDINAL_DIRS)
			var/obj/structure/trench/neighbor = locate(/obj/structure/trench, get_step(src, direction))
			if(neighbor)
				neighbor.check_neighbors()
				neighbor.sync_platforms()
			var/obj/structure/trench_ramp/adjacent_ramp = locate(/obj/structure/trench_ramp, get_step(src, direction))
			if(adjacent_ramp)
				adjacent_ramp.check_neighbors()
		return
	return ..()

/obj/structure/trench_ramp/deconstruct(disassembled = TRUE)
	var/ramp_dir = dir
	var/turf/ramp_turf = get_turf(src)
	if(disassembled)
		new /obj/item/stack/sheet/wood(ramp_turf, 4)
	qdel(src)
	if(disassembled)
		var/obj/structure/platform/stone/trench/berm = new(ramp_turf)
		berm.setDir(ramp_dir)
		berm.update_icon()

/obj/structure/trench_ramp/Initialize(mapload, ramp_dir)
	if(ramp_dir)
		setDir(ramp_dir)
	. = ..()
	check_neighbors()
	for(var/direction in CARDINAL_DIRS)
		var/obj/structure/trench/neighbor = locate(/obj/structure/trench, get_step(src, direction))
		if(neighbor)
			neighbor.remove_wall(trench_direction_name(reverse_direction(direction)))
			neighbor.sync_platforms()
		var/obj/structure/trench_ramp/adjacent_ramp = locate(/obj/structure/trench_ramp, get_step(src, direction))
		if(adjacent_ramp)
			adjacent_ramp.check_neighbors(src)


/obj/structure/trench_ramp/proc/check_neighbors()
	adjacent_trenches.Cut()
	for(var/direction in list(turn(dir, 90), turn(dir, -90)))
		if(locate(/obj/structure/trench) in get_step(src, direction) || locate(/obj/structure/trench_ramp) in get_step(src, direction))
			adjacent_trenches += trench_direction_name(direction)
	update_icon()

/obj/structure/trench_ramp/update_icon()
	overlays.Cut()
	var/left_direction = trench_direction_name(turn(dir, 90))
	var/right_direction = trench_direction_name(turn(dir, -90))
	if(adjacent_trenches.Find(left_direction) == 0)
		overlays += image(icon = icon, icon_state = "wall_[trench_wall_icon_state(left_direction)]", layer = BETWEEN_OBJECT_ITEM_LAYER + 0.01)
	if(adjacent_trenches.Find(right_direction) == 0)
		overlays += image(icon = icon, icon_state = "wall_[trench_wall_icon_state(right_direction)]", layer = BETWEEN_OBJECT_ITEM_LAYER + 0.02)

/obj/structure/trench_ramp/proc/trench_wall_icon_state(direction)
	switch(direction)
		if("N")
			return "north"
		if("E")
			return "east"
		if("S")
			return "south"
		if("W")
			return "west"

/obj/structure/trench_ramp/proc/trench_wall_layer(direction)
	if(direction == "S")
		return ABOVE_MOB_LAYER + 0.03
	if(direction == "N")
		return BETWEEN_OBJECT_ITEM_LAYER + 0.01
	return BETWEEN_OBJECT_ITEM_LAYER + 0.02


/obj/structure/trench_ramp/Destroy()
	for(var/direction in CARDINAL_DIRS)
		var/obj/structure/trench/neighbor = locate(/obj/structure/trench, get_step(src, direction))
		if(neighbor)
			neighbor.add_wall(trench_direction_name(reverse_direction(direction)))
			neighbor.sync_platforms(src)
		var/obj/structure/trench_ramp/adjacent_ramp = locate(/obj/structure/trench_ramp, get_step(src, direction))
		if(adjacent_ramp)
			adjacent_ramp.check_neighbors(src)
	return ..()

/obj/structure/trench_ramp/proc/trench_direction_name(direction)
	switch(direction)
		if(NORTH)
			return "N"
		if(EAST)
			return "E"
		if(SOUTH)
			return "S"
		if(WEST)
			return "W"


//the real walls

/obj/structure/platform/stone/trench
	name = "trench berm"
	desc = "A raised collection of stones, mud and loose dirt designed to protect a trench's occupants. You could probably climb it. Repair it with a shovel, or modify it with an M56D gun or wood."
	icon_state = "trench_platform"
	climb_delay = CLIMB_DELAY_MEDIUM
	projectile_coverage = 95
	explo_proof = FALSE
	health = 10000
	projectile_coverage_distance_limit = 1
	var/force_level_absorption = 15
	var/maxhealth = 10000
	var/crusher_resistant = TRUE
	var/barricade_hitsound = 'sound/effects/woodhit.ogg'
	var/barricade_type = "barricade" //"metal", "plasteel", etc.
	var/brute_multiplier = 1
	var/burn_multiplier = 1
	var/explosive_multiplier = 1
	var/brute_projectile_multiplier = 0.5
	var/burn_flame_multiplier = 1


/obj/structure/platform/stone/trench/attackby(obj/item/item, mob/user)
	if(istype(item, /obj/item/tool/shovel) && user.a_intent != INTENT_HARM)
		var/obj/item/tool/shovel/shovel = item
		if(shovel.folded)
			to_chat(user, SPAN_WARNING("The shovel must be unfolded to repair [src]."))
			return TRUE
		if(health >= maxhealth)
			to_chat(user, SPAN_NOTICE("[src] does not need repairs."))
			return TRUE
		user.visible_message(
			SPAN_NOTICE("[user] starts repairing [src] with [shovel]."),
			SPAN_NOTICE("You start repairing [src] with [shovel].")
		)
		if(!do_after(user, shovel.shovelspeed * user.get_skill_duration_multiplier(SKILL_CONSTRUCTION), INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD, src))
			return TRUE
		update_health(-200)
		user.visible_message(
			SPAN_NOTICE("[user] repairs [src] with [shovel]."),
			SPAN_NOTICE("You repair [src] with [shovel].")
		)
		return TRUE

	if(istype(item, /obj/item/stack/sheet/wood))
		var/upgrade_choice = tgui_input_list(user, "Choose an upgrade for [src].", "Trench Berm", list(
			"Convert to trench ramp (4x wood)",
			"Cancel"
		))
		if(upgrade_choice != "Convert to trench ramp (4x wood)")
			return TRUE

		var/obj/item/stack/sheet/wood/wood = item
		if(!wood.use(4))
			to_chat(user, SPAN_WARNING("You need four wood to convert [src] into a trench ramp."))
			return TRUE

		var/ramp_dir = dir
		var/turf/ramp_turf = get_turf(src)
		qdel(src)
		var/obj/structure/trench_ramp/ramp = new(ramp_turf, ramp_dir)
		ramp.check_neighbors()
		for(var/direction in CARDINAL_DIRS)
			var/obj/structure/trench/neighbor = locate(/obj/structure/trench, get_step(ramp, direction))
			if(neighbor)
				neighbor.check_neighbors()
				neighbor.sync_platforms()
		return TRUE

	if(istype(item, /obj/item/device/m56d_gun))
		var/upgrade_choice = tgui_input_list(user, "Choose an upgrade for [src].", "Trench Berm", list(
			"Machine gun nest (need 1x m56)",
			"Cancel"
		))
		if(upgrade_choice != "Machine gun nest (need 1x m56)")
			return TRUE

		var/turret_dir = dir
		var/turf/turret_turf = get_turf(src)
		qdel(item)
		qdel(src)
		var/obj/structure/machinery/m56d_hmg/mg_turret/turret = new(turret_turf)
		turret.setDir(reverse_direction(turret_dir))
		for(var/direction in CARDINAL_DIRS)
			var/obj/structure/trench/neighbor = locate(/obj/structure/trench, get_step(turret, direction))
			if(neighbor)
				neighbor.sync_platforms()
		return TRUE

	if(item.force > force_level_absorption)
		. = ..()
		if(barricade_hitsound)
			playsound(src, barricade_hitsound, 35, 1)
		hit_barricade(item)

/obj/structure/platform/stone/trench/bullet_act(obj/projectile/bullet)
	bullet_ping(bullet)

	if(bullet.ammo.damage_type == BURN)
		bullet.damage = bullet.damage * burn_multiplier
	else
		bullet.damage = bullet.damage * brute_projectile_multiplier

	if(istype(bullet.ammo, /datum/ammo/xeno/boiler_gas))
		take_damage(floor(10 * burn_multiplier))

	else if(bullet.ammo.flags_ammo_behavior & AMMO_ANTISTRUCT)
		take_damage(bullet.damage * ANTISTRUCT_DMG_MULT_BARRICADES)

	take_damage(bullet.damage)

	return TRUE

/obj/structure/platform/stone/trench/ex_act(severity, direction)
	if(explo_proof)
		return
	switch(severity)
		if(EXPLOSION_THRESHOLD_VLOW to EXPLOSION_THRESHOLD_LOW)
			playsound(src, 'sound/soundscape/rocksfalling2.ogg', 100)
		if(EXPLOSION_THRESHOLD_LOW to EXPLOSION_THRESHOLD_HIGH)
			playsound(src, 'sound/soundscape/rocksfalling2.ogg', 100)
		if(EXPLOSION_THRESHOLD_HIGH to INFINITY)
			playsound(src, 'sound/soundscape/rocksfalling2.ogg', 100)
	take_damage(severity)

/obj/structure/platform/stone/trench/Collided(atom/movable/atom_movable)
	..()

	if(istype(atom_movable, /mob/living/carbon/xenomorph/crusher))
		var/mob/living/carbon/xenomorph/crusher/living_carbon = atom_movable

		if (!living_carbon.throwing)
			return

		if(crusher_resistant)
			visible_message(SPAN_DANGER("[living_carbon] smashes into [src]!"))
			take_damage(150)
			playsound(src, barricade_hitsound, 25, TRUE)

		else if(!living_carbon.stat)
			visible_message(SPAN_DANGER("[living_carbon] smashes through [src]!"))
			deconstruct(FALSE)
			playsound(src, barricade_hitsound, 25, TRUE)

/obj/structure/platform/stone/trench/acid_spray_act()
	take_damage(25 * burn_multiplier)
	visible_message(SPAN_WARNING("[src] is hit by the acid spray!"))
	new /datum/effects/acid(src, null, null)

/obj/structure/platform/stone/trench/flamer_fire_act(dam = BURN_LEVEL_TIER_1)
	take_damage(dam * burn_flame_multiplier)

/obj/structure/platform/stone/trench/proc/hit_barricade(obj/item/item)
	take_damage(item.force * item.demolition_mod * 0.5 * brute_multiplier)

/obj/structure/platform/stone/trench/proc/get_parent_trench()
	return locate(/obj/structure/trench, get_step(src, dir))

/obj/structure/platform/stone/trench/proc/take_damage(damage)
	var/obj/structure/trench/parent_trench = get_parent_trench()
	if(parent_trench)
		parent_trench.update_health(damage)
		return

	for(var/obj/structure/barricade/barricade in get_step(src,dir)) //discourage double-stacking barricades by removing health from opposing barricade
		if(barricade.dir == reverse_direction(dir))
			barricade.update_health(damage)

	update_health(damage)

/obj/structure/platform/stone/trench/proc/take_acid_damage(damage)
	take_damage(damage * burn_multiplier)

/obj/structure/platform/stone/trench/update_health(damage, nomessage)
	var/obj/structure/trench/parent_trench = get_parent_trench()
	if(parent_trench)
		parent_trench.update_health(damage, nomessage)
		return

	health -= damage
	health = clamp(health, 0, maxhealth)

	if(!health)
		if(!nomessage)
			visible_message(SPAN_DANGER("[src] falls apart!"))
		broken(FALSE)
		return

	update_icon()

/obj/structure/platform/stone/trench/north
	dir = NORTH
/obj/structure/platform/stone/trench/east
	dir = EAST
/obj/structure/platform/stone/trench/west
	dir = WEST
