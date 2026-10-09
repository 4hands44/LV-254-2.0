/obj/structure/barricade/tank_trap
	name = "tank trap"
	desc = "A heavy steel obstacle designed to stop vehicles."
	health = 500
	maxhealth = 500
	density = TRUE
	anchored = TRUE
	icon_state = "tank_trap"

/obj/structure/barricade/tank_trap/CanPass(atom/movable/mover, turf/target)
	if(istype(mover, /obj/vehicle))
		return FALSE
	return TRUE

/obj/structure/barricade/tank_trap/Crossed(atom/movable/mover)
	. = ..()
	if(ismob(mover))
		step(mover, pick(GLOB.cardinals))
