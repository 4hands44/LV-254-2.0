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
	projectile_coverage = PROJECTILE_COVERAGE_HIGH
	var/is_whitelist = FALSE
	var/strict_types = FALSE
	var/list/types = list(/obj/vehicle/)

/obj/structure/barricade/tank_trap/Initialize(mapload)
	. = ..()
	dir = NORTH|SOUTH|EAST|WEST

/obj/structure/barricade/tank_trap/initialize_pass_flags(datum/pass_flags_container/pass_flags)
	..()
	if (pass_flags)
		pass_flags.flags_can_pass_all = PASS_MOB_IS
		pass_flags.flags_can_pass_front = PASS_MOB_IS
		pass_flags.flags_can_pass_behind = PASS_OVER^(PASS_OVER_ACID_SPRAY|PASS_OVER_THROW_MOB)
	flags_can_pass_front_temp = PASS_OVER_THROW_MOB
	flags_can_pass_behind_temp = PASS_OVER_THROW_MOB
	dir = NORTH|SOUTH|EAST|WEST

/obj/structure/barricade/tank_trap/Crossed(atom/movable/AM)
	. = ..()
	var/mob/living/carbon/xenomorph/XN = AM

	if(strict_types)
		if(AM.type in types)
			return is_whitelist
	else
		for(var/type in types)
			if(istype(AM, type))
				return is_whitelist

	if(istype(XN))
		if(XN.stat == DEAD)
			return
		if(HAS_TRAIT(XN, TRAIT_ABILITY_BURROWED))
			return
		for(var/type in types)
			if(istype(AM, type))
				return is_whitelist

	return !is_whitelist

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
