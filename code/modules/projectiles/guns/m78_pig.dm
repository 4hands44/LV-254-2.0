/*
 * M78 PIG energy weapon
 */

/datum/ammo/energy/m78_pig
	name = "cadmium telluride pellet"
	damage = 500
	damage_type = BURN
	max_range = 14
	accurate_range = 14
	shell_speed = AMMO_SPEED_TIER_3
	debilitate = list(0, 0, 0, 0, 0, 12, 0, 0)

/datum/ammo/energy/m78_pig/on_hit_mob(mob/living/target, obj/projectile/P)
	. = ..()
	if(!target)
		return
	ignite_impact(target, P)

/datum/ammo/energy/m78_pig/on_hit_obj(obj/O, obj/projectile/P)
	. = ..()
	if(!istype(O, /obj/vehicle/multitile))
		return
	var/obj/vehicle/multitile/vehicle = O
	var/datum/cause_data/cause = create_cause_data("M78 PIG", P.firer)
	vehicle.take_damage_type(damage, "abstract", P.firer)
	new /obj/flamer_fire(get_turf(vehicle), cause)

/datum/ammo/energy/m78_pig/on_hit_turf(turf/T, obj/projectile/P)
	. = ..()
	if(!T)
		return
	ignite_impact(T, P)

/datum/ammo/energy/m78_pig/proc/ignite_impact(atom/impact, obj/projectile/P)
	var/datum/cause_data/cause = create_cause_data("M78 PIG", P.firer)
	impact.flamer_fire_act(BURN_LEVEL_TIER_4, cause)
	new /obj/flamer_fire(get_turf(impact), cause)

/obj/projectile/beam/m78_pig
	name = "M78 PIG beam"

/obj/item/ammo_magazine/m78_pig
	name = "M78 PIG pellet magazine"
	desc = "A 30-round magazine containing cadmium telluride pellets."
	icon_state = "mag"
	item_state = "mag"
	default_ammo = /datum/ammo/energy/m78_pig
	caliber = "cadmium telluride"
	max_rounds = 30
	gun_type = /obj/item/weapon/gun/m78_pig
	description_ammo = "cadmium telluride pellets"

/obj/item/weapon/gun/m78_pig
	name = "\improper M78 PIG"
	desc = "A backpack-powered energy weapon that fires blinding cadmium telluride beams."
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/USCM/rocket_launchers.dmi'
	icon_state = "m5"
	item_state = "m5"
	item_icons = list(
		WEAR_BACK = 'icons/mob/humans/onmob/clothing/suit_storage/guns_by_type/rocket_launchers.dmi',
		WEAR_J_STORE = 'icons/mob/humans/onmob/clothing/suit_storage/guns_by_type/rocket_launchers.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/weapons/guns/rocket_launchers_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/weapons/guns/rocket_launchers_righthand.dmi'
	)
	current_mag = /obj/item/ammo_magazine/m78_pig
	ammo = /datum/ammo/energy/m78_pig
	projectile_type = /obj/projectile/beam/m78_pig
	fire_sound = 'sound/weapons/emitter2.ogg'
	muzzle_flash = null
	w_class = SIZE_HUGE
	flags_equip_slot = NO_FLAGS
	flags_item = TWOHANDED|NO_CRYO_STORE
	flags_gun_features = GUN_CAN_POINTBLANK|GUN_WIELDED_FIRING_ONLY|GUN_AMMO_COUNTER|GUN_UNUSUAL_DESIGN
	attachable_allowed = list(
		/obj/item/attachable/scope/mini_iff
	)
	starting_attachment_types = list(
		/obj/item/attachable/scope/mini_iff
	)
	auto_retrieval_slot = WEAR_IN_BACK
	gun_category = GUN_CATEGORY_RIFLE
	wield_delay = WIELD_DELAY_HORRIBLE
	delay_style = WEAPON_DELAY_NO_FIRE
	caliber = "cadmium telluride"
	accepted_ammo = list(/obj/item/ammo_magazine/m78_pig)
	var/obj/structure/m78_pig_mount/attached_to
	var/obj/item/pig_backpack/power_pack
	var/power_cost = 500
	var/windup_active = FALSE
	var/obj/effect/ebeam/plasma_beam_type = /obj/effect/ebeam/laser/plasma
	var/beam_cooldown = 0
	var/beam_delay = 50
	var/cooling_sound_cooldown = 0
	var/datum/effects/tethering/tether_effect

/obj/item/weapon/gun/m78_pig/Initialize(mapload, spawn_empty)
	. = ..()
	if(istype(loc, /obj/structure/m78_pig_mount))
		attach_to(loc)

/obj/item/weapon/gun/m78_pig/Destroy()
	reset_tether()
	attached_to = null
	power_pack = null
	. = ..()

/obj/item/weapon/gun/m78_pig/proc/attach_to(obj/structure/m78_pig_mount/to_attach)
	if(!istype(to_attach))
		return
	reset_tether()
	attached_to = to_attach
	power_pack = to_attach.power_pack

/obj/item/weapon/gun/m78_pig/proc/get_power_pack()
	if(attached_to && !QDELETED(attached_to))
		power_pack = attached_to.power_pack
	if(power_pack && !QDELETED(power_pack))
		return power_pack
	if(istype(loc, /obj/structure/m78_pig_mount))
		var/obj/structure/m78_pig_mount/mount = loc
		power_pack = mount.power_pack
	return power_pack

/obj/item/weapon/gun/m78_pig/proc/reset_tether()
	if(tether_effect)
		UnregisterSignal(tether_effect, COMSIG_PARENT_QDELETING)
		if(!QDESTROYING(tether_effect))
			qdel(tether_effect)
		tether_effect = null
	if(attached_to && loc != attached_to)
		var/atom/tether_from = attached_to.tether_holder || attached_to
		var/list/tether_effects = apply_tether(tether_from, src, range = 1, icon = "wire", always_face = FALSE)
		tether_effect = tether_effects["tetherer_tether"]
		RegisterSignal(tether_effect, COMSIG_PARENT_QDELETING, PROC_REF(reset_tether))

/obj/item/weapon/gun/m78_pig/forceMove(atom/dest)
	. = ..()
	if(.)
		reset_tether()

/obj/item/weapon/gun/m78_pig/able_to_fire(mob/living/user)
	. = ..()
	var/obj/item/cell/high/cell = attached_to?.battery?.power_cell
	if(!. || !cell || cell.charge < power_cost)
		if(user)
			balloon_alert(user, "low power")
		return FALSE

/obj/item/weapon/gun/m78_pig/Fire(atom/target, mob/living/user, params, reflex = FALSE, dual_wield)
	if(windup_active)
		return NONE
	if(world.time < beam_cooldown)
		if(world.time >= cooling_sound_cooldown)
			playsound(user, 'sound/weapons/hmg_cooling.ogg', 40, TRUE)
			cooling_sound_cooldown = world.time + 10
		to_chat(user, SPAN_WARNING("Weapon cooling."))
		return NONE
	if(!able_to_fire(user))
		return NONE
	windup_active = TRUE
	playsound(user, 'sound/effects/supercapacitors_charging.ogg', 60, FALSE)
	var/datum/beam/charge_beam
	if(target)
		var/turf/beam_end = get_turf(user)
		var/beam_dir = get_dir(user, target)
		for(var/i in 1 to 14)
			var/turf/next_turf = get_step(beam_end, beam_dir)
			if(!next_turf)
				break
			beam_end = next_turf
		charge_beam = user.beam(beam_end, "laser_beam", 'icons/effects/beam.dmi', 1.1 SECONDS, 15, /obj/effect/ebeam/laser, TRUE)
		charge_beam.visuals.alpha = 0
		charge_beam.visuals.color = COLOR_PURPLE
		animate(charge_beam.visuals, alpha = initial(charge_beam.visuals.alpha), color = COLOR_PURPLE, time = 3 SECONDS, easing = SINE_EASING|EASE_OUT)
	if(!do_after(user, 3 SECONDS, INTERRUPT_ALL|BEHAVIOR_IMMOBILE, NO_BUSY_ICON))
		qdel(charge_beam)
		windup_active = FALSE
		return NONE
	qdel(charge_beam)
	windup_active = FALSE
	if(!able_to_fire(user))
		return NONE
	return ..()

/obj/item/weapon/gun/m78_pig/load_into_chamber(mob/user)
	var/obj/item/cell/high/cell = attached_to?.battery?.power_cell
	if(!attached_to || !cell || cell.charge < power_cost)
		return

	var/obj/projectile/chambered = ..()
	if(chambered)
		cell.charge -= power_cost
		return chambered

/obj/item/weapon/gun/m78_pig/apply_bullet_effects(obj/projectile/projectile_to_fire, mob/user, reflex = FALSE, dual_wield = FALSE)
	. = ..()

/obj/item/weapon/gun/m78_pig/handle_fire(atom/target, mob/living/user, params, reflex = FALSE, dual_wield, check_for_attachment_fire, akimbo, fired_by_akimbo)
	if(!target || !user || world.time < beam_cooldown)
		return
	beam_cooldown = world.time + beam_delay
	addtimer(CALLBACK(src, PROC_REF(cooling_finished)), beam_delay)

	var/turf/beam_end = get_turf(user)
	var/beam_dir = get_dir(user, target)
	for(var/i in 1 to 14)
		var/turf/next_turf = get_step(beam_end, beam_dir)
		if(!next_turf)
			break
		beam_end = next_turf

	var/datum/beam/plasma_beam = user.beam(beam_end, "light_beam", 'icons/effects/beam.dmi', time = 0.7 SECONDS, maxdistance = 14, beam_type = plasma_beam_type, always_turn = TRUE)
	animate(plasma_beam.visuals, alpha = 255, time = 0.7 SECONDS, color = COLOR_PURPLE, luminosity = 3, easing = SINE_EASING|EASE_OUT)
	return ..()

/obj/item/weapon/gun/m78_pig/proc/cooling_finished()
	if(!QDELETED(src))
		playsound(src, 'sound/machines/beepalert.ogg', 40, TRUE)
		var/mob/living/user = ismob(loc) ? loc : (power_pack && ismob(power_pack.loc) ? power_pack.loc : null)
		if(user)
			to_chat(user, SPAN_NOTICE("The M78 PIG has finished cooling and is ready to fire."))

/obj/item/weapon/gun/m78_pig/handle_starting_attachment()
	..()
	for(var/obj/item/attachable/attachment in contents)
		attachment.flags_attach_features &= ~ATTACH_REMOVABLE

/obj/item/weapon/gun/m78_pig/set_gun_config_values()
	..()
	set_fire_delay(5 SECONDS)

/obj/item/pig_backpack
	name = "\improper M78 PIG power backpack"
	desc = "A power backpack fitted with an M78 PIG and its dedicated battery."
	icon = 'icons/obj/items/clothing/backpack/backpacks.dmi'
	icon_state = "radio"
	item_icons = list(
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/clothing/backpacks_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/clothing/backpacks_righthand.dmi',
		WEAR_BACK = 'icons/mob/humans/onmob/clothing/back/backpacks.dmi'
	)
	w_class = SIZE_LARGE
	drop_sound = "armorequip"
	flags_equip_slot = SLOT_BACK
	actions_types = list(/datum/action/item_action/m78_pig/use_weapon)
	var/obj/structure/m78_pig_mount/pig_mount

/obj/item/pig_backpack/Initialize(mapload)
	. = ..()
	pig_mount = new /obj/structure/m78_pig_mount(src)
	pig_mount.power_pack = src
	pig_mount.attach_weapon()

/obj/item/pig_backpack/Destroy()
	QDEL_NULL(pig_mount)
	. = ..()

/obj/item/pig_backpack/get_examine_text(mob/user)
	. = ..()
	var/obj/item/cell/high/cell = pig_mount?.battery?.power_cell
	if(cell)
		. += "The battery gauge reads: Power: [cell.charge] / [cell.maxcharge]."
	else
		. += SPAN_WARNING("No battery is installed. The M78 PIG cannot fire.")

/obj/item/pig_backpack/forceMove(atom/dest)
	. = ..()
	if(pig_mount)
		pig_mount.set_tether_holder(isturf(dest) ? src : loc)

/obj/item/pig_backpack/attackby(obj/item/W, mob/user)
	if(pig_mount && W == pig_mount.attached_to)
		pig_mount.recall_weapon(user)
		return
	if(istype(W, /obj/item/pig_battery))
		var/obj/item/pig_battery/new_battery = W
		if(pig_mount.battery)
			var/obj/item/pig_battery/old_battery = pig_mount.battery
			pig_mount.battery = null
			user.put_in_hands(old_battery)
		user.drop_inv_item_to_loc(new_battery, pig_mount)
		pig_mount.battery = new_battery
		playsound(src, 'sound/machines/click.ogg', 25, TRUE)
		return
	to_chat(user, SPAN_WARNING("There is no storage compartment in [src]."))
	return TRUE

/obj/item/pig_backpack/clicked(mob/user, list/mods)
	if(mods[ALT_CLICK] && pig_mount?.battery)
		var/obj/item/pig_battery/battery = pig_mount.battery
		pig_mount.battery = null
		user.put_in_hands(battery)
		playsound(src, 'sound/machines/click.ogg', 25, TRUE)
		return TRUE
	return ..()

/datum/action/item_action/m78_pig/use_weapon/New(mob/living/user, obj/item/holder)
	..()
	name = "Use PIG"
	button.name = name
	button.overlays.Cut()
	var/image/IMG = image('icons/obj/items/weapons/guns/guns_by_faction/USCM/rocket_launchers.dmi', button, "m5")
	button.overlays += IMG

/datum/action/item_action/m78_pig/use_weapon/action_activate()
	. = ..()
	for(var/obj/item/pig_backpack/pig_pack in owner)
		pig_pack.use_weapon(owner)
		return

/obj/item/pig_backpack/proc/use_weapon(mob/user)
	if(pig_mount)
		pig_mount.attack_hand(user)

/obj/structure/m78_pig_mount
	name = "M78 PIG mount"
	desc = "An internal M78 PIG weapon mount."
	var/obj/item/pig_backpack/power_pack
	var/obj/item/weapon/gun/m78_pig/attached_to
	var/obj/item/pig_battery/battery
	var/atom/tether_holder

/obj/structure/m78_pig_mount/Initialize(mapload)
	. = ..()
	battery = new /obj/item/pig_battery(src)

/obj/structure/m78_pig_mount/proc/attach_weapon()
	attached_to = new /obj/item/weapon/gun/m78_pig(src)

/obj/structure/m78_pig_mount/attack_hand(mob/user)
	if(attached_to && attached_to.loc == src)
		user.put_in_hands(attached_to)

/obj/structure/m78_pig_mount/proc/recall_weapon(mob/user)
	if(!attached_to || attached_to.loc == src)
		return
	if(ismob(attached_to.loc))
		var/mob/holder = attached_to.loc
		holder.drop_held_item(attached_to)
	playsound(get_turf(src), 'sound/machines/click.ogg', 40, TRUE)
	attached_to.forceMove(src)

/obj/structure/m78_pig_mount/proc/set_tether_holder(atom/A)
	tether_holder = A
	if(attached_to)
		attached_to.reset_tether()

/obj/structure/m78_pig_mount/Destroy()
	QDEL_NULL(attached_to)
	QDEL_NULL(battery)
	. = ..()

/obj/item/pig_battery
	name = "\improper M78 PIG battery"
	desc = "A dedicated high-capacity battery for the M78 PIG."
	icon = 'icons/obj/structures/machinery/power.dmi'
	icon_state = "smartguncell"
	w_class = SIZE_SMALL
	var/obj/item/cell/high/power_cell

/obj/item/pig_battery/Initialize(mapload)
	. = ..()
	power_cell = new(src)

/obj/item/pig_battery/Destroy()
	QDEL_NULL(power_cell)
	. = ..()
