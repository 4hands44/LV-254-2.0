GLOBAL_LIST_INIT(cm_vending_gear_clown, list(
		list("SPECIALIST KITS (CHOOSE 1)", 0, null, null, null),
		list("Mastermind", 0, /obj/item/storage/box/spec/clown/mastermind, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),
		list("Technician", 0, /obj/item/storage/box/spec/clown/technician, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),
		list("Enforcer", 0, /obj/item/storage/box/spec/clown/enforcer, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),
		list("Fugitive", 0, /obj/item/storage/box/spec/clown/fugitive, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),
		list("Ghost", 0, /obj/item/storage/box/spec/clown/ghost, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),

		list("PRIMARY AMMUNITION BOXES", 0, null, null, null),
		list("M16 Magazine Box", 40, /obj/item/ammo_box/magazine/M16, null, VENDOR_ITEM_REGULAR),
		list("MAR-40 Magazine Box", 40, /obj/item/ammo_box/magazine/MAR40, null, VENDOR_ITEM_REGULAR),
		list("M60 Magazine Box", 40, /obj/item/ammo_box/magazine/M60, null, VENDOR_ITEM_REGULAR),
		list("P90 Magazine Box", 40, /obj/item/ammo_box/magazine/p90, null, VENDOR_ITEM_REGULAR),
		list("Buckshot Shells Box", 40, /obj/item/ammo_box/magazine/shotgun/buckshot, null, VENDOR_ITEM_REGULAR),
		list("Shotgun Slugs Box", 40, /obj/item/ammo_box/magazine/shotgun, null, VENDOR_ITEM_REGULAR),
		list("Flechette Shells Box", 40, /obj/item/ammo_box/magazine/shotgun/flechette, null, VENDOR_ITEM_REGULAR),

		list("SIDEARM AMMUNITION BOXES", 0, null, null, null),
		list("M1911 Magazine Box (.45)", 20, /obj/item/ammo_box/magazine/m1911, null, VENDOR_ITEM_REGULAR),
		list("Desert Eagle Magazine Box (.50)", 20, /obj/item/ammo_box/magazine/heavy, null, VENDOR_ITEM_REGULAR),

		list("EXPLOSIVES", 0, null, null, null),
		list("40mm HE Grenade Packet", 30, /obj/item/storage/box/packet/impact_he, null, VENDOR_ITEM_REGULAR),
		list("40mm Incendiary Grenade Packet", 30, /obj/item/storage/box/packet/impact_incen, null, VENDOR_ITEM_REGULAR),
		list("40mm Buckshot Grenade Packet", 30, /obj/item/storage/box/packet/impact_frag, null, VENDOR_ITEM_REGULAR),
		list("Smoke Grenade Packet", 10, /obj/item/storage/box/packet/smoke, null, VENDOR_ITEM_REGULAR),
		list("M15 Frag Grenade Packet", 40, /obj/item/storage/box/packet/m15, null, VENDOR_ITEM_REGULAR),
		list("M20 Claymore Mine Box", 40, /obj/item/storage/box/explosive_mines, null, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Empty Loot Bag", 0, /obj/item/storage/backpack, null, VENDOR_ITEM_REGULAR),
		list("Trauma Plate", 10, /obj/item/clothing/accessory/health, null, VENDOR_ITEM_REGULAR),
		list("Metal Sheets (x50)", 20, /obj/item/stack/sheet/metal/large_stack, null, VENDOR_ITEM_REGULAR),
		list("Night Vision Goggles", 40, /obj/item/clothing/glasses/night, null, VENDOR_ITEM_REGULAR),
		list("Sentry Gun Ammo Drum", 20, /obj/item/ammo_magazine/sentry, null, VENDOR_ITEM_REGULAR),
		list("Surplus Welding Tank", 20, /obj/item/tool/weldpack/minitank, null, VENDOR_ITEM_REGULAR),
		list("Folding Barricades (x3)", 20, /obj/item/stack/folding_barricade/three, null, VENDOR_ITEM_REGULAR),
		list("First Aid Kit", 20, /obj/item/storage/firstaid/adv, null, VENDOR_ITEM_REGULAR),
		list("Mini-Sentry", 40, /obj/structure/machinery/defenses/sentry/mini/clown, null, VENDOR_ITEM_REGULAR),
		list("Spare Van Wheels", 0, /obj/item/hardpoint/support/locomotion, null, VENDOR_ITEM_REGULAR),
))

/obj/structure/machinery/cm_vending/gear/clown
	name = "\improper Gang Equipment Rack"
	desc = "An automated weapons rack for the Clown Gang. Features specialists kits and backup supplies."
	req_access = list(ACCESS_ILLEGAL_CLOWN)
	vendor_role = list(JOB_GANGSTER_CLOWN)
	icon_state = "gear"
	use_snowflake_points = TRUE

/obj/structure/machinery/cm_vending/gear/clown/get_listed_products(mob/user)
	return GLOB.cm_vending_gear_clown
