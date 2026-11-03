/*----------------------*/
// SNOW
/*----------------------*/

/obj/structure/barricade/snow
	name = "snow barricade"
	desc = "A mound of snow shaped into a sloped wall. Statistically better than thin air as cover."
	icon_state = "snow_0"
	barricade_type = "snow"
	health = 75 //Actual health depends on snow layer
	maxhealth = 75
	stack_type = /obj/item/stack/snow
	debris = list(/obj/item/stack/snow)
	stack_amount = 3
	destroyed_stack_amount = 0
	can_wire = FALSE
	metallic = FALSE

/obj/structure/barricade/snow/New(loc, mob/user, direction)
	if(direction)
		setDir(direction)
	..(loc, user)



//Item Attack
/obj/structure/barricade/snow/attackby(obj/item/W, mob/user)
	for(var/obj/effect/xenomorph/acid/A in src.loc)
		if(A.acid_t == src)
			to_chat(user, "You can't get near that, it's melting!")
			return
	//Removing the barricades
	if(istype(W, /obj/item/tool/shovel) && user.a_intent != INTENT_HARM)
		var/obj/item/tool/shovel/ET = W
		if(ET.folded)
			return
		if(user.action_busy)
			to_chat(user, SPAN_WARNING("You are already shoveling!"))
			return
		user.visible_message("[user.name] starts clearing out \the [src].","You start removing \the [src].")
		if(!do_after(user, ET.shovelspeed * user.get_skill_duration_multiplier(SKILL_CONSTRUCTION), INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD, src))
			return
		if(!ET.folded)
			user.visible_message(SPAN_NOTICE("\The [user] removes \the [src]."))
			deconstruct(TRUE)
		return

	return ..()

/obj/structure/barricade/snow/hit_barricade(obj/item/I)
	switch(I.damtype)
		if("fire")
			take_damage( I.force * I.demolition_mod * 0.6 )
		if("brute")
			take_damage( I.force * I.demolition_mod * 0.3 )

	return


/*----------------------*/
// WOOD
/*----------------------*/

/obj/structure/barricade/wooden
	name = "wooden barricade"
	desc = "A wall made out of wooden planks nailed together. Not very sturdy, but can provide some concealment."
	icon_state = "wooden"
	health = 100
	maxhealth = 100
	layer = OBJ_LAYER
	stack_type = /obj/item/stack/sheet/wood
	debris = list(/obj/item/stack/sheet/wood)
	stack_amount = 5
	destroyed_stack_amount = 3
	barricade_hitsound = 'sound/effects/woodhit.ogg'
	can_change_dmg_state = 0
	barricade_type = "wooden"
	can_wire = FALSE
	repair_materials = list("wood" = 1)
	metallic = FALSE

/obj/structure/barricade/wooden/attackby(obj/item/W as obj, mob/user as mob)
	for(var/obj/effect/xenomorph/acid/A in src.loc)
		if(A.acid_t == src)
			to_chat(user, "You can't get near that, it's melting!")
			return
	if(istype(W, /obj/item/stack/sheet/wood))
		var/obj/item/stack/sheet/wood/D = W
		if(health < maxhealth)
			if(D.get_amount() < 1)
				to_chat(user, SPAN_WARNING("You need one plank of wood to repair [src]."))
				return
			visible_message(SPAN_NOTICE("[user] begins to repair [src]."))
			if(do_after(user, 2 SECONDS, INTERRUPT_ALL, BUSY_ICON_FRIENDLY, src) && health < maxhealth)
				if (D.use(1))
					update_health(-0.5*maxhealth)
					update_damage_state()
					visible_message(SPAN_NOTICE("[user] clumsily repairs [src]."))
		return

	if(try_nailgun_usage(W, user))
		return

	return ..()

/obj/structure/barricade/wooden/hit_barricade(obj/item/I)
	switch(I.damtype)
		if("fire")
			take_damage( I.force * I.demolition_mod * 1.5 )
		if("brute")
			take_damage( I.force * I.demolition_mod * 0.75 )

/*----------------------*/
// Barbed Wire
/*----------------------*/

/obj/structure/barricade/barbedwire
	name = "barbed wire barricade"
	desc = "A set of poles with a length of barbed wire strung between them, able to slow down anything that tries to move through it."
	icon = 'icons/obj/structures/barbed.dmi'
	icon_state = "barbed_wire"
	barricade_type = "barbed_wire"
	health = 100
	maxhealth = 100
	density = FALSE
	climbable = FALSE
	stack_type = /obj/item/stack/barbed_wire
	debris = list(/obj/item/stack/barbed_wire)
	stack_amount = 2
	destroyed_stack_amount = 1
	crusher_resistant = FALSE
	can_wire = FALSE
	barricade_hitsound = 'sound/effects/metalhit.ogg'
	projectile_coverage = PROJECTILE_COVERAGE_NONE
	var/build_state = BARRICADE_BSTATE_SECURED
	var/cut = FALSE

	brute_multiplier = 1.5
	brute_projectile_multiplier = 0.375

/obj/structure/barricade/barbedwire/update_icon()
	if(build_state == BARRICADE_BSTATE_UNSECURED)
		icon_state = "barbed_wire_broken"

/obj/structure/barricade/barbedwire/attackby(obj/item/W, mob/user)
	switch(build_state)
		if(BARRICADE_BSTATE_SECURED)
			if(HAS_TRAIT(W, TRAIT_TOOL_WIRECUTTERS) && !(user.a_intent == INTENT_HELP))
				user.visible_message(SPAN_NOTICE("[user] starts cutting [src]."),
				SPAN_NOTICE("You start cutting [src]."))
				playsound(src.loc, 'sound/items/Wirecutter.ogg', 25, 1)
				if(do_after(user, 50 * user.get_skill_duration_multiplier(SKILL_CONSTRUCTION), INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD))
					user.visible_message(SPAN_NOTICE("[user] cuts [src]."),
					SPAN_NOTICE("You cut [src]."))
					build_state = BARRICADE_BSTATE_UNSECURED
					update_icon()
					return
		if(BARRICADE_BSTATE_UNSECURED)
			if(HAS_TRAIT(W, TRAIT_TOOL_WRENCH) && !(user.a_intent == INTENT_HELP))
				user.visible_message(SPAN_NOTICE("[user] starts deconstructing [src]."),
				SPAN_NOTICE("You start deconstructing [src]."))
				playsound(src.loc, 'sound/items/Deconstruct.ogg', 25, 1)
				if(do_after(user, 50 * user.get_skill_duration_multiplier(SKILL_CONSTRUCTION), INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD))
					user.visible_message(SPAN_NOTICE("[user] deconstructs [src]."),
					SPAN_NOTICE("You deconstructs [src]."))
					deconstruct(TRUE)
					return
	. = ..()

/obj/structure/barricade/barbedwire/Crossed(atom/movable/AM)
	. = ..()
	var/mob/living/L = AM
	if(build_state == BARRICADE_BSTATE_SECURED)
		var/new_slowdown = L.next_move_slowdown + 16
		L.next_move_slowdown = new_slowdown
		playsound(loc, 'sound/effects/barbed_wire_movement.ogg', 25)
		playsound(loc, 'sound/effects/rip2.ogg', 25)
		to_chat(L, SPAN_WARNING("Moving through [src] slows you down substantially!"))
