
/obj/item/stack/barbed_wire
	name = "barbed wire"
	desc = "A spiky length of wire."
	icon = 'icons/obj/items/marine-items.dmi'
	icon_state = "barbed_wire"
	singular_name = "length"
	w_class = SIZE_SMALL
	force = 0
	throwforce = 5
	throw_speed = SPEED_VERY_FAST
	throw_range = 20
	attack_verb = list("hit", "whacked", "sliced")
	max_amount = 20
	stack_id = "barbed wire"

/obj/item/stack/barbed_wire/small_stack
	amount = STACK_10

/obj/item/stack/barbed_wire/full_stack
	amount = STACK_20

/obj/item/stack/barbed_wire/Initialize(mapload, amount)
	recipes = GLOB.wire_recipes
	return ..()

/*
 * Barbed Wire Recipes
 */

GLOBAL_LIST_INIT_TYPED(wire_recipes, /datum/stack_recipe, list ( \
	new/datum/stack_recipe("barbedwire barricade", /obj/structure/barricade/barbedwire, 2, time = 2 SECONDS, one_per_turf = ONE_TYPE_PER_BORDER, on_floor = 1, skill_req = SKILL_CONSTRUCTION, skill_lvl = SKILL_CONSTRUCTION_TRAINED, min_time = 2 SECONDS), \
	new/datum/stack_recipe("concertina wire", /obj/structure/device/razorwire, 1, time = 2 SECONDS, one_per_turf = ONE_TYPE_PER_BORDER, on_floor = 1, skill_req = SKILL_CONSTRUCTION, skill_lvl = SKILL_CONSTRUCTION_TRAINED, min_time = 1 SECONDS), \
	new/datum/stack_recipe("frag wire", /obj/item/explosive/fragwire, 5, time = 2 SECONDS, one_per_turf = ONE_TYPE_PER_BORDER, on_floor = 1, skill_req = SKILL_CONSTRUCTION, skill_lvl = SKILL_CONSTRUCTION_TRAINED, min_time = 1 SECONDS), \
	null, \
	new/datum/stack_recipe("concertina wire spool", /obj/item/stack/concertina_wire, 1, 1, 20, time = 1 SECONDS, skill_req = SKILL_CONSTRUCTION, skill_lvl = SKILL_CONSTRUCTION_TRAINED), \
	new/datum/stack_recipe("frag wire spool", /obj/item/stack/fragwire, 5, 1, 20, time = 1 SECONDS, skill_req = SKILL_CONSTRUCTION, skill_lvl = SKILL_CONSTRUCTION_TRAINED), \
	null, \
))
