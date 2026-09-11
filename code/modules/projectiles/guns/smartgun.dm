//-------------------------------------------------------
//SMARTGUN

//Come get some.
#define DRAIN_ACCURACY_IMP "acc"
#define DRAIN_IFF "iff"
#define DRAIN_ALWAYS "default"
#define DRAIN_AUTO_AIM "autoaim"
#define DRAIN_RECOIL_COMP "recoil"
#define DRAIN_MD "md"
#define LYING_DOWN_SG_ROF_DEBUFF 0.5
#define KNOCKDOWN_SG_FAILSOUND_COOLDOWN 0.5
/obj/item/weapon/gun/smartgun
	name = "\improper M56B smartgun"
	desc = "The actual firearm in the 4-piece M56B Smartgun System. Essentially a heavy, mobile machinegun.\nYou may toggle firing restrictions by using a special action.\nAlt-click it to open the feed cover and allow for reloading."
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/USCM/machineguns.dmi'
	icon_state = "m56"
	item_state = "m56"
	item_icons = list(
	WEAR_BACK = 'icons/mob/humans/onmob/clothing/suit_storage/guns_by_type/smartguns.dmi',
		WEAR_J_STORE = 'icons/mob/humans/onmob/clothing/suit_storage/guns_by_type/smartguns.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/weapons/guns/smartguns_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/weapons/guns/smartguns_righthand.dmi'
	)
	mouse_pointer = 'icons/effects/mouse_pointer/smartgun_mouse.dmi'

	fire_sound = "gun_smartgun"
	fire_rattle = "gun_smartgun_rattle"
	reload_sound = 'sound/weapons/handling/gun_sg_reload.ogg'
	unload_sound = 'sound/weapons/handling/gun_sg_unload.ogg'

	current_mag = /obj/item/ammo_magazine/smartgun
	flags_equip_slot = NO_FLAGS
	w_class = SIZE_HUGE
	force = 20
	wield_delay = WIELD_DELAY_FAST
	aim_slowdown = SLOWDOWN_ADS_SPECIALIST
	unacidable = TRUE
	explo_proof = TRUE

	flags_gun_features = GUN_SPECIALIST|GUN_WIELDED_FIRING_ONLY
	gun_category = GUN_CATEGORY_HEAVY
	starting_attachment_types = list(/obj/item/attachable/smartbarrel)
	auto_retrieval_slot = WEAR_J_STORE
	start_semiauto = FALSE
	start_automatic = TRUE
//Onmob is huge there
	worn_x_dimension = 64
	inhand_x_dimension = 64
	hud_offset = -8
	pixel_x = -8

	ammo = /datum/ammo/bullet/smartgun
	actions_types = list(
		/datum/action/item_action/smartgun/toggle_ammo_type,
		/datum/action/item_action/smartgun/toggle_auto_aim,
		/datum/action/item_action/smartgun/toggle_lethal_mode,
		/datum/action/item_action/smartgun/toggle_motion_detector,
		/datum/action/item_action/smartgun/toggle_recoil_compensation,
		/datum/action/item_action/smartgun/toggle_armbrace,
	)
	attachable_allowed = list(
		/obj/item/attachable/smartbarrel,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/grip,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/gyro,
		/obj/item/attachable/lasersight,

	)

	var/obj/item/heavygun_battery/battery = null
	/// Whether the smartgun drains the battery (Ignored if requires_battery is false)
	var/requires_power = TRUE
	/// Whether the smartgun requires a battery
	var/requires_battery = TRUE
	/// Whether the smartgun requires a harness to use
	var/requires_harness = TRUE

	/// The current normal ammo datum
	var/datum/ammo/ammo_primary //Toggled ammo type
	/// The current AP ammo datum
	var/datum/ammo/ammo_secondary //Toggled ammo type
	/// Non-Frontline mode normal ammo datum
	var/datum/ammo/ammo_primary_def = /datum/ammo/bullet/smartgun
	/// Non-Frontline mode AP ammo datum
	var/datum/ammo/ammo_secondary_def = /datum/ammo/bullet/smartgun/armor_piercing
	/// Frontline mode normal ammo datum
	var/datum/ammo/ammo_primary_alt = /datum/ammo/bullet/smartgun/alt
	/// Frontline mode AP ammo datum
	var/datum/ammo/ammo_secondary_alt = /datum/ammo/bullet/smartgun/armor_piercing/alt
	/// Whether IFF mode is toggled on
	var/iff_enabled = TRUE //Begin with the safety on.
	/// Whether Frontline mode is toggled on
	var/frontline_enabled = FALSE //Begin with Frontline mode off.
	/// Whether we are using AP ammo currently
	var/secondary_toggled = FALSE
	var/recoil_compensation = TRUE
	var/accuracy_improvement = 0
	var/auto_aim = 0
	var/motion_detector = 0
	var/list/drain = list(DRAIN_ALWAYS = 11)
	var/range = 2
	var/obj/item/device/motiondetector/sg/MD
	var/long_range_cooldown = 2
	var/recycletime = 120
	var/cover_open = FALSE
	var/image/autoshot_image
	var/datum/weakref/last_autoshooter
	var/armbrace = FALSE
	COOLDOWN_DECLARE(knockdown_halt_sound_cooldown)

/obj/item/weapon/gun/smartgun/apply_bullet_effects(obj/projectile/projectile_to_fire, mob/user, i = 1, reflex = 0)
	. = ..()
	if(!HAS_TRAIT(src, TRAIT_GUN_SILENCED))
		if(!HAS_TRAIT(user, TRAIT_EAR_PROTECTION) && ishuman(user))
			var/mob/living/carbon/human/huser = user
			to_chat(user, SPAN_WARNING("Augh!! \The [src]'s firing resonates extremely loudly in your ears! You probably should have worn some sort of ear protection..."))
			huser.apply_effect(6, STUTTER)
			huser.AdjustEarDeafnessGuns(max(user.ear_deaf,2))

/obj/item/weapon/gun/smartgun/Initialize(mapload, ...)
	ammo_primary_def = GLOB.ammo_list[ammo_primary_def] //Gun initialize calls replace_ammo() so we need to set these first.
	ammo_secondary_def = GLOB.ammo_list[ammo_secondary_def]
	ammo_primary_alt = GLOB.ammo_list[ammo_primary_alt]
	ammo_secondary_alt = GLOB.ammo_list[ammo_secondary_alt]
	ammo_primary = ammo_primary_def
	ammo_secondary = ammo_secondary_def
	MD = new(src)
	battery = new /obj/item/heavygun_battery(src)
	muzzle_flash = "muzzle_flash_blue"
	muzzle_flash_color = COLOR_MUZZLE_BLUE
	autoshot_image = image('icons/effects/effects.dmi', null, "lock")
	autoshot_image.layer = ABOVE_XENO_LAYER
	autoshot_image.plane = GAME_PLANE
	autoshot_image.appearance_flags = RESET_COLOR|RESET_ALPHA|RESET_TRANSFORM|KEEP_APART
	autoshot_image.alpha = 190
	. = ..()
	AddComponent(/datum/component/iff_fire_prevention)
	update_icon()

/obj/item/weapon/gun/smartgun/Destroy()
	ammo_primary = null
	ammo_secondary = null
	QDEL_NULL(MD)
	QDEL_NULL(battery)
	. = ..()

/obj/item/weapon/gun/smartgun/cock(mob/user)
	to_chat(user, SPAN_WARNING("You can't manually unload a smartgun's chamber!"))
	return

/obj/item/weapon/gun/smartgun/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 16,"rail_x" = 17, "rail_y" = 18, "under_x" = 22, "under_y" = 14, "stock_x" = 22, "stock_y" = 14)

/obj/item/weapon/gun/smartgun/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_SG)
	fa_scatter_peak = FULL_AUTO_SCATTER_PEAK_TIER_8
	fa_max_scatter = SCATTER_AMOUNT_TIER_9
	if(accuracy_improvement)
		accuracy_mult += HIT_ACCURACY_MULT_TIER_3
	else
		accuracy_mult += HIT_ACCURACY_MULT_TIER_1
	if(recoil_compensation)
		scatter = SCATTER_AMOUNT_TIER_10
		recoil = RECOIL_OFF
	else
		scatter = SCATTER_AMOUNT_TIER_6
		recoil = RECOIL_AMOUNT_TIER_3
		damage_mult = BASE_BULLET_DAMAGE_MULT
	if(auto_aim)
		aim_slowdown = SLOWDOWN_ADS_SUPERWEAPON
	else
		aim_slowdown = SLOWDOWN_ADS_SPECIALIST
	if(!iff_enabled || frontline_enabled)
		ammo_primary = ammo_primary_alt
		ammo_secondary = ammo_secondary_alt
	else
		ammo_primary = ammo_primary_def
		ammo_secondary = ammo_secondary_def
	ammo = secondary_toggled ? ammo_secondary : ammo_primary

/obj/item/weapon/gun/smartgun/set_bullet_traits()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY_ID("iff", /datum/element/bullet_trait_iff)
	))

/obj/item/weapon/gun/smartgun/get_examine_text(mob/user)
	. = ..()
	var/rounds = 0
	if(current_mag && current_mag.current_rounds)
		rounds = current_mag.current_rounds
	var/message = "[rounds ? "Ammo counter shows [rounds] round\s remaining." : "It's dry."]"
	. += message
	. += "Frontline mode is [frontline_enabled ?  "<B>on</b>" : "<B>off</b>"]."
	. += "The restriction system is [iff_enabled ? "<B>on</b>" : "<B>off</b>"]."

	if(armbrace)
		. += SPAN_HELPFUL("The articulation arm is locked to your side, allowing it to be fired while lying down.")
	else
		. += SPAN_ORANGE("The articulation arm is not locked to your side, it can be knocked out of your hands.")

	if(battery && get_dist(user, src) <= 1)
		. += "A small gauge on [battery] reads: Power: [battery.power_cell.charge] / [battery.power_cell.maxcharge]."

/obj/item/weapon/gun/smartgun/clicked(mob/user, list/mods)
	if(mods[ALT_CLICK])
		if(!CAN_PICKUP(user, src))
			return ..()
		if(!locate(src) in list(user.get_active_hand(), user.get_inactive_hand()))
			return TRUE
		if(user.get_active_hand() && user.get_inactive_hand())
			to_chat(user, SPAN_WARNING("You can't do that with your hands full!"))
			return TRUE
		if(!cover_open)
			playsound(src.loc, 'sound/handling/smartgun_open.ogg', 50, TRUE, 3)
			to_chat(user, SPAN_NOTICE("You open \the [src]'s feed cover, allowing the drum to be removed."))
			cover_open = TRUE
		else
			playsound(src.loc, 'sound/handling/smartgun_close.ogg', 50, TRUE, 3)
			to_chat(user, SPAN_NOTICE("You close \the [src]'s feed cover."))
			cover_open = FALSE
		update_icon()
		return TRUE
	else
		return ..()

/obj/item/weapon/gun/smartgun/attackby(obj/item/attacking_object, mob/user)
	if(istype(attacking_object, /obj/item/heavygun_battery))
		var/obj/item/heavygun_battery/new_cell = attacking_object
		visible_message(SPAN_NOTICE("[user] swaps out the power cell in [src]."),
			SPAN_NOTICE("You swap out the power cell in [src] and drop the old one."))
		to_chat(user, SPAN_NOTICE("The new cell contains: [new_cell.power_cell.charge] power."))
		battery.update_icon()
		battery.forceMove(get_turf(user))
		battery = new_cell
		user.drop_inv_item_to_loc(new_cell, src)
		playsound(src, 'sound/machines/click.ogg', 25, 1)
		return

	return ..()

/obj/item/weapon/gun/smartgun/replace_magazine(mob/user, obj/item/ammo_magazine/magazine)
	if(!cover_open)
		to_chat(user, SPAN_WARNING("\The [src]'s feed cover is closed! You can't put a new drum in! (alt-click to open it)"))
		return
	. = ..()

/obj/item/weapon/gun/smartgun/unload(mob/user, reload_override, drop_override, loc_override)
	if(!cover_open)
		to_chat(user, SPAN_WARNING("\The [src]'s feed cover is closed! You can't take out the drum! (alt-click to open it)"))
		return
	. = ..()

/obj/item/weapon/gun/smartgun/get_ammo_type_chambered(mob/user)
	return ammo_primary

/obj/item/weapon/gun/smartgun/update_icon()
	. = ..()
	if(cover_open)
		overlays += "+[base_gun_icon]_cover_open"
	else
		overlays += "+[base_gun_icon]_cover_closed"

//---ability actions--\\

/datum/action/item_action/smartgun/action_activate()
	. = ..()
	var/obj/item/weapon/gun/smartgun/G = holder_item
	if(!ishuman(owner))
		return
	var/mob/living/carbon/human/H = owner
	if(H.is_mob_incapacitated() || G.get_active_firearm(H, FALSE) != holder_item)
		return

/datum/action/item_action/smartgun/update_button_icon()
	return

/datum/action/item_action/smartgun/toggle_motion_detector/New(Target, obj/item/holder)
	. = ..()
	name = "Toggle Motion Detector"
	action_icon_state = "motion_detector"
	button.name = name
	button.overlays.Cut()
	button.overlays += image('icons/mob/hud/actions.dmi', button, action_icon_state)

/datum/action/item_action/smartgun/toggle_motion_detector/action_activate()
	. = ..()
	var/obj/item/weapon/gun/smartgun/G = holder_item
	G.toggle_motion_detector(usr)

/datum/action/item_action/smartgun/toggle_motion_detector/proc/update_icon()
	if(!holder_item)
		return
	var/obj/item/weapon/gun/smartgun/G = holder_item
	if(G.motion_detector)
		button.icon_state = "template_on"
	else
		button.icon_state = "template"

/datum/action/item_action/smartgun/toggle_auto_aim/New(Target, obj/item/holder)
	. = ..()
	name = "Toggle Aim Assist"
	action_icon_state = "autofire"
	listen_signal = COMSIG_KB_HUMAN_WEAPON_TOGGLE_AIM_ASSIST
	button.name = name
	button.overlays.Cut()
	button.overlays += image('icons/mob/hud/actions.dmi', button, action_icon_state)

/datum/action/item_action/smartgun/toggle_auto_aim/action_activate()
	. = ..()
	var/obj/item/weapon/gun/smartgun/toggledgun= holder_item
	toggledgun.toggle_auto_aim(usr)

/datum/action/item_action/smartgun/toggle_auto_aim/proc/update_icon()
	if(!holder_item)
		return
	var/obj/item/weapon/gun/smartgun/toggledgun = holder_item
	if(toggledgun.auto_aim)
		button.icon_state = "template_on"
	else
		button.icon_state = "template"

/datum/action/item_action/smartgun/toggle_accuracy_improvement/New(Target, obj/item/holder)
	. = ..()
	name = "Toggle Accuracy Improvement"
	action_icon_state = "accuracy_improvement"
	button.name = name
	button.overlays.Cut()
	button.overlays += image('icons/mob/hud/actions.dmi', button, action_icon_state)

/datum/action/item_action/smartgun/toggle_accuracy_improvement/action_activate()
	. = ..()
	var/obj/item/weapon/gun/smartgun/G = holder_item
	G.toggle_accuracy_improvement(usr)
	if(G.accuracy_improvement)
		button.icon_state = "template_on"
	else
		button.icon_state = "template"

/datum/action/item_action/smartgun/toggle_recoil_compensation/New(Target, obj/item/holder)
	. = ..()
	name = "Toggle Recoil Compensation"
	action_icon_state = "recoil_compensation"
	button.name = name
	button.overlays.Cut()
	button.overlays += image('icons/mob/hud/actions.dmi', button, action_icon_state)

/datum/action/item_action/smartgun/toggle_recoil_compensation/action_activate()
	. = ..()
	var/obj/item/weapon/gun/smartgun/G = holder_item
	G.toggle_recoil_compensation(usr)
	if(G.recoil_compensation)
		button.icon_state = "template_on"
	else
		button.icon_state = "template"

/datum/action/item_action/smartgun/toggle_frontline_mode/New(Target, obj/item/holder)
	. = ..()
	name = "Toggle Frontline Mode"
	action_icon_state = "frontline_toggle_off"
	listen_signal = COMSIG_KB_HUMAN_WEAPON_TOGGLE_FRONTLINE_MODE
	button.name = name
	button.overlays.Cut()
	button.overlays += image ('icons/mob/hud/actions.dmi', button, action_icon_state)

/datum/action/item_action/smartgun/toggle_frontline_mode/action_activate()
	. = ..()
	var/obj/item/weapon/gun/smartgun/gun = holder_item
	gun.toggle_frontline_mode(owner)
	if(gun.frontline_enabled)
		action_icon_state = "frontline_toggle_on"
	else
		action_icon_state = "frontline_toggle_off"
	button.overlays.Cut()
	button.overlays += image('icons/mob/hud/actions.dmi', button, action_icon_state)

/datum/action/item_action/smartgun/toggle_lethal_mode/New(Target, obj/item/holder)
	. = ..()
	name = "Toggle IFF"
	action_icon_state = "iff_toggle_on"
	button.name = name
	button.overlays.Cut()
	button.overlays += image('icons/mob/hud/actions.dmi', button, action_icon_state)

/datum/action/item_action/smartgun/toggle_lethal_mode/action_activate()
	. = ..()
	var/obj/item/weapon/gun/smartgun/G = holder_item
	G.toggle_lethal_mode(usr)
	if(G.iff_enabled)
		action_icon_state = "iff_toggle_on"
	else
		action_icon_state = "iff_toggle_off"
	button.overlays.Cut()
	button.overlays += image('icons/mob/hud/actions.dmi', button, action_icon_state)

/datum/action/item_action/smartgun/toggle_ammo_type/New(Target, obj/item/holder)
	. = ..()
	name = "Toggle Ammo Type"
	action_icon_state = "ammo_swap_normal"
	button.name = name
	button.overlays.Cut()
	button.overlays += image('icons/mob/hud/actions.dmi', button, action_icon_state)

/datum/action/item_action/smartgun/toggle_ammo_type/action_activate()
	. = ..()
	var/obj/item/weapon/gun/smartgun/G = holder_item
	G.toggle_ammo_type(usr)

/datum/action/item_action/smartgun/toggle_ammo_type/proc/update_icon()
	var/obj/item/weapon/gun/smartgun/G = holder_item
	if(G.secondary_toggled)
		action_icon_state = "ammo_swap_ap"
	else
		action_icon_state = "ammo_swap_normal"
	button.overlays.Cut()
	button.overlays += image('icons/mob/hud/actions.dmi', button, action_icon_state)

/datum/action/item_action/smartgun/toggle_armbrace/New(Target, obj/item/holder)
	. = ..()
	name = "Toggle Servo arm"
	action_icon_state = "armbrace"
	button.icon_state = "template"
	button.name = name
	button.overlays.Cut()
	button.overlays += image('icons/mob/hud/actions.dmi', button, action_icon_state)

/datum/action/item_action/smartgun/toggle_armbrace/action_activate()
	. = ..()
	var/obj/item/weapon/gun/smartgun/G = holder_item
	G.toggle_armbrace(usr)
	if(G.armbrace)
		action_icon_state = "armbrace_on"
	else
		action_icon_state = "armbrace"
	button.overlays.Cut()
	button.overlays += image('icons/mob/hud/actions.dmi', button, action_icon_state)

//more general procs

/obj/item/weapon/gun/smartgun/proc/toggle_armbrace(mob/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/human = user
	if(!human.wear_suit || !(human.wear_suit.flags_inventory & SMARTGUN_HARNESS))
		to_chat(user, "[icon2html(src, usr)] You can't engage the servo arm without a harness.")
		return

	to_chat(user, "[icon2html(src, usr)] You [armbrace ? "<B>disengage</b>" : "<B>engage</b>"] \the [src]'s servo arm.")
	armbrace = !armbrace
	if(armbrace)
		flags_item |= NODROP|FORCEDROP_CONDITIONAL
		pick(playsound(src.loc, 'sound/weapons/smartgun_move.mp3', 55, 1), playsound(src.loc, 'sound/weapons/smartgun_move2.mp3', 25, 1))
	else
		flags_item &= ~(NODROP|FORCEDROP_CONDITIONAL)
		pick(playsound(src.loc, 'sound/weapons/smartgun_move.mp3', 55, 1), playsound(src.loc, 'sound/weapons/smartgun_move2.mp3', 25, 1))

/obj/item/weapon/gun/smartgun/proc/force_off_armbrace(mob/user)
	if(armbrace)
		to_chat(user, "[icon2html(src, usr)] You <B>disengage</b> \the [src]'s armbrace.")
		pick(playsound(src.loc, 'sound/weapons/smartgun_move.mp3', 55, 1), playsound(src.loc, 'sound/weapons/smartgun_move2.mp3', 25, 1))
		armbrace = FALSE
		flags_item &= ~(NODROP|FORCEDROP_CONDITIONAL)
		var/datum/action/item_action/armbrace_action = locate(/datum/action/item_action/smartgun/toggle_armbrace) in actions
		armbrace_action.button.icon_state = "template"

/obj/item/weapon/gun/smartgun/proc/force_on_armbrace(mob/user)
	if(!armbrace)
		to_chat(user, "[icon2html(src, usr)] You <B>engage</b> \the [src]'s armbrace.")
		pick(playsound(src.loc, 'sound/weapons/smartgun_move.mp3', 55, 1), playsound(src.loc, 'sound/weapons/smartgun_move2.mp3', 25, 1))
		armbrace = TRUE
		flags_item |= NODROP|FORCEDROP_CONDITIONAL
		var/datum/action/item_action/armbrace_action = locate(/datum/action/item_action/smartgun/toggle_armbrace) in actions
		armbrace_action.button.icon_state = "template_on"

/obj/item/weapon/gun/smartgun/unequipped(mob/user, slot)
	. = ..()
	if(!gc_destroyed)
		INVOKE_NEXT_TICK(src, TYPE_PROC_REF(/obj/item/weapon/gun/smartgun, emergency_snap_back), user) //yeah

/obj/item/weapon/gun/smartgun/proc/emergency_snap_back(mob/user)
	if(ishuman(user))
		if(!ishuman(loc))
			var/mob/living/carbon/human/armbrace_human = user
			if(isitem(armbrace_human.get_item_by_slot(auto_retrieval_slot)))
				if(istype(armbrace_human.wear_suit, /obj/item/clothing/suit/storage/marine/smartgunner))
					force_on_armbrace()
					armbrace_human.put_in_hands(src, drop_on_fail = TRUE)
					return
		force_off_armbrace(user)

/obj/item/weapon/gun/smartgun/proc/toggle_frontline_mode(mob/user, silent)
	to_chat(user, "[icon2html(src, user)] You [frontline_enabled? "<B>disable</b>" : "<B>enable</b>"] [src]'s frontline mode. You will now [frontline_enabled ? "be able to shoot through friendlies" : "deal increased damage but be unable to shoot through friendlies"].")
	if(!silent)
		balloon_alert(user, "frontline mode [frontline_enabled ? "disabled" : "enabled"]")
		playsound(loc,'sound/machines/click.ogg', 25, 1)
	frontline_enabled = !frontline_enabled
///Determines the color of the muzzle flash, depending on whether frontline mode is enabled or not.
	if (!frontline_enabled)
		muzzle_flash = "muzzle_flash_blue"
		muzzle_flash_color = COLOR_MUZZLE_BLUE
	else
		muzzle_flash = "muzzle_flash"
		muzzle_flash_color = COLOR_VERY_SOFT_YELLOW

	SEND_SIGNAL(src, COMSIG_GUN_ALT_IFF_TOGGLED, frontline_enabled)
	recalculate_attachment_bonuses()
///Having the SG check it's config after toggling frontline mode & IFF is essential, or it won't update properly.
///e.g. turning IFF off, firing once, turning IFF on will let the user fire frontline bullets over friendlies if the gun doesn't check.
	set_gun_config_values()

/obj/item/weapon/gun/smartgun/able_to_fire(mob/living/user)
	. = ..()
	if(.)
		if(!ishuman(user))
			return FALSE
		var/mob/living/carbon/human/H = user
		if(!skillcheckexplicit(user, SKILL_SPEC_WEAPONS, SKILL_SPEC_SMARTGUN) && !skillcheckexplicit(user, SKILL_SPEC_WEAPONS, SKILL_SPEC_ALL))
			balloon_alert(user, "incorrect posture!")
			return FALSE
		if(requires_harness)
			if(!H.wear_suit || !(H.wear_suit.flags_inventory & SMARTGUN_HARNESS))
				balloon_alert(user, "harness required")
				return FALSE
		if(cover_open)
			to_chat(H, SPAN_WARNING("You can't fire \the [src] with the feed cover open! (alt-click to close)"))
			balloon_alert(user, "cannot fire; feed cover open")
			return FALSE
		if(!armbrace)
			to_chat(H, SPAN_WARNING("You can't aim \the [src] with the articulation arm disengaged!"))
			balloon_alert(user, "error!, no connection!")
			return FALSE


/obj/item/weapon/gun/smartgun/unique_action(mob/user)
	if(isobserver(usr) || isxeno(usr))
		return
	toggle_ammo_type(usr)

/obj/item/weapon/gun/smartgun/proc/toggle_ammo_type(mob/user)
	secondary_toggled = !secondary_toggled
	to_chat(user, "[icon2html(src, user)] You changed [src]'s ammo preparation procedures. You now fire [secondary_toggled ? "armor piercing rounds" : "highly precise rounds"].")
	balloon_alert(user, "firing [secondary_toggled ? "armor piercing" : "highly precise"]")
	playsound(loc,'sound/machines/click.ogg', 25, 1)
	ammo = secondary_toggled ? ammo_secondary : ammo_primary
	var/datum/action/item_action/smartgun/toggle_ammo_type/TAT = locate(/datum/action/item_action/smartgun/toggle_ammo_type) in actions
	TAT.update_icon()

/obj/item/weapon/gun/smartgun/replace_ammo()
	..()
	ammo = secondary_toggled ? ammo_secondary : ammo_primary

/obj/item/weapon/gun/smartgun/proc/toggle_lethal_mode(mob/user)
	to_chat(user, "[icon2html(src, usr)] You [iff_enabled? "<B>disable</b>" : "<B>enable</b>"] \the [src]'s fire restriction. You will [iff_enabled ? "harm anyone in your way" : "target through IFF"].")
	balloon_alert(user, "[iff_enabled ? "disabled" : "enabled"] IFF")
	playsound(loc,'sound/machines/click.ogg', 25, 1)
	iff_enabled = !iff_enabled
	ammo = ammo_primary
	secondary_toggled = FALSE
	if(iff_enabled)
		add_bullet_trait(BULLET_TRAIT_ENTRY_ID("iff", /datum/element/bullet_trait_iff))
		drain[DRAIN_IFF] = 10
		MD.iff_signal = initial(MD.iff_signal)
		SEND_SIGNAL(src, COMSIG_GUN_ALT_IFF_TOGGLED, frontline_enabled)
	if(!iff_enabled)
		remove_bullet_trait("iff")
		drain.Remove(DRAIN_IFF)
		MD.iff_signal = null
		SEND_SIGNAL(src, COMSIG_GUN_ALT_IFF_TOGGLED, FALSE)
		recalculate_attachment_bonuses()
///Having the SG check it's config after toggling frontline mode & IFF is essential, or it won't update properly.
///e.g. turning IFF off, firing once, turning IFF on will let the user fire frontline bullets over friendlies if the gun doesn't check.
	set_gun_config_values()

/obj/item/weapon/gun/smartgun/Fire(atom/target, mob/living/user, params, reflex = FALSE, dual_wield)
	target = get_target(user, target)

	if(user.IsKnockDown())
		if(COOLDOWN_FINISHED(src, knockdown_halt_sound_cooldown))
			COOLDOWN_START(src, knockdown_halt_sound_cooldown, KNOCKDOWN_SG_FAILSOUND_COOLDOWN)
			if(flags_item & WIELDED)
				playsound(loc,"smartgun_knockdown", 25, 0)
				if((locate(/datum/effects/crit) in user.effects_list))
					unwield(user)
			return
	if(user.body_position == LYING_DOWN)
		set_gun_config_values()
		modify_fire_delay(LYING_DOWN_SG_ROF_DEBUFF)
		scatter += 1
		fa_scatter_peak = FULL_AUTO_SCATTER_PEAK_TIER_5
	else
		set_gun_config_values()

	if(!requires_battery)
		return ..()

	if(battery)
		if(!requires_power)
			return ..()
		if(drain_battery())
			return ..()

/obj/item/weapon/gun/smartgun/proc/drain_battery(override_drain)

	var/calculated_drain = 0
	for(var/drain_item in drain)
		calculated_drain += drain[drain_item]

	var/actual_drain = (rand(calculated_drain / 2, calculated_drain) / 25)


	if(override_drain)
		actual_drain = (rand(override_drain / 2, override_drain) / 25)

	if(battery && battery.power_cell.charge > 0)
		if(battery.power_cell.charge > actual_drain)
			battery.power_cell.charge -= actual_drain
		else
			battery.power_cell.charge = 0
			to_chat(usr, SPAN_WARNING("[src] emits a low power warning and immediately shuts down!"))
			return FALSE
		return TRUE
	if(!battery || battery.power_cell.charge == 0)
		balloon_alert(usr, "low power")
		return FALSE
	return FALSE

/obj/item/weapon/gun/smartgun/proc/toggle_recoil_compensation(mob/user)
	to_chat(user, "[icon2html(src, usr)] You [recoil_compensation? "<B>disable</b>" : "<B>enable</b>"] \the [src]'s recoil compensation.")
	balloon_alert(user, "recoil compensation [recoil_compensation ? "disabled" : "enabled"]")
	pick(playsound(src.loc, 'sound/weapons/smartgun_move.mp3', 55, 1), playsound(src.loc, 'sound/weapons/smartgun_move2.mp3', 25, 1))
	recoil_compensation = !recoil_compensation
	if(recoil_compensation)
		drain[DRAIN_RECOIL_COMP] = 50
	else
		drain.Remove(DRAIN_RECOIL_COMP)
	recalculate_attachment_bonuses() //Includes set_gun_config_values() as well as attachments.

/obj/item/weapon/gun/smartgun/proc/toggle_accuracy_improvement(mob/user)
	to_chat(user, "[icon2html(src, usr)] You [accuracy_improvement? "<B>disable</b>" : "<B>enable</b>"] \the [src]'s accuracy improvement.")
	balloon_alert(user, "accuracy improvement [accuracy_improvement ? "disabled" : "enabled"]")
	playsound(loc,'sound/machines/click.ogg', 25, 1)
	accuracy_improvement = !accuracy_improvement
	if(accuracy_improvement)
		drain[DRAIN_ACCURACY_IMP] = 50
	else
		drain.Remove(DRAIN_ACCURACY_IMP)
	recalculate_attachment_bonuses()

/obj/item/weapon/gun/smartgun/proc/toggle_auto_aim(mob/user)
	if(!armbrace)
		to_chat(user, "[icon2html(src, user)] Error! [src]'s articulation arm is not engaged/connected.")
		balloon_alert(user, "Error!, No connection!")
		return
	else
		to_chat(user, "[icon2html(src, user)] You [auto_aim ? "<B>disable</b>" : "<B>enable</b>"] \the [src]'s aim assist.")
		balloon_alert(user, "aim assist [auto_aim ? "disabled" : "enabled"]")
		playsound(loc, 'sound/machines/twobeep.ogg', 50, 1)
		auto_aim = !auto_aim

		if(auto_aim)
			enable_auto_aim(user)
		else
			disable_auto_aim(user)

/obj/item/weapon/gun/smartgun/proc/enable_auto_aim(mob/user)
	drain[DRAIN_AUTO_AIM] = 200
	START_PROCESSING(SSobj, src)
	var/datum/action/item_action/smartgun/toggle_auto_aim/auto_aim_action = locate(/datum/action/item_action/smartgun/toggle_auto_aim) in actions
	auto_aim_action.update_icon()
	unwield(user)
	recalculate_attachment_bonuses()

/obj/item/weapon/gun/smartgun/proc/disable_auto_aim(mob/user)
	drain.Remove(DRAIN_AUTO_AIM)
	auto_aim = FALSE
	var/datum/action/item_action/smartgun/toggle_auto_aim/auto_aim_action = locate(/datum/action/item_action/smartgun/toggle_auto_aim) in actions
	auto_aim_action.update_icon()
	unwield(user)
	recalculate_attachment_bonuses()

/obj/item/weapon/gun/smartgun/wield(mob/living/user)
	if(auto_aim)
		to_chat(user, SPAN_NOTICE("You start adjusting your stance to allow [src] to guide your aim."))
		if(!do_after(user, 15, INTERRUPT_ALL, BUSY_ICON_HOSTILE, src, INTERRUPT_DIFF_LOC))
			return
		pick(playsound(src.loc, 'sound/weapons/smartgun_move.mp3', 55, 1), playsound(src.loc, 'sound/weapons/smartgun_move2.mp3', 55, 1))

	. = ..()
	user.client.images |= autoshot_image

/obj/item/weapon/gun/smartgun/unwield(mob/user)
	. = ..()
	user.client?.images -= autoshot_image
	reset_autoshot_image()

/obj/item/weapon/gun/smartgun/proc/reset_autoshot_image()
	autoshot_image.loc = null
	autoshot_image.pixel_x = 0
	autoshot_image.pixel_y = 0

/obj/item/weapon/gun/smartgun/proc/set_autoshot_image(mob/living/target, user)
	visible_message(SPAN_WARNING("[src] targets [target]"))
	autoshot_image.loc = target
	autoshot_image.pixel_x = -target.pixel_x // -16 is counted by -(-16)
	autoshot_image.pixel_y = -target.pixel_y
	new /obj/effect/warning/explosive/target_lock(target.loc, 0.5 SECONDS)
	if(prob(5))
		pick(playsound(src.loc, 'sound/weapons/smartgun_move.mp3', 100, 1), playsound(src.loc, 'sound/weapons/smartgun_move2.mp3', 100, 1))
		to_chat(user, "[icon2html(src, user)] The [src]'s target tracking adjusts your aim.")

/obj/item/weapon/gun/smartgun/process()
	if(!auto_aim && !motion_detector)
		STOP_PROCESSING(SSobj, src)
		return

	if(auto_aim && last_fired + 1 SECONDS <= world.time)
		reset_autoshot_image()

	if(motion_detector)
		recycletime--
		if(!recycletime)
			recycletime = initial(recycletime)
			MD.refresh_blip_pool()

		long_range_cooldown--
		if(long_range_cooldown)
			return
		long_range_cooldown = initial(long_range_cooldown)
		MD.scan()

/obj/item/weapon/gun/smartgun/proc/get_target(mob/living/user, target)
	if(!auto_aim)
		return target

	var/dist_unconscious = 9999
	var/dist_conscious = 9999

	var/mob/living/unconscious_target = null
	var/mob/living/conscious_target = null

	for(var/mob/living/targetted_mob in range(range, target) & oviewers(user.get_maximum_view_range(), user))
		if(targetted_mob.invisibility)
			continue

		if(HAS_TRAIT(targetted_mob, TRAIT_ABILITY_BURROWED))
			continue

		if(targetted_mob.is_ventcrawling)
			continue

		if(targetted_mob.stat == DEAD)
			continue // No dead or non living.

		if(iff_enabled && targetted_mob.get_target_lock(user.faction_group))
			continue

		var/dist = get_dist_sqrd(user, targetted_mob)

		if(targetted_mob.stat == UNCONSCIOUS && dist_unconscious > dist)
			dist_unconscious = dist
			unconscious_target = targetted_mob
		else if(dist_conscious > dist)
			dist_conscious = dist
			conscious_target = targetted_mob

	if(conscious_target)
		set_autoshot_image(conscious_target)
		. = conscious_target
	else if(unconscious_target)
		set_autoshot_image(unconscious_target)
		. = unconscious_target
	else
		. = target
		reset_autoshot_image()

/obj/item/weapon/gun/smartgun/proc/toggle_motion_detector(mob/user)
	to_chat(user, "[icon2html(src, usr)] You [motion_detector? "<B>disable</b>" : "<B>enable</b>"] \the [src]'s motion detector.")
	balloon_alert(user, "motion detector [motion_detector ? "disabled" : "enabled"]")
	playsound(loc,'sound/items/detector_turn_on.ogg', 25, 1)
	motion_detector = !motion_detector
	var/datum/action/item_action/smartgun/toggle_motion_detector/TMD = locate(/datum/action/item_action/smartgun/toggle_motion_detector) in actions
	TMD.update_icon()
	motion_detector()

/obj/item/weapon/gun/smartgun/proc/motion_detector()
	if(motion_detector)
		drain[DRAIN_MD] = 15
		START_PROCESSING(SSobj, src)
	if(!motion_detector)
		drain.Remove(DRAIN_MD)

//CO SMARTGUN
/obj/item/weapon/gun/smartgun/co
	name = "\improper M56C 'Cavalier' smartgun"
	desc = "The actual firearm in the 4-piece M56C Smartgun system. Back order only. Besides a more robust weapons casing, an ID lock system and a fancy paintjob, the gun's performance is identical to the standard-issue M56B.\nAlt-click it to open the feed cover and allow for reloading."
	icon_state = "m56c"
	item_state = "m56c"
	var/mob/living/carbon/human/linked_human
	var/is_locked = TRUE
	random_cosmetic_chance = 10
	random_spawn_cosmetic = list(
		/obj/item/attachable/cosmetic/uscm_flag,
	)
/obj/item/weapon/gun/smartgun/co/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 16,"rail_x" = 17, "rail_y" = 18, "under_x" = 22, "under_y" = 14, "stock_x" = 22, "stock_y" = 14, "cosmetic_x" = 16, "cosmetic_y" = 16)

/obj/item/weapon/gun/smartgun/co/update_icon()
	. = ..()
	if(locate(/obj/item/attachable/cosmetic/uscm_flag) in src)
		item_state = "m56c_flag"
		item_state_slots[WEAR_J_STORE] ="m56c_flag"
		item_state_slots[WEAR_BACK] ="m56c_flag"

/obj/item/weapon/gun/smartgun/co/Initialize(mapload, ...)
	LAZYADD(actions_types, /datum/action/item_action/co_sg/toggle_id_lock)
	. = ..()

/obj/item/weapon/gun/smartgun/co/able_to_fire(mob/user)
	. = ..()
	if(is_locked && linked_human && linked_human != user)
		if(linked_human.is_revivable() || linked_human.stat != DEAD)
			to_chat(user, SPAN_WARNING("[icon2html(src, usr)] Trigger locked by [src]. Unauthorized user."))
			playsound(loc,'sound/weapons/gun_empty.ogg', 25, 1)
			return FALSE

		UnregisterSignal(linked_human, COMSIG_PARENT_QDELETING)
		linked_human = null
		is_locked = FALSE

// ID lock action \\

/datum/action/item_action/co_sg/action_activate()
	. = ..()
	var/obj/item/weapon/gun/smartgun/co/protag_gun = holder_item
	if(!ishuman(owner))
		return
	var/mob/living/carbon/human/protagonist = owner
	if(protagonist.is_mob_incapacitated() || protag_gun.get_active_firearm(protagonist, FALSE) != holder_item)
		return

/datum/action/item_action/co_sg/update_button_icon()
	return

/datum/action/item_action/co_sg/toggle_id_lock/New(Target, obj/item/holder)
	. = ..()
	name = "Toggle ID lock"
	action_icon_state = "id_lock_locked"
	button.name = name
	button.overlays.Cut()
	button.overlays += image('icons/mob/hud/actions.dmi', button, action_icon_state)

/datum/action/item_action/co_sg/toggle_id_lock/action_activate()
	. = ..()
	var/obj/item/weapon/gun/smartgun/co/protag_gun = holder_item
	protag_gun.toggle_lock()
	if(protag_gun.is_locked)
		action_icon_state = "id_lock_locked"
	else
		action_icon_state = "id_lock_unlocked"
	button.overlays.Cut()
	button.overlays += image('icons/mob/hud/actions.dmi', button, action_icon_state)

/obj/item/weapon/gun/smartgun/co/proc/toggle_lock(mob/user)
	if(linked_human && usr != linked_human)
		to_chat(usr, SPAN_WARNING("[icon2html(src, usr)] Action denied by \the [src]. Unauthorized user."))
		return
	else if(!linked_human)
		name_after_co(usr)

	is_locked = !is_locked
	to_chat(usr, SPAN_NOTICE("[icon2html(src, usr)] You [is_locked? "lock": "unlock"] \the [src]."))
	playsound(loc,'sound/machines/click.ogg', 25, 1)

// action end \\

/obj/item/weapon/gun/smartgun/co/pickup(user)
	if(!linked_human)
		src.name_after_co(user, src)
		to_chat(usr, SPAN_NOTICE("[icon2html(src, usr)] You pick up \the [src], registering yourself as its owner."))
	..()


/obj/item/weapon/gun/smartgun/co/proc/name_after_co(mob/living/carbon/human/H, obj/item/weapon/gun/smartgun/co/I)
	linked_human = H
	RegisterSignal(linked_human, COMSIG_PARENT_QDELETING, PROC_REF(remove_idlock))

/obj/item/weapon/gun/smartgun/co/get_examine_text()
	. = ..()
	if(linked_human)
		if(is_locked)
			. += SPAN_NOTICE("It is registered to [linked_human].")
		else
			. += SPAN_NOTICE("It is registered to [linked_human] but has its fire restrictions unlocked.")
	else
		. += SPAN_NOTICE("It's unregistered. Pick it up to register yourself as its owner.")
	if(!iff_enabled)
		. += SPAN_WARNING("Its IFF restrictions are disabled.")

/obj/item/weapon/gun/smartgun/co/proc/remove_idlock()
	SIGNAL_HANDLER
	linked_human = null

//TERMINATOR SMARTGUN
/obj/item/weapon/gun/smartgun/upp
	name = "\improper UPP Gattling smartgun"
	desc = "The actual firearm in the 4-piece UPP Gattling Smartgun System. If you have this, you're about to bring some serious pain to anyone in your way.\nYou may toggle firing restrictions by using a special action.\nAlt-click it to open the feed cover and allow for reloading."
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/UPP/machineguns.dmi'
	icon_state = "gatling"
	fire_sound = 'sound/weapons/gun_minigun.ogg'
	actions_types = list(
		/datum/action/item_action/smartgun/toggle_accuracy_improvement,
		/datum/action/item_action/smartgun/toggle_ammo_type,
		/datum/action/item_action/smartgun/toggle_auto_aim,
		/datum/action/item_action/smartgun/toggle_lethal_mode,
		/datum/action/item_action/smartgun/toggle_motion_detector,
		/datum/action/item_action/smartgun/toggle_recoil_compensation,
		/datum/action/item_action/smartgun/toggle_armbrace,
	)
/obj/item/weapon/gun/smartgun/upp/Initialize(mapload, ...)
	. = ..()
	MD.iff_signal = FACTION_UPP

/obj/item/weapon/gun/smartgun/dirty
	name = "\improper M56D 'Dirty' smartgun"
	desc = "The actual firearm in the 4-piece M56D Smartgun System. If you have this, you're about to bring some serious pain to anyone in your way.\nYou may toggle firing restrictions by using a special action.\nAlt-click it to open the feed cover and allow for reloading."
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/WY/machineguns.dmi'
	icon_state = "l56d"
	current_mag = /obj/item/ammo_magazine/smartgun/dirty
	ammo = /obj/item/ammo_magazine/smartgun/dirty
	ammo_primary //Toggled ammo type
	ammo_secondary //Toggled ammo type
	ammo_primary_def = /datum/ammo/bullet/smartgun/dirty
	ammo_secondary_def = /datum/ammo/bullet/smartgun/dirty/armor_piercing
	ammo_primary_alt = /datum/ammo/bullet/smartgun/dirty/alt
	ammo_secondary_alt = /datum/ammo/bullet/smartgun/dirty/armor_piercing/alt
	flags_gun_features = GUN_WY_RESTRICTED|GUN_SPECIALIST|GUN_WIELDED_FIRING_ONLY

/obj/item/weapon/gun/smartgun/dirty/Initialize(mapload, ...)
	. = ..()
	MD.iff_signal = FACTION_PMC

//TERMINATOR SMARTGUN
/obj/item/weapon/gun/smartgun/dirty/elite
	name = "\improper M56T 'Terminator' smartgun"
	desc = "The actual firearm in the 4-piece M56T Smartgun System. If you have this, you're about to bring some serious pain to anyone in your way.\nYou may toggle firing restrictions by using a special action.\nAlt-click it to open the feed cover and allow for reloading."
	fire_sound = "gun_smartgun"
	actions_types = list(
		/datum/action/item_action/smartgun/toggle_accuracy_improvement,
		/datum/action/item_action/smartgun/toggle_ammo_type,
		/datum/action/item_action/smartgun/toggle_auto_aim,
		/datum/action/item_action/smartgun/toggle_lethal_mode,
		/datum/action/item_action/smartgun/toggle_motion_detector,
		/datum/action/item_action/smartgun/toggle_recoil_compensation,
		/datum/action/item_action/smartgun/toggle_armbrace,
	)

/obj/item/weapon/gun/smartgun/dirty/elite/Initialize(mapload, ...)
	. = ..()
	MD.iff_signal = FACTION_WY_DEATHSQUAD

/obj/item/weapon/gun/smartgun/dirty/elite/set_gun_config_values()
	..()
	set_burst_amount(BURST_AMOUNT_TIER_5)
	set_burst_delay(FIRE_DELAY_TIER_12)
	if(!recoil_compensation)
		scatter = SCATTER_AMOUNT_TIER_8
	burst_scatter_mult = SCATTER_AMOUNT_TIER_10
	set_fire_delay(FIRE_DELAY_TIER_12)
	fa_scatter_peak = FULL_AUTO_SCATTER_PEAK_TIER_10
	fa_max_scatter = SCATTER_AMOUNT_NONE

// CLF SMARTGUN

#define CLF_SMARTGUN_UNJAM_CHANCE 20

/obj/item/weapon/gun/smartgun/clf
	name = "\improper scavenged M56 'Freedom' smartgun"
	desc = "A smartgun abomination made from salvaged-parts sloppily wired and welded together, it appears to be rusted across it's frame. As whoever made this thing, clearly had no resources or proper tools to assemble it to an efficient usable state."
	desc_lore = {"After long-fiery battles that partook within the Neroid Sector of the frontier, the United States Colonial Marines were pushed out by Colonial Liberation Front cells. Through a set of tactics, utilizing guerilla warfare mostly based around hit-and runs to compensate for the lack of proper logistics.

		On it's aftermath gear unrecovered was left on the way, which the front proceeded to use to their own advantage. Taking what they could from the corpses of the infantry left behind to cover their needs, the mechanisms and electronics from the M56A2's were extracted from the broken-down exemplarys. Then placed into a makeshift frame although primitive and rudimentary due to no detailed schematics or resources at hand. Then issued out as  a desperate measure of giving an equal fire-support weapon to it's troops.

		After studys done on this frankenstein of a weapon by the USCM, it reportedly was using parts from the slightly outdated M56, mainly it's barrel to outfit it, as  an unintentioned flaw it jams constantly requiring extensive  and frequent maintenance making it almost unreliable. The M57 and L56A2 were also scrapped for spare-parts to put it together, as the rarity of parts themselves was a prominent fabrication issue for the insurgency cells."}
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/colony/machineguns.dmi'
	icon_state = "m56f"
	item_state = "m56f"
	random_spawn_chance = 100
	random_cosmetic_chance = 100
	current_mag = /obj/item/ammo_magazine/smartgun/rusty
	var/jammed = FALSE
	random_spawn_cosmetic = list(
		/obj/item/attachable/cosmetic/clf_flag,
		/obj/item/attachable/cosmetic/clf_rags,
		/obj/item/attachable/cosmetic/clf_sling,
	)

/obj/item/weapon/gun/smartgun/clf/Initialize(mapload, ...)
	. = ..()
	MD.iff_signal = FACTION_CLF

/obj/item/weapon/gun/smartgun/clf/set_gun_config_values()
	..()
	damage_mult = BASE_BULLET_DAMAGE_MULT - BULLET_DAMAGE_MULT_TIER_1 //Rusty, salvaged and worn, what did you expect?

/obj/item/weapon/gun/smartgun/clf/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 16,"rail_x" = 17, "rail_y" = 18, "under_x" = 22, "under_y" = 14, "stock_x" = 22, "stock_y" = 14, "cosmetic_x" = 16, "cosmetic_y" = 16)

/obj/item/weapon/gun/smartgun/clf/update_icon()
	if(locate(/obj/item/attachable/cosmetic/clf_flag) in src)
		item_state = "m56f_flag"
		item_state_slots[WEAR_J_STORE] ="m56f_flag"
		item_state_slots[WEAR_BACK] ="m56f_flag"
	else if(locate(/obj/item/attachable/cosmetic/clf_rags) in src)
		item_state = "m56f_rags"
		item_state_slots[WEAR_J_STORE] ="m56f_rags"
		item_state_slots[WEAR_BACK] ="m56f_rags"
	else if(locate(/obj/item/attachable/cosmetic/clf_sling) in src)
		item_state = "m56f_sling"
		item_state_slots[WEAR_J_STORE] ="m56f_sling"
		item_state_slots[WEAR_BACK] ="m56f_sling"
	else
		item_state = "m56f"
		item_state_slots[WEAR_J_STORE] ="m56f"
		item_state_slots[WEAR_BACK] ="m56f"

/obj/item/weapon/gun/smartgun/clf/Fire(atom/target, mob/living/user, params, reflex = 0, dual_wield)
	if(jammed)
		if(world.time % 3)
			playsound(src, 'sound/weapons/handling/gun_jam_click.ogg', 35, TRUE)
			to_chat(user, SPAN_WARNING("Your gun is jammed! Mash Unique-Action to unjam it!"))
			balloon_alert(user, "*jammed*")
		return NONE
	else if(prob(0.6)) //0.6% chance to jam on fire
		jammed = TRUE
		playsound(src, 'sound/weapons/handling/gun_jam_initial_click.ogg', 50, FALSE)
		user.visible_message(SPAN_DANGER("[src] makes a noticeable clicking noise!"), SPAN_HIGHDANGER("\The [src] suddenly jams and refuses to fire! Mash Unique-Action to unjam it."))
		balloon_alert(user, "*jammed*")
		return NONE
	else if(prob(0.8)) //0.8% chance to malfunction on fire
		switch(rand(1, 8))
			if(1)
				toggle_accuracy_improvement(user)
			if(2)
				toggle_auto_aim(user)
			if(3)
				toggle_frontline_mode(user)
			if(4)
				toggle_motion_detector(user)
			if(5)
				toggle_recoil_compensation(user)
			if(6)
				toggle_ammo_type(user)
			if(7)
				toggle_lethal_mode(user)
			if(8)
				toggle_armbrace(user)
		to_chat(user, SPAN_HIGHDANGER("The [src] electronics malfunctions!"))
		var/datum/effect_system/spark_spread/sparks = new /datum/effect_system/spark_spread
		sparks.set_up(5, 3, src)
		sparks.start()
		playsound(src, pick('sound/machines/resource_node/node_marine_die_2.ogg', 'sound/machines/resource_node/node_marine_die.ogg'), 50, FALSE)
	else
		return ..()

/obj/item/weapon/gun/smartgun/clf/unique_action(mob/user)
	if(jammed)
		if(prob(CLF_SMARTGUN_UNJAM_CHANCE))
			to_chat(user, SPAN_GREEN("You successfully unjam \the [src]!"))
			playsound(src, 'sound/weapons/handling/gun_jam_rack_success.ogg', 50, FALSE)
			jammed = FALSE
			cock_cooldown += 1 SECONDS //so they dont accidentally cock a bullet away
			balloon_alert(user, "*unjammed!*")
		else
			to_chat(user, SPAN_NOTICE("You start wildly racking the bolt back and forth attempting to unjam \the [src]!"))
			playsound(src, "gun_jam_rack", 50, FALSE)
			balloon_alert(user, "*rack*")
		return
	. = ..()

/obj/item/weapon/gun/smartgun/clf/leader
	name = "\improper repaired M56 'Freedom' smartgun"
	random_spawn_cosmetic = list(
		/obj/item/attachable/cosmetic/clf_flag,
	)

/obj/item/weapon/gun/smartgun/clf/leader/update_icon()
	if(locate(/obj/item/attachable/cosmetic/clf_flag) in src)
		item_state = "m56f_flag"
		item_state_slots[WEAR_J_STORE] ="m56f_flag"
		item_state_slots[WEAR_BACK] ="m56f_flag"

#undef CLF_SMARTGUN_UNJAM_CHANCE

/obj/item/weapon/gun/smartgun/rmc
	name = "\improper L56A2 smartgun"
	desc = "The actual firearm in the 4-piece L56A2 Smartgun System. If you have this, you're about to bring some serious pain to anyone in your way."
	desc_lore = "Originally produced for the Three World Empires Royal Marines forces, it mostly ended up in hands of W-Y PMCs and other affiliated forces, with Three World Empire giving preference for other design, that is still produced by W-Y regardless. Compared to more commonly used M56A2, it has improved recoil control, better electronics and advanced tracking software."
	current_mag = /obj/item/ammo_magazine/smartgun/holo_targetting
	ammo = /obj/item/ammo_magazine/smartgun/holo_targetting
	ammo_primary_def = /datum/ammo/bullet/smartgun/holo_target
	ammo_secondary_def = /datum/ammo/bullet/smartgun/holo_target/ap
	ammo_primary_alt = /datum/ammo/bullet/smartgun/holo_target/alt
	ammo_secondary_alt = /datum/ammo/bullet/smartgun/holo_target/ap/alt
	flags_gun_features = GUN_SPECIALIST|GUN_WIELDED_FIRING_ONLY
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/TWE/machineguns.dmi'
	icon_state = "la56"
	item_state = "la56"
	starting_attachment_types = list(/obj/item/attachable/l56a2_smartgun)

/obj/item/weapon/gun/smartgun/rmc/Initialize(mapload, ...)
	. = ..()
	MD.iff_signal = FACTION_TWE


//  Solar devils SG, frontline mode only

/obj/item/weapon/gun/smartgun/pve
	desc = "The actual firearm in the 4-piece M56B Smartgun System. This is a variant used by the Solar Devils Batallion, utilizing a 'frontline only' IFF system that refuses to fire if a friendly would be hit.\nYou may toggle firing restrictions by using a special action.\nAlt-click it to open the feed cover and allow for reloading."
	actions_types = list(
		/datum/action/item_action/smartgun/toggle_accuracy_improvement,
		/datum/action/item_action/smartgun/toggle_ammo_type,
		/datum/action/item_action/smartgun/toggle_auto_aim,
		/datum/action/item_action/smartgun/toggle_lethal_mode,
		/datum/action/item_action/smartgun/toggle_motion_detector,
		/datum/action/item_action/smartgun/toggle_recoil_compensation,
		/datum/action/item_action/smartgun/toggle_armbrace,
	)

/obj/item/weapon/gun/smartgun/pve/Initialize(mapload, ...)
	. = ..()
	toggle_frontline_mode(null, TRUE)

/obj/item/weapon/gun/smartgun/pve/set_gun_config_values()
	..()
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_3

/obj/item/weapon/gun/smartgun/admin
	requires_power = FALSE
	requires_battery = FALSE
	requires_harness = FALSE

#undef LYING_DOWN_SG_ROF_DEBUFF
#undef KNOCKDOWN_SG_FAILSOUND_COOLDOWN


/obj/item/heavygun_battery
	name = "\improper DV9 heavy weapons battery"
	desc = "A standard-issue 9-volt lithium dry-cell battery, most commonly used within the USCMC to power smartguns, and other heavy weapons. Per the manual, one battery is good for up to 50000 rounds and plugs directly into the smartgun's power receptacle, which is only compatible with this type of battery. Various auxiliary modes usually bring the round count far lower. While this cell is incompatible with most standard electrical system, it can be charged by common rechargers in a pinch. USCMC gunners often guard them jealously."

	icon = 'icons/obj/structures/machinery/power.dmi'
	icon_state = "smartguncell"

	force = 5
	throwforce = 5
	throw_speed = SPEED_VERY_FAST
	throw_range = 5
	w_class = SIZE_SMALL

	var/obj/item/cell/high/power_cell

/obj/item/heavygun_battery/Initialize(mapload)
	. = ..()

	power_cell = new(src)

/obj/item/heavygun_battery/Destroy()
	QDEL_NULL(power_cell)
	return ..()
