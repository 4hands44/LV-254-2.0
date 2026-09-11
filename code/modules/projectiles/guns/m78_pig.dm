/*
 * M78 PIG energy weapon
 */

/datum/ammo/energy/m78_pig
	name = "plasma beam"
	damage = 1000
	damage_armor_punch = 5
	damage_type = BURN
	flags_ammo_behavior = AMMO_ENERGY
	penetration = ARMOR_PENETRATION_TIER_10
	damage_falloff = 0.1
	max_range = 24
	accurate_range = 24
	shell_speed = 500
	var/at_dmg_mult = 3

/datum/ammo/energy/m78_pig/penetrating/set_bullet_traits()
	. = ..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_penetrating)
	))

/datum/ammo/energy/m78_pig/on_hit_mob(mob/living/target, obj/projectile/P, mob/user)
	. = ..()
	ignite_impact(target, P)
	user.visible_message(SPAN_BOLDWARNING("[src] sends burning debris flying off of the [target]!"))
	create_shrapnel(get_turf(target), 5, 180, ,/datum/ammo/bullet/shrapnel/incendiary, P.weapon_cause_data)
	create_shrapnel(get_turf(target), 5, 180, ,/datum/ammo/bullet/shrapnel/light/human, P.weapon_cause_data)

/datum/ammo/energy/m78_pig/on_hit_obj(obj/O, obj/projectile/P, mob/user)
	P.damage *= at_dmg_mult
	cell_explosion(get_turf(O), 25, 10, EXPLOSION_FALLOFF_SHAPE_LINEAR, P.dir, P.weapon_cause_data)
	if(istype(O))
		var/obj/vehicle/multitile/M = O
		playsound(M, 'sound/effects/bang.ogg', 100)
		M.plasma_munition_interior_bullet_effect(cause_data = create_cause_data("M78 PIG"))
		M.ex_act(25, P.dir, P.weapon_cause_data, 10)
	ignite_impact(O, P)
	user.visible_message(SPAN_BOLDWARNING("[src] sends burning debris flying off of the [O]!"))
	create_shrapnel(get_turf(O), 5, 180, ,/datum/ammo/bullet/shrapnel/incendiary, P.weapon_cause_data)

/datum/ammo/energy/m78_pig/on_hit_turf(turf/T, obj/projectile/P, mob/user)
	. = ..()
	if(!T)
		return
	ignite_impact(T, P)
	if(T.density)
		cell_explosion(T, 25, 10, EXPLOSION_FALLOFF_SHAPE_LINEAR, P.dir, P.weapon_cause_data)
		user.visible_message(SPAN_BOLDWARNING("[src] sends burning debris flying off of the [T]!"))
		create_shrapnel(get_turf(T), 5, 180, ,/datum/ammo/bullet/shrapnel/incendiary, P.weapon_cause_data)

/datum/ammo/energy/m78_pig/proc/ignite_impact(atom/impact, obj/projectile/P)
	var/datum/cause_data/cause = create_cause_data("M78 PIG", P.firer)
	impact.flamer_fire_act(BURN_LEVEL_TIER_4, cause)
	new /obj/flamer_fire(get_turf(impact), cause)

/obj/projectile/beam/m78_pig
	name = "M78 PIG beam"

/obj/item/ammo_magazine/m78_pig
	name = "M78 PIG pellet magazine"
	desc = "A 30-round magazine containing cadmium telluride pellets."
	icon_state = "m57"
	item_state = "m57"
	flags_magazine = AMMUNITION_CANNOT_REMOVE_BULLETS
	default_ammo = /datum/ammo/energy/m78_pig
	caliber = "cadmium telluride"
	max_rounds = 30
	gun_type = /obj/item/weapon/gun/m78_pig
	description_ammo = "cadmium telluride pellets"

/obj/item/weapon/gun/m78_pig
	name = "\improper M78 PIG"
	desc = "The M78 Phased-Plasma Infantry Gun (PIG) is an man-portable anti-armor weapon used by the United States Colonial Marine Corps that employs a vaporized plasma laser to burn through armor. Most marines enjoy the power of the weapon, but prefer the m5 rpg due to the PIG's exteme weight."
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/USCM/rocket_launchers.dmi'
	icon_state = "m78"
	item_state = "m78"
	item_icons = list(
		WEAR_J_STORE = 'icons/mob/humans/onmob/clothing/suit_storage/guns_by_type/rocket_launchers.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/weapons/guns/rocket_launchers_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/weapons/guns/rocket_launchers_righthand.dmi'
	)
	current_mag = /obj/item/ammo_magazine/m78_pig
	ammo = /datum/ammo/energy/m78_pig
	projectile_type = /obj/projectile/beam/m78_pig
	fire_sound = 'sound/weapons/m78_pig.ogg'
	reload_sound = 'sound/weapons/shell_load4.ogg'
	muzzle_flash_color = COLOR_STRONG_VIOLET
	unacidable = TRUE
	explo_proof = TRUE
	w_class = SIZE_HUGE
	gun_category = GUN_CATEGORY_HEAVY
	flags_equip_slot = NO_FLAGS
	accuracy_mult = BASE_ACCURACY_MULT * 3
	damage_mult = BASE_BULLET_DAMAGE_MULT
	scatter = SCATTER_AMOUNT_NONE
	aim_slowdown = 4
	flags_item = TWOHANDED|NO_CRYO_STORE
	flags_gun_features = GUN_CAN_POINTBLANK|GUN_WIELDED_FIRING_ONLY|GUN_AMMO_COUNTER
	attachable_allowed = list(
		/obj/item/attachable/scope/variable_zoom
	)
	starting_attachment_types = list(
		/obj/item/attachable/scope/variable_zoom
	)
	auto_retrieval_slot = WEAR_IN_BACK
	gun_category = GUN_CATEGORY_HEAVY
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


/obj/item/weapon/gun/m78_pig/apply_bullet_effects(obj/projectile/projectile_to_fire, mob/user, i = 1, reflex = 0)
	. = ..()
	if(!HAS_TRAIT(user, TRAIT_BIMEX|EYE_PROTECTION_FLASH|EYE_PROTECTION_WELDING) && ishuman(user))
		var/mob/living/carbon/human/huser = user
		var/datum/internal_organ/eyes/E = huser.internal_organs_by_name["eyes"]
		INVOKE_ASYNC(user, /mob/proc/emote, "pain")
		huser.AdjustEyeBlur(12,20)
		E.take_damage(rand(15, 25), TRUE)
		to_chat(user, SPAN_DANGER("The light from the [src] flashes across your unprotected eyes for a split-second, blinding you! Probably shoulda worn the included Eye protection in hindsight. But you know what they say hindsight is 20-20... uh, which yours isnt anymore."))
		return


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
		for(var/i in 1 to 24)
			var/turf/next_turf = get_step(beam_end, beam_dir)
			if(!next_turf)
				break
			beam_end = next_turf
		charge_beam = user.beam(beam_end, "laser_beam", 'icons/effects/beam.dmi', 2.1 SECONDS, 15, /obj/effect/ebeam/laser, TRUE)
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

/obj/item/weapon/gun/m78_pig/handle_fire(atom/target, mob/living/user, params, reflex = FALSE, dual_wield, check_for_attachment_fire, akimbo, fired_by_akimbo)
	if(!target || !user || world.time < beam_cooldown)
		return
	beam_cooldown = world.time + beam_delay
	addtimer(CALLBACK(src, PROC_REF(cooling_finished)), beam_delay)

	var/turf/beam_end = get_turf(user)
	var/beam_dir = get_dir(user, target)
	for(var/i in 1 to 24)
		var/turf/next_turf = get_step(beam_end, beam_dir)
		if(!next_turf)
			break
		beam_end = next_turf

	var/datum/beam/plasma_beam

	plasma_beam = user.beam(beam_end, "light_beam", 'icons/effects/beam.dmi', time = 0.7 SECONDS, maxdistance = 24, beam_type = plasma_beam_type, always_turn = TRUE)
	animate(plasma_beam.visuals, alpha = 255, time = 0.7 SECONDS, color = COLOR_PURPLE, luminosity = 3, easing = SINE_EASING|EASE_OUT)
	return ..()

/obj/item/weapon/gun/m78_pig/proc/cooling_finished()
	if(!QDELETED(src))
		playsound(src, 'sound/machines/beepalert.ogg', 4)
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
	name = "\improper M78 PIG powerpack"
	desc = "An all in one system designed to fascilitate carrying and powering the m78 PIG. This thing is really heavy."
	icon = 'icons/obj/items/clothing/backpack/backpacks_by_faction/UA.dmi'
	icon_state = "pig_powerpack"
	item_icons = list(
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/clothing/backpacks_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/clothing/backpacks_righthand.dmi',
		WEAR_BACK = 'icons/mob/humans/onmob/clothing/back/backpacks_by_faction/UA.dmi'
	)
	w_class = SIZE_LARGE
	drop_sound = "armorequip"
	flags_equip_slot = SLOT_BACK
	actions_types = list(/datum/action/item_action/m78_pig/use_weapon)
	var/obj/structure/m78_pig_mount/pig_mount
	var/move_delay_mult = 3


/obj/item/pig_backpack/Initialize(mapload)
	. = ..()
	pig_mount = new /obj/structure/m78_pig_mount(src)
	pig_mount.power_pack = src
	pig_mount.attach_weapon()

/obj/item/pig_backpack/Destroy()
	QDEL_NULL(pig_mount)
	. = ..()

/obj/item/pig_backpack/pickup(mob/user, silent)
	. = ..()
	RegisterSignal(user, COMSIG_HUMAN_POST_MOVE_DELAY, PROC_REF(handle_movedelay))

/obj/item/pig_backpack/proc/handle_movedelay(mob/user, list/movedata)
	SIGNAL_HANDLER
	movedata["move_delay"] += move_delay_mult

/obj/item/pig_backpack/dropped(mob/user, silent)
	. = ..()
	UnregisterSignal(user, COMSIG_HUMAN_POST_MOVE_DELAY)

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
	if(istype(W, /obj/item/heavygun_battery))
		var/obj/item/heavygun_battery/new_battery = W
		if(pig_mount.battery)
			var/obj/item/heavygun_battery/old_battery = pig_mount.battery
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
		var/obj/item/heavygun_battery/battery = pig_mount.battery
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
	var/image/IMG = image('icons/obj/items/weapons/guns/guns_by_faction/USCM/rocket_launchers.dmi', button, "m78")
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
	var/obj/item/heavygun_battery/battery
	var/atom/tether_holder

/obj/structure/m78_pig_mount/Initialize(mapload)
	. = ..()
	battery = new /obj/item/heavygun_battery(src)

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
