#define TRENCH_STAGE_POSTS 1
#define TRENCH_STAGE_DIG 1
#define TRENCH_STAGE_PANELS 1

/obj/structure/trench_frame
	icon = 'icons/obj/structures/trenches.dmi'
	climb_delay = CLIMB_DELAY_LONG
	unslashable = FALSE
	wrenchable = FALSE
	health = 1000
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
	icon_state = "stage[stage]"

	overlays.Cut()

/obj/structure/trench_frame/attackby(obj/item/item, mob/user)
	if(user.action_busy)
		return

	if(istool(item) && !skillcheck(user, SKILL_CONSTRUCTION, SKILL_CONSTRUCTION_ENGI))
		to_chat(user, SPAN_WARNING("You are not trained to configure [src]..."))
		return TRUE

	switch(stage)
		if(TRENCH_STAGE_POSTS)
			if(!istype(item, /obj/item/tool/shovel))
				return

			to_chat(user, SPAN_NOTICE("You start digging."))
			playsound(user.loc, 'sound/effects/thud.ogg', 40, 1, 6)


/obj/structure/trench
	icon = 'icons/obj/structures/trenches.dmi'
	climb_delay = CLIMB_DELAY_LONG
	unslashable = FALSE
	wrenchable = FALSE
	health = 10000
	anchored = TRUE
	throwpass = 1
	projectile_coverage = PROJECTILE_COVERAGE_MEDIUM
	can_block_movement = TRUE
	var/trench_prefix = "" //used in update_icon()
	icon_state = "no_connect"

