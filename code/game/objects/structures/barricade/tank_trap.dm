/obj/structure/barricade/tank_trap
	name = "tank trap"
	desc = "A heavy steel obstacle designed to stop vehicles. Makes for poor cover."
	health = 500
	maxhealth = 500
	density = TRUE
	anchored = TRUE
	crusher_resistant = TRUE
	can_change_dmg_state = FALSE
	icon = 'icons/obj/structures/barricades.dmi'
	icon_state = "tank_trap"
	barricade_type = "tank_trap"
	var/obj/structure/blocker/forcefield/vehicles/linked_blocker

/obj/structure/barricade/tank_trap/Initialize(mapload)
	. = ..()
	update_linked_blocker()
	AddComponent(/datum/component/shimmy_around, east_offset = -15, west_offset = -15)

/obj/structure/barricade/tank_trap/BlockedPassDirs(atom/movable/mover, target_dir)
	return NO_BLOCKED_MOVEMENT

/obj/structure/barricade/tank_trap/proc/update_linked_blocker()
	if(anchored)
		if(!linked_blocker)
			linked_blocker = new /obj/structure/blocker/forcefield/vehicles(get_turf(src))
	else if(linked_blocker)
		qdel(linked_blocker)
		linked_blocker = null

/obj/structure/barricade/tank_trap/proc/set_anchored(new_value)
	anchored = new_value
	update_linked_blocker()

/obj/structure/barricade/tank_trap/attackby(obj/item/W, mob/user)
	if(HAS_TRAIT(W, TRAIT_TOOL_WRENCH))
		if(user.action_busy)
			return
		else
			playsound(loc, 'sound/items/Ratchet.ogg', 25, 1)
			anchored = !anchored
			to_chat(user, SPAN_NOTICE("You [anchored ? "wrench" : "unwrench"] \the [src]."))
	else
		if(HAS_TRAIT(W, TRAIT_TOOL_SCREWDRIVER))
			if(user.action_busy)
				return
			else
				playsound(loc, 'sound/items/Screwdriver.ogg', 25, 1)
				user.visible_message(SPAN_NOTICE("[user] starts unscrewing [src]."), \
				SPAN_NOTICE("You start unscrewing [src]."))
			if(!do_after(user, 30, INTERRUPT_NO_NEEDHAND, BUSY_ICON_FRIENDLY))
				user.visible_message(SPAN_WARNING("[user] stops dismantling [src]."), \
					SPAN_WARNING("You stop dismantling [src]."))
				return
			user.visible_message(SPAN_NOTICE("[user] finishes dismantling [src]."), \
			SPAN_NOTICE("You finish dismantling [src]."))
			playsound(loc, 'sound/effects/barbed_wire_movement.ogg', 100)
			new /obj/item/stack/sheet/metal(get_turf(src), 10)
			qdel(src)

/obj/structure/barricade/tank_trap/Destroy()
	if(linked_blocker)
		qdel(linked_blocker)
		linked_blocker = null
	return ..()
