/obj/item/clothing/suit/storage/marine/smartgunner
	name = "\improper M56 combat harness"
	desc = "A heavy protective vest designed to be worn with the M56 Smartgun System. \nIt has specially designed straps and reinforcement to carry the Smartgun and accessories."
	icon_state = "8"
	item_state = "armor"
	armor_laser = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUM
	storage_slots = 2
	slowdown = SLOWDOWN_ARMOR_LIGHT
	flags_inventory = BLOCKSHARPOBJ|SMARTGUN_HARNESS
	unacidable = TRUE
	allowed = list(
		/obj/item/tank/emergency_oxygen,
		/obj/item/device/flashlight,
		/obj/item/ammo_magazine/pistol,
		/obj/item/ammo_magazine/revolver,
		/obj/item/ammo_magazine/handful,
		/obj/item/explosive/mine,
		/obj/item/explosive/atmine,
		/obj/item/explosive/grenade,
		/obj/item/attachable/bayonet,
		/obj/item/weapon/gun/smartgun,
		/obj/item/weapon/gun/plasma/xm99a,
		/obj/item/storage/backpack/general_belt,
		/obj/item/weapon/gun/rifle/lmg/braced,
		/obj/item/device/walkman,
	)

/obj/item/clothing/suit/storage/marine/smartgunner/Initialize()
	. = ..()
	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD] && name == "M56 combat harness")
		name = "M56 snow combat harness"
	else
		name = "M56 combat harness"
	//select_gamemode_skin(type)

/obj/item/clothing/suit/storage/marine/smartgunner/mob_can_equip(mob/equipping_mob, slot, disable_warning = FALSE)
	. = ..()

	if(equipping_mob.back && !(equipping_mob.back.flags_item & SMARTGUNNER_BACKPACK_OVERRIDE))
		if(!disable_warning)
			to_chat(equipping_mob, SPAN_WARNING("You can't equip [src] while wearing a backpack."))
		return FALSE

/obj/item/clothing/suit/storage/marine/smartgunner/equipped(mob/user, slot, silent)
	. = ..()

	if(slot == WEAR_JACKET)
		RegisterSignal(user, COMSIG_HUMAN_ATTEMPTING_EQUIP, PROC_REF(check_equipping))

/obj/item/clothing/suit/storage/marine/smartgunner/proc/check_equipping(mob/living/carbon/human/equipping_human, obj/item/equipping_item, slot)
	SIGNAL_HANDLER

	if(slot != WEAR_BACK)
		return

	if(equipping_item.flags_item & SMARTGUNNER_BACKPACK_OVERRIDE)
		return

	. = COMPONENT_HUMAN_CANCEL_ATTEMPT_EQUIP

	if(equipping_item.flags_equip_slot == SLOT_BACK)
		to_chat(equipping_human, SPAN_WARNING("You can't equip [equipping_item] on your back while wearing [src]."))
		return

/obj/item/clothing/suit/storage/marine/smartgunner/unequipped(mob/user, slot)
	. = ..()
	for(var/obj/item/weapon/gun/smartgun/smartgun_armbrace in user.contents)
		smartgun_armbrace.force_off_armbrace(user)
		user.drop_inv_item_on_ground(smartgun_armbrace)
	for(var/obj/item/weapon/gun/plasma/xm99a/xm99a_armbrace in user.contents)
		xm99a_armbrace.force_off_armbrace(user)
		user.drop_inv_item_on_ground(xm99a_armbrace)
	for(var/obj/item/weapon/gun/rifle/lmg/braced/hpr_armbrace in user.contents)
		hpr_armbrace.force_off_armbrace(user)
		user.drop_inv_item_on_ground(hpr_armbrace)


	UnregisterSignal(user, COMSIG_HUMAN_ATTEMPTING_EQUIP)

/obj/item/clothing/suit/storage/marine/smartgunner/mp
	name = "\improper M56 MP pattern combat harness"
	item_state = "8mp"
	icon_state = "8mp"
