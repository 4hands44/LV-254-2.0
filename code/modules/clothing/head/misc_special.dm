/*
 * Contents:
 * Welding mask
 * Cakehat
 * Ushanka
 * Pumpkin head
 *
 */

/*
 * Welding mask
 */
/obj/item/clothing/head/welding
	name = "welding helmet"
	desc = "A head-mounted face cover designed to protect the wearer completely from space-arc eye."
	icon_state = "welding"
	item_state = "welding"
	matter = list("metal" = 3000, "glass" = 1000)
	var/up = 0
	armor_melee = CLOTHING_ARMOR_LOW
	armor_bullet = CLOTHING_ARMOR_NONE
	armor_laser = CLOTHING_ARMOR_NONE
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_NONE
	armor_bio = CLOTHING_ARMOR_LOW
	armor_rad = CLOTHING_ARMOR_NONE
	armor_internaldamage = CLOTHING_ARMOR_NONE
	flags_atom = FPRINT|CONDUCT
	flags_inventory = COVEREYES|COVERMOUTH|BLOCKSHARPOBJ
	flags_inv_hide = HIDEEARS|HIDEEYES|HIDEFACE
	flags_armor_protection = BODY_FLAG_HEAD|BODY_FLAG_FACE|BODY_FLAG_EYES
	actions_types = list(/datum/action/item_action/toggle)
	siemens_coefficient = 0.9
	w_class = SIZE_MEDIUM
	eye_protection = EYE_PROTECTION_WELDING
	vision_impair = VISION_IMPAIR_ULTRA

/obj/item/clothing/head/welding/attack_self(mob/user)
	..()

/obj/item/clothing/head/welding/verb/toggle()
	set category = "Object"
	set name = "Adjust welding mask"
	set src in usr

	if(usr.is_mob_incapacitated())
		return

	if(up)
		vision_impair = VISION_IMPAIR_ULTRA
		flags_inventory |= COVEREYES|COVERMOUTH|BLOCKSHARPOBJ
		flags_inv_hide |= HIDEEARS|HIDEEYES|HIDEFACE
		icon_state = initial(icon_state)
		eye_protection = initial(eye_protection)
		to_chat(usr, SPAN_NOTICE("You flip [src] down to protect your eyes."))
	else
		vision_impair = VISION_IMPAIR_NONE
		flags_inventory &= ~(COVEREYES|COVERMOUTH|BLOCKSHARPOBJ)
		flags_inv_hide &= ~(HIDEEARS|HIDEEYES|HIDEFACE)
		icon_state = "[initial(icon_state)]up"
		eye_protection = EYE_PROTECTION_NONE
		to_chat(usr, SPAN_NOTICE("You push [src] up out of your face."))
	up = !up

	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		if(H.head == src)
			H.update_tint()

	update_clothing_icon() //so our mob-overlays update

	for(var/X in actions)
		var/datum/action/A = X
		A.update_button_icon()

// Tagrilla

/obj/item/clothing/head/welding/tagrilla
	name = "\improper Reinforced Welding Mask"
	desc = "A heavy welding mask, reinforced to seemingly provide significant ballistic protection but loses the ability to be flipped up."
	icon_state = "tagrilla"
	item_state = "tagrilla"
	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_internaldamage = CLOTHING_ARMOR_ULTRAHIGH
	flags_inv_hide = HIDEEARS|HIDEALLHAIR|HIDEEYES
	actions_types = list()
	vision_impair = VISION_IMPAIR_MIN

/obj/item/clothing/head/welding/killer
	name = "\improper Maska-1SCh bulletproof helmet"
	desc = "A heavy combat helmet, it provides significant protection, but also heavily impairs vision and hearing. The hinge on this one's visor seems to have rusted stuck."
	icon_state = "killer"
	item_state = "killer"
	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_internaldamage = CLOTHING_ARMOR_ULTRAHIGH
	flags_inv_hide = HIDEEARS|HIDEALLHAIR|HIDEEYES
	actions_types = list()
	vision_impair = VISION_IMPAIR_MED

/*
 * Cakehat
 */
/obj/item/clothing/head/cakehat
	name = "cake-hat"
	desc = "It's tasty looking!"
	icon_state = "cake0"
	flags_inventory = COVEREYES
	var/onfire = 0
	var/status = 0
	var/fire_resist = T0C+1300 //this is the max temp it can stand before you start to cook. although it might not burn away, you take damage
	var/processing = 0 //I dont think this is used anywhere.
	flags_armor_protection = BODY_FLAG_EYES

/obj/item/clothing/head/cakehat/process()
	if(!onfire)
		STOP_PROCESSING(SSobj, src)
		return

/obj/item/clothing/head/cakehat/attack_self(mob/user)
	..()

	if(status > 1)
		return

	onfire = !onfire
	if (onfire)
		force = 3
		damtype = "fire"
		icon_state = "cake1"
		START_PROCESSING(SSobj, src)
	else
		force = null
		damtype = "brute"
		icon_state = "cake0"


/*
 * Pumpkin head
 */
/obj/item/clothing/head/pumpkinhead
	name = "carved pumpkin"
	desc = "A jack o' lantern! Believed to ward off evil spirits."
	icon_state = "hardhat0_pumpkin"//Could stand to be renamed
	item_state = "hardhat0_pumpkin"
	flags_inventory = COVEREYES|COVERMOUTH
	flags_inv_hide = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEALLHAIR
	flags_armor_protection = BODY_FLAG_HEAD|BODY_FLAG_EYES
	var/brightness_on = 2 //luminosity when on
	var/on = 0
	w_class = SIZE_MEDIUM
	anti_hug = 1

/obj/item/clothing/head/pumpkinhead/attack_self(mob/user)
	..()

	if(!isturf(user.loc))
		to_chat(user, SPAN_WARNING("You cannot turn the light [on ? "off" : "on" ] while in [user.loc].")) //To prevent some lighting anomalies.
		return

	on = !on
	icon_state = "hardhat[on]_pumpkin"

	if(on)
		set_light_range(brightness_on)
		set_light_on(TRUE)
	else
		set_light_on(FALSE)
