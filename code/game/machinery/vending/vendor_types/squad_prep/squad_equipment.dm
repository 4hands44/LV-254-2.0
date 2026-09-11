/obj/structure/machinery/cm_vending/gear/squad_marines
	name = "\improper ColMarTech Enlisted Marine Equipment Rack"
	desc = "An automated equipment vendor for enlisted marines."
	req_access = list(ACCESS_MARINE_PREP)
	vendor_role = list(JOB_SQUAD_MARINE, JOB_SQUAD_LEADER, JOB_SQUAD_ENGI, JOB_SQUAD_MEDIC, JOB_SQUAD_SPECIALIST, JOB_SQUAD_SMARTGUN, JOB_SQUAD_TEAM_LEADER)
	show_points = TRUE
	use_snowflake_points = TRUE

/obj/structure/machinery/cm_vending/gear/squad_marines/get_listed_products(mob/user)
	if(!user)
		var/list/combined = list()
		combined += GLOB.cm_vending_gear_leader
		combined += GLOB.cm_vending_gear_marine
		combined += GLOB.cm_vending_gear_medic
		combined += GLOB.cm_vending_gear_engi
		combined += GLOB.cm_vending_gear_smartgun
		combined += GLOB.cm_vending_gear_spec
		combined += GLOB.cm_vending_gear_tl
		return combined
	if(user.job == JOB_SQUAD_LEADER)
		return GLOB.cm_vending_gear_leader
	else if(user.job == JOB_SQUAD_TEAM_LEADER)
		return GLOB.cm_vending_gear_tl
	else if(user.job == JOB_SQUAD_ENGI)
		return GLOB.cm_vending_gear_engi
	else if(user.job == JOB_SQUAD_MEDIC)
		return GLOB.cm_vending_gear_medic
	else if(user.job == JOB_SQUAD_SPECIALIST)
		return GLOB.cm_vending_gear_spec
	else if(user.job == JOB_SQUAD_SMARTGUN)
		return GLOB.cm_vending_gear_smartgun
	else if(user.job == JOB_SQUAD_MARINE)
		return GLOB.cm_vending_gear_marine
	return ..()

//------------Squad Leader---------------
GLOBAL_LIST_INIT(cm_vending_gear_leader, list(
		list("SQUAD LEADER KIT (CHOOSE 1)", 0, null, null, null),
		list("Essential SL Kit", 0, /obj/effect/essentials_set/leader, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_MANDATORY),

		list("SQUAD KIT (CHOOSE 1, for yourself or your squad)", 0, null, null, null),
		list("M4RA Sniper Kit", 0, /obj/item/storage/box/kit/mini_sniper, MARINE_CAN_BUY_KIT, VENDOR_ITEM_REGULAR),
		list("M41A Standard Kit", 0, /obj/item/storage/box/kit/m41a_kit	, MARINE_CAN_BUY_KIT, VENDOR_ITEM_REGULAR),
		list("M240 Pyrotechnician Support Kit", 0, /obj/item/storage/box/kit/mini_pyro, MARINE_CAN_BUY_KIT, VENDOR_ITEM_REGULAR),
		list("M2C Heavy Machine Gun", 0, /obj/item/storage/box/guncase/m2c, MARINE_CAN_BUY_KIT, VENDOR_ITEM_REGULAR),
		list("M56D Heavy Machine Gun", 0, /obj/item/storage/box/guncase/m56d, MARINE_CAN_BUY_KIT, VENDOR_ITEM_REGULAR),
		list("MOU-53 Shotgun", 0, /obj/item/storage/box/guncase/mou53, MARINE_CAN_BUY_KIT, VENDOR_ITEM_REGULAR),
		list("XM88 Heavy Rifle", 0, /obj/item/storage/box/guncase/xm88, MARINE_CAN_BUY_KIT, VENDOR_ITEM_REGULAR),

		list("CLOTHING ITEMS", 0, null, null, null),
		list("Machete Scabbard (Full)", 4, /obj/item/storage/large_holster/machete/full, null, VENDOR_ITEM_REGULAR),
		list("Machete Pouch (Full)", 4, /obj/item/storage/pouch/machete/full, null, VENDOR_ITEM_REGULAR),
		list("USCM Radio Telephone Pack", 5, /obj/item/storage/backpack/marine/satchel/rto, null, VENDOR_ITEM_REGULAR),
		list("M276 Pattern Combat Toolbelt Rig", 15, /obj/item/storage/belt/gun/utility, null, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Whistle", 3, /obj/item/device/whistle, null, VENDOR_ITEM_REGULAR),
		list("Supply Beacon", 15, /obj/item/device/whiskey_supply_beacon, null, VENDOR_ITEM_REGULAR),
		list("Officer Whistle", 3, /obj/item/device/trench_whistle, null, VENDOR_ITEM_REGULAR),
		list("Range Finder", 3, /obj/item/device/binoculars/range, null, VENDOR_ITEM_REGULAR),
		list("Laser Designator", 5, /obj/item/device/binoculars/range/designator, null, VENDOR_ITEM_REGULAR),
		list("Fire Extinguisher (Portable)", 3, /obj/item/tool/extinguisher/mini, null, VENDOR_ITEM_REGULAR),
		list("Motion Detector", 5, /obj/item/device/motiontracker/adv, null, VENDOR_ITEM_REGULAR),
		list("Fulton Device Stack", 5, /obj/item/stack/fulton, null, VENDOR_ITEM_REGULAR),

		list("BINOCULARS", 0, null, null, null),
		list("Range Finder", 3, /obj/item/device/binoculars/range, null, VENDOR_ITEM_REGULAR),
		list("Laser Designator", 5, /obj/item/device/binoculars/range/designator, null, VENDOR_ITEM_REGULAR),

		list("HELMET OPTICS", 0, null, null, null),
		list("Welding Visor", 5, /obj/item/device/helmet_visor/welding_visor, null, VENDOR_ITEM_REGULAR),
		list("Medical Helmet Optic", 4, /obj/item/device/helmet_visor/medical, null, VENDOR_ITEM_RECOMMENDED),
		list("Night Vision Optic", 25, /obj/item/device/helmet_visor/night_vision, null, VENDOR_ITEM_RECOMMENDED),

		list("ENGINEERING SUPPLIES", 0, null, null, null),
		list("Insulated Gloves", 3, /obj/item/clothing/gloves/yellow, null, VENDOR_ITEM_REGULAR),
		list("Plastic explosive", 5, /obj/item/explosive/plastic, null, VENDOR_ITEM_RECOMMENDED),
		list("Breaching Charge", 7, /obj/item/explosive/plastic/breaching_charge, null, VENDOR_ITEM_RECOMMENDED),
		list("Sandbags x25", 5, /obj/item/stack/sandbags_empty/half, null, VENDOR_ITEM_RECOMMENDED),
		list("Signal Flare Pack", 7, /obj/item/storage/box/m94/signal, null, VENDOR_ITEM_REGULAR),
		list("Tools Pouch (Full)", 5, /obj/item/storage/pouch/tools/full, null, VENDOR_ITEM_REGULAR),
		list("Welding Goggles", 5, /obj/item/clothing/glasses/welding, null, VENDOR_ITEM_REGULAR),

		list("EXPLOSIVES", 0, null, null, null),
		list("M40 HEDP High Explosive Packet (x3 grenades)", 18, /obj/item/storage/box/packet/high_explosive, null, VENDOR_ITEM_REGULAR),
		list("M40 HIDP Incendiary Packet (x3 grenades)", 18, /obj/item/storage/box/packet/incendiary, null, VENDOR_ITEM_REGULAR),
		list("M40 WPDP White Phosphorus Packet (x3 grenades)", 18, /obj/item/storage/box/packet/phosphorus, null, VENDOR_ITEM_REGULAR),
		list("M40 HSDP Smoke Packet (x3 grenades)", 9, /obj/item/storage/box/packet/smoke, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Frag Airburst Packet (x3 airburst grenades)", 20, /obj/item/storage/box/packet/airburst_he, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Incendiary Airburst Packet (x3 airburst grenades)", 20, /obj/item/storage/box/packet/airburst_incen, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Smoke Airburst Packet (x3 airburst grenades)", 10, /obj/item/storage/box/packet/airburst_smoke, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Hornet Airburst Packet (x3 airburst grenades", 20, /obj/item/storage/box/packet/hornet, null, VENDOR_ITEM_REGULAR),
		list("M20 Mine Box (x5 mines)", 20, /obj/item/storage/box/explosive_mines, null, VENDOR_ITEM_REGULAR),
		list("M40 MFHS Metal Foam Grenade", 5, /obj/item/explosive/grenade/metal_foam, null, VENDOR_ITEM_REGULAR),
		list("G2 Electroshock Grenade Packet (x3 grenades)",  16, /obj/item/storage/box/packet/sebb, null, VENDOR_ITEM_REGULAR),

		list("MEDICAL SUPPLIES", 0, null, null, null),
		list("Burn Kit", 2, /obj/item/stack/medical/advanced/ointment, null, VENDOR_ITEM_REGULAR),
		list("Trauma Kit", 2, /obj/item/stack/medical/advanced/bruise_pack, null, VENDOR_ITEM_REGULAR),
		list("Advanced Firstaid Kit", 12, /obj/item/storage/firstaid/adv, null, VENDOR_ITEM_REGULAR),
		list("Medical Splints", 1, /obj/item/stack/medical/splint, null, VENDOR_ITEM_REGULAR),

		list("Injector (Bicaridine)", 1, /obj/item/reagent_container/hypospray/autoinjector/bicaridine, null, VENDOR_ITEM_REGULAR),
		list("Injector (Dexalin+)", 1, /obj/item/reagent_container/hypospray/autoinjector/dexalinp, null, VENDOR_ITEM_REGULAR),
		list("Injector (Inaprovaline)", 1, /obj/item/reagent_container/hypospray/autoinjector/inaprovaline, null, VENDOR_ITEM_REGULAR),
		list("Injector (Kelotane)", 1, /obj/item/reagent_container/hypospray/autoinjector/kelotane, null, VENDOR_ITEM_REGULAR),
		list("Injector (Oxycodone)", 2, /obj/item/reagent_container/hypospray/autoinjector/oxycodone, null, VENDOR_ITEM_REGULAR),
		list("Injector (Tramadol)", 1, /obj/item/reagent_container/hypospray/autoinjector/tramadol, null, VENDOR_ITEM_REGULAR),
		list("Injector (Tricord)", 1, /obj/item/reagent_container/hypospray/autoinjector/tricord, null, VENDOR_ITEM_REGULAR),

		list("Health Analyzer", 4, /obj/item/device/healthanalyzer, null, VENDOR_ITEM_REGULAR),
		list("Roller Bed", 2, /obj/item/roller, null, VENDOR_ITEM_REGULAR),

		list("SPECIAL AMMUNITION", 0, null, null, null),
		list("M240 Incinerator Tank (Napthal)", 3, /obj/item/ammo_magazine/flamer_tank, null, VENDOR_ITEM_REGULAR),
		list("M240 Incinerator Tank (B-Gel)", 3, /obj/item/ammo_magazine/flamer_tank/gellied, null, VENDOR_ITEM_REGULAR),

		list("RESTRICTED FIREARMS", 0, null, null, null),
		list("M240 Incinerator Unit", 18, /obj/item/storage/box/guncase/flamer, null, VENDOR_ITEM_REGULAR),
		list("VP78 Pistol", 8, /obj/item/storage/box/guncase/vp78, null, VENDOR_ITEM_REGULAR),
		list("SU-6 Smart Pistol", 12, /obj/item/storage/box/guncase/smartpistol, null, VENDOR_ITEM_REGULAR),
		list("M79 Grenade Launcher", 18, /obj/item/storage/box/guncase/m79, null, VENDOR_ITEM_REGULAR),

		list("RADIO KEYS", 0, null, null, null),
		list("Engineering Radio Encryption Key", 3, /obj/item/device/encryptionkey/engi, null, VENDOR_ITEM_REGULAR),
		list("Intel Radio Encryption Key", 3, /obj/item/device/encryptionkey/intel, null, VENDOR_ITEM_REGULAR),
		list("JTAC Radio Encryption Key", 3, /obj/item/device/encryptionkey/jtac, null, VENDOR_ITEM_REGULAR),
		list("Supply Radio Encryption Key", 3, /obj/item/device/encryptionkey/req, null, VENDOR_ITEM_REGULAR),
	))

//------------Team lead---------------

GLOBAL_LIST_INIT(cm_vending_gear_tl, list(
		list("EXPLOSIVES", 0, null, null, null),
		list("M40 HEDP High Explosive Packet (x3 grenades)", 18, /obj/item/storage/box/packet/high_explosive, null, VENDOR_ITEM_REGULAR),
		list("M40 HIDP Incendiary Packet (x3 grenades)", 18, /obj/item/storage/box/packet/incendiary, null, VENDOR_ITEM_REGULAR),
		list("M40 WPDP White Phosphorus Packet (x3 grenades)", 18, /obj/item/storage/box/packet/phosphorus, null, VENDOR_ITEM_REGULAR),
		list("M40 HSDP Smoke Packet (x3 grenades)", 9, /obj/item/storage/box/packet/smoke, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Frag Airburst Packet (x3 airburst grenades)", 20, /obj/item/storage/box/packet/airburst_he, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Incendiary Airburst Packet (x3 airburst grenades)", 20, /obj/item/storage/box/packet/airburst_incen, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Smoke Airburst Packet (x3 airburst grenades)", 10, /obj/item/storage/box/packet/airburst_smoke, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Hornet Airburst Packet (x3 airburst grenades", 20, /obj/item/storage/box/packet/hornet, null, VENDOR_ITEM_REGULAR),
		list("M20 Mine Box (x5 mines)", 20, /obj/item/storage/box/explosive_mines, null, VENDOR_ITEM_REGULAR),
		list("M40 MFHS Metal Foam Grenade", 5, /obj/item/explosive/grenade/metal_foam, null, VENDOR_ITEM_REGULAR),
		list("G2 Electroshock Grenade Packet (x3 grenades)",  16, /obj/item/storage/box/packet/sebb, null, VENDOR_ITEM_REGULAR),

		list("PRIMARY AMMUNITION", 0, null, null, null),
		list("M4RA AP Magazine (10x24mm)", 10, /obj/item/ammo_magazine/rifle/m4ra/ap, null, VENDOR_ITEM_REGULAR),
		list("M4RA Extended Magazine (10x24mm)", 10, /obj/item/ammo_magazine/rifle/m4ra/extended, null, VENDOR_ITEM_REGULAR),
		list("M39 AP Magazine (10x20mm)", 10, /obj/item/ammo_magazine/smg/m39/ap , null, VENDOR_ITEM_REGULAR),
		list("M39 Extended Magazine (10x20mm)", 10, /obj/item/ammo_magazine/smg/m39/extended , null, VENDOR_ITEM_REGULAR),
		list("M41A AP Magazine (10x24mm)", 10, /obj/item/ammo_magazine/rifle/ap , null, VENDOR_ITEM_REGULAR),
		list("M41A Extended Magazine (10x24mm)", 10, /obj/item/ammo_magazine/rifle/extended , null, VENDOR_ITEM_REGULAR),

		list("SIDEARM AMMUNITION", 0, null, null, null),
		list("M10 HV extended magazine (10x20mm)", 10, /obj/item/ammo_magazine/pistol/m10/extended , null, VENDOR_ITEM_REGULAR),
		list("M10 HV drum magazine (10x20mm)", 15, /obj/item/ammo_magazine/pistol/m10/drum , null, VENDOR_ITEM_REGULAR),
		list("M44 Heavy Speed Loader (.44)", 10, /obj/item/ammo_magazine/revolver/heavy, null, VENDOR_ITEM_REGULAR),
		list("M44 Marksman Speed Loader (.44)", 10, /obj/item/ammo_magazine/revolver/marksman, null, VENDOR_ITEM_REGULAR),
		list("M4A3 HP Magazine", 5, /obj/item/ammo_magazine/pistol/hp, null, VENDOR_ITEM_REGULAR),
		list("M4A3 AP Magazine", 5, /obj/item/ammo_magazine/pistol/ap, null, VENDOR_ITEM_REGULAR),
		list("VP78 Magazine", 5, /obj/item/ammo_magazine/pistol/vp78, null, VENDOR_ITEM_REGULAR),
		list("SU-6 Smartpistol Magazine (.45)", 10, /obj/item/ammo_magazine/pistol/smart, null, VENDOR_ITEM_REGULAR),

		list("RESTRICTED FIREARMS", 0, null, null, null),
		list("VP78 Pistol", 10, /obj/item/storage/box/guncase/vp78, null, VENDOR_ITEM_REGULAR),
		list("SU-6 Smart Pistol", 15, /obj/item/storage/box/guncase/smartpistol, null, VENDOR_ITEM_REGULAR),
		list("M79 Grenade Launcher", 30, /obj/item/storage/box/guncase/m79, null, VENDOR_ITEM_REGULAR),

		list("ARMORS", 0, null, null, null),
		list("M3 B12 Pattern Marine Armor", 30, /obj/item/clothing/suit/storage/marine/medium/leader, null, VENDOR_ITEM_REGULAR),

		list("CLOTHING ITEMS", 0, null, null, null),
		list("Machete Scabbard (Full)", 5, /obj/item/storage/large_holster/machete/full, null, VENDOR_ITEM_REGULAR),
		list("Machete Pouch (Full)", 15, /obj/item/storage/pouch/machete/full, null, VENDOR_ITEM_REGULAR),
		list("USCM Radio Telephone Pack", 5, /obj/item/storage/backpack/marine/satchel/rto, null, VENDOR_ITEM_REGULAR),
		list("Welding Goggles", 3, /obj/item/clothing/glasses/welding, null, VENDOR_ITEM_REGULAR),
		list("M276 Pattern Combat Toolbelt Rig", 15, /obj/item/storage/belt/gun/utility, null, VENDOR_ITEM_REGULAR),
		list("Autoinjector Pouch (Full)", 15, /obj/item/storage/pouch/autoinjector/full, null, VENDOR_ITEM_REGULAR),
		list("Insulated Gloves", 3, /obj/item/clothing/gloves/yellow, null, VENDOR_ITEM_REGULAR),
		list("Night Vision Optic", 30, /obj/item/device/helmet_visor/night_vision, null, VENDOR_ITEM_RECOMMENDED),

		list("ENGINEERING SUPPLIES", 0, null, null, null),
		list("Plastic Explosive", 10, /obj/item/explosive/plastic, null, VENDOR_ITEM_REGULAR),
		list("Signal Flare Pack", 5, /obj/item/storage/box/m94/signal, null, VENDOR_ITEM_REGULAR),
		list("Breaching Charge", 10, /obj/item/explosive/plastic/breaching_charge, null, VENDOR_ITEM_REGULAR),
		list("ES-11 Mobile Fuel Canister", 5, /obj/item/tool/weldpack/minitank, null, VENDOR_ITEM_REGULAR),
		list("ME3 Hand Welder", 5, /obj/item/tool/weldingtool/simple, null, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Motion Detector", 15, /obj/item/device/motiondetector, null, VENDOR_ITEM_RECOMMENDED),
		list("Supply Beacon", 15, /obj/item/device/whiskey_supply_beacon, null, VENDOR_ITEM_REGULAR),
		list("Roller Bed", 5, /obj/item/roller, null, VENDOR_ITEM_REGULAR),
		list("Fulton Device Stack", 5, /obj/item/stack/fulton, null, VENDOR_ITEM_REGULAR),
		list("Fire Extinguisher (Portable)", 5, /obj/item/tool/extinguisher/mini, null, VENDOR_ITEM_REGULAR),
		list("Whistle", 5, /obj/item/device/whistle, null, VENDOR_ITEM_REGULAR),

		list("BINOCULARS", 0, null, null, null),
		list("Binoculars", 5, /obj/item/device/binoculars, null, VENDOR_ITEM_REGULAR),
		list("Range Finder", 10, /obj/item/device/binoculars/range, null, VENDOR_ITEM_REGULAR),
		list("Laser Designator", 15, /obj/item/device/binoculars/range/designator, null, VENDOR_ITEM_REGULAR),

		list("HELMET OPTICS", 0, null, null, null),
		list("Medical Helmet Optic", 15, /obj/item/device/helmet_visor/medical, null, VENDOR_ITEM_REGULAR),
		list("Welding Visor", 5, /obj/item/device/helmet_visor/welding_visor, null, VENDOR_ITEM_REGULAR),

		list("RADIO KEYS", 0, null, null, null),
		list("Engineering Radio Encryption Key", 5, /obj/item/device/encryptionkey/engi, null, VENDOR_ITEM_REGULAR),
		list("Intel Radio Encryption Key", 5, /obj/item/device/encryptionkey/intel, null, VENDOR_ITEM_REGULAR),
		list("JTAC Radio Encryption Key", 5, /obj/item/device/encryptionkey/jtac, null, VENDOR_ITEM_REGULAR),
		list("Supply Radio Encryption Key", 5, /obj/item/device/encryptionkey/req, null, VENDOR_ITEM_REGULAR),
	))

//------------Squad Engineer---------------
GLOBAL_LIST_INIT(cm_vending_gear_engi, list(
		list("ENGINEERING SPECIALIZATION KIT (CHOOSE 1)", 0, null, null, null),
		list("Sapper Fortification kit", 0, /obj/item/storage/box/kit/sapper, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_RECOMMENDED),
		list("Sentry Network kit", 0, /obj/item/storage/box/kit/sentry, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_RECOMMENDED),
		list("M240T Flamer Kit", 0, /obj/item/storage/box/spec/pyro, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),
		list("Anti-Tank kit", 0, /obj/item/storage/box/kit/at, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),
		list("Demolitionist kit", 0, /obj/item/storage/box/kit/breacher, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_RECOMMENDED),
		list("Electronic Warfare kit(WIP)", 0, /obj/item/storage/box/kit/ewar, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),
		list("Pointman Breacher kit", 0, /obj/item/storage/box/kit/pursuit, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),

		list("ENGINEERING CREW SERVED WEAPON KIT (OPTIONAL)", 0, null, null, null),
		list("M402 Mortar Crew kit", 0, /obj/item/storage/box/spec/mortar, MARINE_CAN_BUY_KIT, VENDOR_ITEM_REGULAR),
		list("M56D HMG Crew kit", 0, /obj/item/storage/box/guncase/m56d, MARINE_CAN_BUY_KIT, VENDOR_ITEM_REGULAR),
		list("M2C HMG Crew kit", 0, /obj/item/storage/box/guncase/m2c, MARINE_CAN_BUY_KIT, VENDOR_ITEM_REGULAR),

		list("HANDHELD DEFENSE (CHOOSE 1)", 0, null, null, null),
		list("21S Tesla Coil", 0, /obj/item/defenses/handheld/tesla_coil, MARINE_CAN_BUY_ATTACHMENT, VENDOR_ITEM_MANDATORY),
		list("JIMA Planted Flag", 0, /obj/item/defenses/handheld/planted_flag, MARINE_CAN_BUY_ATTACHMENT, VENDOR_ITEM_MANDATORY),
		list("UA 42-F Sentry Flamer", 0, /obj/item/defenses/handheld/sentry/flamer, MARINE_CAN_BUY_ATTACHMENT, VENDOR_ITEM_MANDATORY),
		list("UA 571-C Sentry Gun", 0, /obj/item/defenses/handheld/sentry, MARINE_CAN_BUY_ATTACHMENT, VENDOR_ITEM_MANDATORY),
		list("Sentry Upgrade kit", 15, /obj/item/engi_upgrade_kit, null, VENDOR_ITEM_REGULAR),

		list("ENGINEERING SUPPLIES", 0, null, null, null),
		list("Airlock Circuit Board", 2, /obj/item/circuitboard/airlock, null, VENDOR_ITEM_REGULAR),
		list("APC Circuit Board", 2, /obj/item/circuitboard/apc, null, VENDOR_ITEM_REGULAR),
		list("Entrenching Tool (ET)", 2, /obj/item/tool/shovel/etool, null, VENDOR_ITEM_REGULAR),
		list("High-Capacity Power Cell", 3, /obj/item/cell/high, null, VENDOR_ITEM_REGULAR),
		list("Wood x50", 15, /obj/item/stack/sheet/wood/large_stack, null, VENDOR_ITEM_RECOMMENDED),
		list("Metal x10", 5, /obj/item/stack/sheet/metal/small_stack, null, VENDOR_ITEM_RECOMMENDED),
		list("Plasteel x10", 7, /obj/item/stack/sheet/plasteel/small_stack, null, VENDOR_ITEM_RECOMMENDED),
		list("Concertina Wire x50", 10, /obj/item/stack/concertina_wire/full_stack, null, VENDOR_ITEM_RECOMMENDED),
		list("Fragwire x25", 25, /obj/item/stack/fragwire/full_stack, null, VENDOR_ITEM_REGULAR),
		list("Vehicle Spikes x25", 25, /obj/item/stack/spikestrip/full_stack, null, VENDOR_ITEM_REGULAR),
		list("Plastic Explosive", 3, /obj/item/explosive/plastic, null, VENDOR_ITEM_REGULAR),
		list("Breaching Charge", 5, /obj/item/explosive/plastic/breaching_charge, null, VENDOR_ITEM_RECOMMENDED),
		list("Sandbags x25", 10, /obj/item/stack/sandbags_empty/half, null, VENDOR_ITEM_RECOMMENDED),
		list("Super-Capacity Power Cell", 10, /obj/item/cell/super, null, VENDOR_ITEM_REGULAR),
		list("ES-11 Mobile Fuel Canister", 4, /obj/item/tool/weldpack/minitank, null, VENDOR_ITEM_REGULAR),

		list("EXPLOSIVES", 0, null, null, null),
		list("M40 HEDP High Explosive Packet (x3 grenades)", 18, /obj/item/storage/box/packet/high_explosive, null, VENDOR_ITEM_REGULAR),
		list("M40 HIDP Incendiary Packet (x3 grenades)", 18, /obj/item/storage/box/packet/incendiary, null, VENDOR_ITEM_REGULAR),
		list("M40 WPDP White Phosphorus Packet (x3 grenades)", 18, /obj/item/storage/box/packet/phosphorus, null, VENDOR_ITEM_REGULAR),
		list("M40 HSDP Smoke Packet (x3 grenades)", 9, /obj/item/storage/box/packet/smoke, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Frag Airburst Packet (x3 airburst grenades)", 18, /obj/item/storage/box/packet/airburst_he, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Incendiary Airburst Packet (x3 airburst grenades)", 18, /obj/item/storage/box/packet/airburst_incen, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Smoke Airburst Packet (x3 airburst grenades)", 10, /obj/item/storage/box/packet/airburst_smoke, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Hornet Airburst Packet (x3 airburst grenades", 20, /obj/item/storage/box/packet/hornet, null, VENDOR_ITEM_REGULAR),
		list("M20 Mine Box (x5 mines)", 18, /obj/item/storage/box/explosive_mines, null, VENDOR_ITEM_REGULAR),
		list("M40 MFHS Metal Foam Grenade", 5, /obj/item/explosive/grenade/metal_foam, null, VENDOR_ITEM_REGULAR),
		list("G2 Electroshock Grenade Packet (x3 grenades)",  16, /obj/item/storage/box/packet/sebb, null, VENDOR_ITEM_REGULAR),

		list("SIDEARM AMMUNITION", 0, null, null, null),
		list("M10 HV extended magazine (10x20mm)", 10, /obj/item/ammo_magazine/pistol/m10/extended , null, VENDOR_ITEM_REGULAR),
		list("M10 HV drum magazine (10x20mm)", 15, /obj/item/ammo_magazine/pistol/m10/drum , null, VENDOR_ITEM_REGULAR),
		list("M44 Heavy Speed Loader (.44)", 6, /obj/item/ammo_magazine/revolver/heavy, null, VENDOR_ITEM_REGULAR),
		list("M44 Marksman Speed Loader (.44)", 6, /obj/item/ammo_magazine/revolver/marksman, null, VENDOR_ITEM_REGULAR),
		list("M4A3 HP Magazine", 3, /obj/item/ammo_magazine/pistol/hp, null, VENDOR_ITEM_REGULAR),
		list("M4A3 AP Magazine", 3, /obj/item/ammo_magazine/pistol/ap, null, VENDOR_ITEM_REGULAR),
		list("VP78 Magazine", 3, /obj/item/ammo_magazine/pistol/vp78, null, VENDOR_ITEM_REGULAR),
		list("SU-6 Smartpistol Magazine (.45)", 6, /obj/item/ammo_magazine/pistol/smart, null, VENDOR_ITEM_REGULAR),

		list("ARMORS", 0, null, null, null),
		list("M3 B12 Pattern Marine Armor", 24, /obj/item/clothing/suit/storage/marine/medium/leader, null, VENDOR_ITEM_REGULAR),
		list("M4 Pattern Armor", 16, /obj/item/clothing/suit/storage/marine/medium/rto, null, VENDOR_ITEM_REGULAR),

		list("RESTRICTED FIREARMS", 0, null, null, null),
		list("VP78 Pistol", 8, /obj/item/storage/box/guncase/vp78, null, VENDOR_ITEM_REGULAR),
		list("SU-6 Smart Pistol", 12, /obj/item/storage/box/guncase/smartpistol, null, VENDOR_ITEM_REGULAR),
		list("M240 Incinerator Unit", 12, /obj/item/storage/box/guncase/flamer, null, VENDOR_ITEM_REGULAR),
		list("M79 Grenade Launcher", 24, /obj/item/storage/box/guncase/m79, null, VENDOR_ITEM_REGULAR),
		list("XM51 breaching scattergun", 30, /obj/item/storage/box/guncase/xm51, null, VENDOR_ITEM_RECOMMENDED),

		list("UTILITIES", 0, null, null, null),
		list("Fulton Device Stack", 5, /obj/item/stack/fulton, null, VENDOR_ITEM_REGULAR),
		list("Supply Beacon", 15, /obj/item/device/whiskey_supply_beacon, null, VENDOR_ITEM_REGULAR),
		list("Fire Extinguisher (Portable)", 3, /obj/item/tool/extinguisher/mini, null, VENDOR_ITEM_REGULAR),
		list("Motion Detector", 8, /obj/item/device/motiontracker/adv, null, VENDOR_ITEM_REGULAR),
		list("Whistle", 3, /obj/item/device/whistle, null, VENDOR_ITEM_REGULAR),
		list("Synthetic Reset Key", 10, /obj/item/device/defibrillator/synthetic, null, VENDOR_ITEM_REGULAR),

		list("HELMET OPTICS", 0, null, null, null),
		list("Medical Helmet Optic", 12, /obj/item/device/helmet_visor/medical, null, VENDOR_ITEM_REGULAR),

		list("PAMPHLETS", 0, null, null, null),
		list("JTAC Pamphlet", 15, /obj/item/pamphlet/skill/jtac, null, VENDOR_ITEM_REGULAR),

		list("RADIO KEYS", 0, null, null, null),
		list("Intel Radio Encryption Key", 3, /obj/item/device/encryptionkey/intel, null, VENDOR_ITEM_REGULAR),
		list("JTAC Radio Encryption Key", 3, /obj/item/device/encryptionkey/jtac, null, VENDOR_ITEM_REGULAR),
		list("Supply Radio Encryption Key", 3, /obj/item/device/encryptionkey/req, null, VENDOR_ITEM_REGULAR),
	))

//------------Squad medic---------------
GLOBAL_LIST_INIT(cm_vending_gear_medic, list(
		list("MEDICAL SET (MANDATORY)", 0, null, null, null),
		list("Essential Medical Set", 0, /obj/effect/essentials_set/medic, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_MANDATORY),

		list("FIELD SUPPLIES", 0, null, null, null),
		list("Burn Kit", 2, /obj/item/stack/medical/advanced/ointment, null, VENDOR_ITEM_RECOMMENDED),
		list("Trauma Kit", 2, /obj/item/stack/medical/advanced/bruise_pack, null, VENDOR_ITEM_RECOMMENDED),
		list("Medical Splints", 1, /obj/item/stack/medical/splint, null, VENDOR_ITEM_RECOMMENDED),
		list("Blood Bag (O-)", 4, /obj/item/reagent_container/blood/OMinus, null, VENDOR_ITEM_REGULAR),

		list("FIRSTAID KITS", 0, null, null, null),
		list("Advanced Firstaid Kit", 20, /obj/item/storage/firstaid/adv, null, VENDOR_ITEM_RECOMMENDED),
		list("Firstaid Kit", 5, /obj/item/storage/firstaid/regular, null, VENDOR_ITEM_REGULAR),
		list("Fire Firstaid Kit", 6, /obj/item/storage/firstaid/fire, null, VENDOR_ITEM_REGULAR),
		list("Toxin Firstaid Kit", 6, /obj/item/storage/firstaid/toxin, null, VENDOR_ITEM_REGULAR),
		list("Oxygen Firstaid Kit", 6, /obj/item/storage/firstaid/o2, null, VENDOR_ITEM_REGULAR),
		list("Radiation Firstaid Kit", 6, /obj/item/storage/firstaid/rad, null, VENDOR_ITEM_REGULAR),

		list("PILL BOTTLES", 0, null, null, null),
		list("Pill Bottle (Bicaridine)", 5, /obj/item/storage/pill_bottle/bicaridine, null, VENDOR_ITEM_RECOMMENDED),
		list("Pill Bottle (Dexalin)", 5, /obj/item/storage/pill_bottle/dexalin, null, VENDOR_ITEM_REGULAR),
		list("Pill Bottle (Dylovene)", 5, /obj/item/storage/pill_bottle/antitox, null, VENDOR_ITEM_REGULAR),
		list("Pill Bottle (Inaprovaline)", 5, /obj/item/storage/pill_bottle/inaprovaline, null, VENDOR_ITEM_REGULAR),
		list("Pill Bottle (Kelotane)", 5, /obj/item/storage/pill_bottle/kelotane, null, VENDOR_ITEM_RECOMMENDED),
		list("Pill Bottle (Peridaxon)", 5, /obj/item/storage/pill_bottle/peridaxon, null, VENDOR_ITEM_REGULAR),
		list("Pill Bottle (Tramadol)", 5, /obj/item/storage/pill_bottle/tramadol, null, VENDOR_ITEM_RECOMMENDED),

		list("AUTOINJECTORS", 0, null, null, null),
		list("Autoinjector (Bicaridine)", 1, /obj/item/reagent_container/hypospray/autoinjector/bicaridine, null, VENDOR_ITEM_REGULAR),
		list("Autoinjector (Dexalin+)", 1, /obj/item/reagent_container/hypospray/autoinjector/dexalinp, null, VENDOR_ITEM_REGULAR),
		list("Autoinjector (Epinephrine)", 2, /obj/item/reagent_container/hypospray/autoinjector/adrenaline, null, VENDOR_ITEM_REGULAR),
		list("Autoinjector (Inaprovaline)", 1, /obj/item/reagent_container/hypospray/autoinjector/inaprovaline, null, VENDOR_ITEM_REGULAR),
		list("Autoinjector (Kelotane)", 1, /obj/item/reagent_container/hypospray/autoinjector/kelotane, null, VENDOR_ITEM_REGULAR),
		list("Autoinjector (Oxycodone)", 2, /obj/item/reagent_container/hypospray/autoinjector/oxycodone, null, VENDOR_ITEM_REGULAR),
		list("Autoinjector (Tramadol)", 1, /obj/item/reagent_container/hypospray/autoinjector/tramadol, null, VENDOR_ITEM_REGULAR),
		list("Autoinjector (Tricord)", 1, /obj/item/reagent_container/hypospray/autoinjector/tricord, null, VENDOR_ITEM_REGULAR),

		list("MEDICAL UTILITIES", 0, null, null, null),
		list("MS-11 Smart Refill Tank", 6, /obj/item/reagent_container/glass/minitank, null, VENDOR_ITEM_REGULAR),
		list("FixOVein", 7, /obj/item/tool/surgery/FixOVein, null, VENDOR_ITEM_REGULAR),
		list("Crutches", 4, /obj/item/crutches, null, VENDOR_ITEM_REGULAR),
		list("Roller Bed", 4, /obj/item/roller, null, VENDOR_ITEM_REGULAR),
		list("Health Analyzer", 4, /obj/item/device/healthanalyzer, null, VENDOR_ITEM_REGULAR),
		list("Stasis Bag", 6, /obj/item/bodybag/cryobag, null, VENDOR_ITEM_REGULAR),
		list("Pressurized Reagent Canister Pouch (EMPTY)", 3, /obj/item/storage/pouch/pressurized_reagent_canister, null, VENDOR_ITEM_REGULAR),
		list("MS-11 Smart Refill Tank", 6, /obj/item/reagent_container/glass/minitank, null, VENDOR_ITEM_REGULAR),

		list("EXPLOSIVES", 0, null, null, null),
		list("M40 HEDP High Explosive Packet (x3 grenades)", 18, /obj/item/storage/box/packet/high_explosive, null, VENDOR_ITEM_REGULAR),
		list("M40 HIDP Incendiary Packet (x3 grenades)", 18, /obj/item/storage/box/packet/incendiary, null, VENDOR_ITEM_REGULAR),
		list("M40 WPDP White Phosphorus Packet (x3 grenades)", 18, /obj/item/storage/box/packet/phosphorus, null, VENDOR_ITEM_REGULAR),
		list("M40 HSDP Smoke Packet (x3 grenades)", 9, /obj/item/storage/box/packet/smoke, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Frag Airburst Packet (x3 airburst grenades)", 20, /obj/item/storage/box/packet/airburst_he, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Incendiary Airburst Packet (x3 airburst grenades)", 20, /obj/item/storage/box/packet/airburst_incen, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Smoke Airburst Packet (x3 airburst grenades)", 10, /obj/item/storage/box/packet/airburst_smoke, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Hornet Airburst Packet (x3 airburst grenades", 20, /obj/item/storage/box/packet/hornet, null, VENDOR_ITEM_REGULAR),
		list("G2 Electroshock Grenade Packet (x3 grenades)",  16, /obj/item/storage/box/packet/sebb, null, VENDOR_ITEM_REGULAR),

		list("RESTRICTED FIREARMS", 0, null, null, null),
		list("VP78 Pistol", 8, /obj/item/storage/box/guncase/vp78, null, VENDOR_ITEM_REGULAR),
		list("SU-6 Smart Pistol", 12, /obj/item/storage/box/guncase/smartpistol, null, VENDOR_ITEM_REGULAR),
		list("XM88 Heavy Rifle", 20, /obj/item/storage/box/guncase/xm88, null, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Fire Extinguisher (Portable)", 3, /obj/item/tool/extinguisher/mini, null, VENDOR_ITEM_REGULAR),
		list("Supply Beacon", 15, /obj/item/device/whiskey_supply_beacon, null, VENDOR_ITEM_REGULAR),
		list("Motion Detector", 8, /obj/item/device/motiontracker/adv, null, VENDOR_ITEM_REGULAR),
		list("Whistle", 3, /obj/item/device/whistle, null, VENDOR_ITEM_REGULAR),

		list("BINOCULARS", 0, null, null, null),
		list("Binoculars", 5, /obj/item/device/binoculars, null, VENDOR_ITEM_REGULAR),
		list("Range Finder", 10, /obj/item/device/binoculars/range, null, VENDOR_ITEM_REGULAR),
		list("Laser Designator", 15, /obj/item/device/binoculars/range/designator, null, VENDOR_ITEM_REGULAR),

		list("HELMET OPTICS", 0, null, null, null),
		list("Welding Visor", 5, /obj/item/device/helmet_visor/welding_visor, null, VENDOR_ITEM_REGULAR),

		list("RADIO KEYS", 0, null, null, null),
		list("Engineering Radio Encryption Key", 3, /obj/item/device/encryptionkey/engi, null, VENDOR_ITEM_REGULAR),
		list("Intel Radio Encryption Key", 3, /obj/item/device/encryptionkey/intel, null, VENDOR_ITEM_REGULAR),
		list("JTAC Radio Encryption Key", 3, /obj/item/device/encryptionkey/jtac, null, VENDOR_ITEM_REGULAR),
		list("Supply Radio Encryption Key", 3, /obj/item/device/encryptionkey/req, null, VENDOR_ITEM_REGULAR),
	))

//------------Squad Specialist---------------
GLOBAL_LIST_INIT(cm_vending_gear_spec, list(
		list("WEAPONS SPECIALIST SETS (CHOOSE 1)", 0, null, null, null),
		list("Demolitionist Set", 0, /obj/item/storage/box/spec/demolitionist, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),
		list("Heavy Grenadier Set", 0, /obj/item/storage/box/spec/heavy_grenadier, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),
		list("Pyro Set", 0, /obj/item/storage/box/spec/pyro, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),
		list("Scout Set", 0, /obj/item/storage/box/spec/scout, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),
		list("Sniper Set", 0, /obj/item/storage/box/spec/sniper, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_RECOMMENDED),
		list("Heavy Armor Set", 0, /obj/item/storage/box/spec/B18, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_RECOMMENDED),
		list("P9 SHARP Rifle Kit", 0, /obj/item/storage/box/spec/sharp_operator, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),
		list("Anti-Materiel Sniper Set", 0, /obj/item/storage/box/spec/sniper/anti_materiel, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_RECOMMENDED),

		list("EXTRA SCOUT AMMUNITION", 0, null, null, null),
		list("A19 High Velocity Impact Magazine (10x24mm)", 40, /obj/item/ammo_magazine/rifle/m4ra/custom/impact, null, VENDOR_ITEM_REGULAR),
		list("A19 High Velocity Incendiary Magazine (10x24mm)", 40, /obj/item/ammo_magazine/rifle/m4ra/custom/incendiary, null, VENDOR_ITEM_REGULAR),
		list("A19 High Velocity Magazine (10x24mm)", 40, /obj/item/ammo_magazine/rifle/m4ra/custom, null, VENDOR_ITEM_REGULAR),

		list("EXTRA SNIPER AMMUNITION", 0, null, null, null),
		list("M42A Flak Magazine (10x28mm)", 40, /obj/item/ammo_magazine/sniper/flak, null, VENDOR_ITEM_REGULAR),
		list("M42A Incendiary Magazine (10x28mm)", 40, /obj/item/ammo_magazine/sniper/incendiary, null, VENDOR_ITEM_REGULAR),
		list("M42A Marksman Magazine (10x28mm Caseless)", 40, /obj/item/ammo_magazine/sniper, null, VENDOR_ITEM_REGULAR),
		list("XM43E1 Marksman Magazine (10x99mm Caseless)", 40, /obj/item/ammo_magazine/sniper/anti_materiel, null, VENDOR_ITEM_REGULAR),

		list("EXTRA DEMOLITIONIST AMMUNITION", 0, null, null, null),
		list("84mm Anti-Armor Rocket", 40, /obj/item/ammo_magazine/rocket/ap, null, VENDOR_ITEM_REGULAR),
		list("84mm High-Explosive Rocket", 40, /obj/item/ammo_magazine/rocket, null, VENDOR_ITEM_REGULAR),
		list("84mm White-Phosphorus Rocket", 40, /obj/item/ammo_magazine/rocket/wp, null, VENDOR_ITEM_REGULAR),

		list("EXTRA SHARP AMMUNITION", 0, null, null, null),
		list("SHARP 9X-E Sticky Explosive Dart magazine (darts)", 40, /obj/item/ammo_magazine/rifle/sharp/explosive, null, VENDOR_ITEM_REGULAR),
		list("SHARP 9X-T Sticky incendiary Dart magazine (darts)", 40, /obj/item/ammo_magazine/rifle/sharp/incendiary, null, VENDOR_ITEM_REGULAR),
		list("SHARP 9X-F Flechette Dart Magazine (darts)", 40, /obj/item/ammo_magazine/rifle/sharp/flechette, null, VENDOR_ITEM_REGULAR),

		list("EXTRA GRENADES", 0, null, null, null),
		list("M40 HEDP Grenades x6", 40, /obj/effect/essentials_set/hedp_6_pack, null, VENDOR_ITEM_REGULAR),
		list("M40 HIDP Incendiary Grenades x6", 40, /obj/effect/essentials_set/hidp_6_pack, null, VENDOR_ITEM_REGULAR),
		list("M40 CCDP Chemical Compound Grenades x6", 40, /obj/effect/essentials_set/ccdp_6_pack, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-F Fragmentation Grenades x6", 40, /obj/effect/essentials_set/agmf_6_pack, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-I Incendiary Grenades x6", 40, /obj/effect/essentials_set/agmi_6_pack, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-S Smoke Grenades x6", 20, /obj/effect/essentials_set/agms_6_pack, null, VENDOR_ITEM_REGULAR),
		list("G2 Electroshock Grenade Pack x6", 40, /obj/effect/essentials_set/sebb_6_pack, null, VENDOR_ITEM_REGULAR),

		list("EXTRA FLAMETHROWER TANKS", 0, null, null, null),
		list("Large Incinerator Tank", 40, /obj/item/ammo_magazine/flamer_tank/large, null, VENDOR_ITEM_REGULAR),
		list("Large Incinerator Tank (B) (Green Flame)", 40, /obj/item/ammo_magazine/flamer_tank/large/B, null, VENDOR_ITEM_REGULAR),
		list("Large Incinerator Tank (X) (Blue Flame)", 40, /obj/item/ammo_magazine/flamer_tank/large/X, null, VENDOR_ITEM_REGULAR),

	))

//------------Squad Smartgunner---------------
GLOBAL_LIST_INIT(cm_vending_gear_smartgun, list(
		list("SUPPORT RIFLEMAN SET (MANDATORY)", 0, null, null, null),
		list("Essential Smartgunner Set", 0, /obj/effect/essentials_set/smartgunner/m56, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_MANDATORY),
		list("Essential xm99a gunner Set", 0, /obj/effect/essentials_set/smartgunner/xm99a, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_MANDATORY),
		list("Essential HPR gunner Set", 0, /obj/effect/essentials_set/smartgunner/hpr, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_MANDATORY),
		list("M78 PIG kit", 0, /obj/item/storage/box/spec/pig_operator, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),

		list("SUPPORT WEAPON AMMUNITION", 0, null, null, null),
		list("M56 Smartgun Drum", 15, /obj/item/ammo_magazine/smartgun, null, VENDOR_ITEM_RECOMMENDED),
		list("XM99A1 Plasmagun Canister", 25, /obj/item/ammo_magazine/rifle/xm99a, null, VENDOR_ITEM_RECOMMENDED),
		list("HPR Box AP Magazine", 15, /obj/item/ammo_magazine/rifle/lmg/ap, null, VENDOR_ITEM_RECOMMENDED),
		list("HPR Box HOLO Targeting Magazine", 15, /obj/item/ammo_magazine/rifle/lmg/holo_target, null, VENDOR_ITEM_RECOMMENDED),
		list("HPR Box HEAP Magazine", 20, /obj/item/ammo_magazine/rifle/lmg/heap, null, VENDOR_ITEM_RECOMMENDED),

		list("GUN ATTACHMENTS (CHOOSE 1)", 0, null, null, null),
		list("Laser Sight", 0, /obj/item/attachable/lasersight, MARINE_CAN_BUY_ATTACHMENT, VENDOR_ITEM_REGULAR),
		list("Red-Dot Sight", 0, /obj/item/attachable/reddot, MARINE_CAN_BUY_ATTACHMENT, VENDOR_ITEM_REGULAR),
		list("Reflex Sight", 0, /obj/item/attachable/reflex, MARINE_CAN_BUY_ATTACHMENT, VENDOR_ITEM_REGULAR),

		list("EXPLOSIVES", 0, null, null, null),
		list("M40 HEDP High Explosive Packet (x3 grenades)", 30, /obj/item/storage/box/packet/high_explosive, null, VENDOR_ITEM_REGULAR),
		list("M40 HIDP Incendiary Packet (x3 grenades)", 30, /obj/item/storage/box/packet/incendiary, null, VENDOR_ITEM_REGULAR),
		list("M40 HPDP White Phosphorus Packet (x3 grenades)", 30, /obj/item/storage/box/packet/phosphorus, null, VENDOR_ITEM_REGULAR),
		list("M40 HSDP Smoke Packet (x3 grenades)", 15, /obj/item/storage/box/packet/smoke, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Frag Airburst Packet (x3 airburst grenades)", 20, /obj/item/storage/box/packet/airburst_he, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Incendiary Airburst Packet (x3 airburst grenades)", 20, /obj/item/storage/box/packet/airburst_incen, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Smoke Airburst Packet (x3 airburst grenades)", 10, /obj/item/storage/box/packet/airburst_smoke, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Hornet Airburst Packet (x3 airburst grenades", 20, /obj/item/storage/box/packet/hornet, null, VENDOR_ITEM_REGULAR),
		list("G2 Electroshock Grenade Packet (x3 grenades)",  16, /obj/item/storage/box/packet/sebb, null, VENDOR_ITEM_REGULAR),

		list("RESTRICTED FIREARMS", 0, null, null, null),
		list("VP78 Pistol", 15, /obj/item/storage/box/guncase/vp78, null, VENDOR_ITEM_REGULAR),
		list("SU-6 Smart Pistol", 15, /obj/item/storage/box/guncase/smartpistol, null, VENDOR_ITEM_REGULAR),
		list("XM51 breaching scattergun", 30, /obj/item/storage/box/guncase/xm51, null, VENDOR_ITEM_RECOMMENDED),
		list("M240 Pyrotechnician Support Kit", 30, /obj/item/storage/box/kit/mini_pyro, null, VENDOR_ITEM_RECOMMENDED),
		list("M5 RPG Kit", 60, /obj/item/storage/box/kit/m5, null, VENDOR_ITEM_REGULAR),

		list("CLOTHING ITEMS", 0, null, null, null),
		list("Smartgunner Machete Scabbard (Full)", 6, /obj/item/storage/large_holster/machete/smartgunner/full, null, VENDOR_ITEM_REGULAR),
		list("Shotgun Scabbard", 6, /obj/item/storage/large_holster/m37, null, VENDOR_ITEM_REGULAR),
		list("Fuel Tank Strap Pouch", 5, /obj/item/storage/pouch/flamertank, null, VENDOR_ITEM_REGULAR),
		list("Large General Pouch", 6, /obj/item/storage/pouch/general/large, null, VENDOR_ITEM_REGULAR),
		list("G8-A general utility pouch", 6, /obj/item/storage/backpack/general_belt, null, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Range Finder", 10, /obj/item/device/binoculars/range, null, VENDOR_ITEM_REGULAR),
		list("Supply Beacon", 15, /obj/item/device/whiskey_supply_beacon, null, VENDOR_ITEM_REGULAR),
		list("Laser Designator", 15, /obj/item/device/binoculars/range/designator, null, VENDOR_ITEM_REGULAR),
		list("Fire Extinguisher (Portable)", 5, /obj/item/tool/extinguisher/mini, null, VENDOR_ITEM_REGULAR),
		list("Whistle", 5, /obj/item/device/whistle, null, VENDOR_ITEM_REGULAR),

		list("HELMET OPTICS", 0, null, null, null),
		list("Medical Helmet Optic", 15, /obj/item/device/helmet_visor/medical, null, VENDOR_ITEM_REGULAR),
		list("Welding Visor", 5, /obj/item/device/helmet_visor/welding_visor, null, VENDOR_ITEM_REGULAR),

		list("PAMPHLETS", 0, null, null, null),
		list("JTAC Pamphlet", 15, /obj/item/pamphlet/skill/jtac, null, VENDOR_ITEM_REGULAR),
		list("Engineering Pamphlet", 15, /obj/item/pamphlet/skill/engineer, null, VENDOR_ITEM_REGULAR),

		list("RADIO KEYS", 0, null, null, null),
		list("Engineering Radio Encryption Key", 5, /obj/item/device/encryptionkey/engi, null, VENDOR_ITEM_REGULAR),
		list("Intel Radio Encryption Key", 5, /obj/item/device/encryptionkey/intel, null, VENDOR_ITEM_REGULAR),
		list("JTAC Radio Encryption Key", 5, /obj/item/device/encryptionkey/jtac, null, VENDOR_ITEM_REGULAR),
		list("Supply Radio Encryption Key", 5, /obj/item/device/encryptionkey/req, null, VENDOR_ITEM_REGULAR),
	))

//------------Squad Rifleman---------------
GLOBAL_LIST_INIT(cm_vending_gear_marine, list(

		list("WEAPON SPECIALIZATION KIT (CHOOSE 1)", 0, null, null, null),
		list("M5 RPG Specialist Kit", 0, /obj/item/storage/box/spec/demolitionist, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),
		list("M78 PIG kit", 0, /obj/item/storage/box/spec/pig_operator, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),
		list("Grenadier Kit", 0, /obj/item/storage/box/spec/heavy_grenadier, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),
		list("P9 SHARP Rifle Kit", 0, /obj/item/storage/box/spec/sharp_operator, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),
		list("M240T Flamer Kit", 0, /obj/item/storage/box/spec/pyro, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),
		list("Recon-Spotter Kit", 0, /obj/item/storage/box/spec/scout, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_REGULAR),
		list("Recon-Marksman Kit", 0, /obj/item/storage/box/spec/sniper, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_RECOMMENDED),
		list("Anti-Materiel Rifle Kit", 0, /obj/item/storage/box/guncase/vulture/skillless, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_RECOMMENDED),
		list("Pointman Breacher Kit", 0, /obj/item/storage/box/kit/pursuit, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_RECOMMENDED),

		list("ENGINEERING SUPPLIES", 0, null, null, null),
		list("E-Tool", 5, /obj/item/tool/shovel/etool/folded, null, VENDOR_ITEM_REGULAR),
		list("Sandbags", 20, /obj/item/stack/sandbags_empty/half, null, VENDOR_ITEM_REGULAR),
		list("ES-11 Mobile Fuel Canister", 5, /obj/item/tool/weldpack/minitank, null, VENDOR_ITEM_REGULAR),
		list("ME3 Hand Welder", 5, /obj/item/tool/weldingtool/simple, null, VENDOR_ITEM_REGULAR),

		list("RESTRICTED FIREARMS", 0, null, null, null),
		list("VP78 Pistol", 15, /obj/item/storage/box/guncase/vp78, null, VENDOR_ITEM_REGULAR),
		list("SU-6 Smart Pistol", 15, /obj/item/storage/box/guncase/smartpistol, null, VENDOR_ITEM_REGULAR),
		list("XM51 breaching scattergun", 30, /obj/item/storage/box/guncase/xm51, null, VENDOR_ITEM_RECOMMENDED),
		list("M79 Grenade Launcher", 15, /obj/item/storage/box/guncase/m79, null, VENDOR_ITEM_REGULAR),
		list("XM88 Heavy Rifle", 20, /obj/item/storage/box/guncase/xm88, null, VENDOR_ITEM_REGULAR),

		list("EXTRA SPOTTER AMMUNITION", 0, null, null, null),
		list("A19 High Velocity Impact Magazine (10x24mm)", 40, /obj/item/ammo_magazine/rifle/m4ra/custom/impact, null, VENDOR_ITEM_REGULAR),
		list("A19 High Velocity Incendiary Magazine (10x24mm)", 40, /obj/item/ammo_magazine/rifle/m4ra/custom/incendiary, null, VENDOR_ITEM_REGULAR),
		list("A19 High Velocity Magazine (10x24mm)", 40, /obj/item/ammo_magazine/rifle/m4ra/custom, null, VENDOR_ITEM_REGULAR),

		list("EXTRA MARKSMAN AMMUNITION", 0, null, null, null),
		list("M42A Flak Magazine (10x28mm)", 40, /obj/item/ammo_magazine/sniper/flak, null, VENDOR_ITEM_REGULAR),
		list("M42A Incendiary Magazine (10x28mm)", 40, /obj/item/ammo_magazine/sniper/incendiary, null, VENDOR_ITEM_REGULAR),
		list("M42A Marksman Magazine (10x28mm Caseless)", 40, /obj/item/ammo_magazine/sniper, null, VENDOR_ITEM_REGULAR),
		list("XM43E1 Marksman Magazine (10x99mm Caseless)", 40, /obj/item/ammo_magazine/sniper/anti_materiel, null, VENDOR_ITEM_REGULAR),

		list("EXTRA RPG AMMUNITION", 0, null, null, null),
		list("84mm Anti-Armor Rocket", 40, /obj/item/ammo_magazine/rocket/ap, null, VENDOR_ITEM_REGULAR),
		list("84mm High-Explosive Rocket", 40, /obj/item/ammo_magazine/rocket, null, VENDOR_ITEM_REGULAR),
		list("84mm High-Explosive Fragmentation Rocket", 20, /obj/item/ammo_magazine/rocket/frag, null, VENDOR_ITEM_REGULAR),
		list("84mm White-Phosphorus Rocket", 40, /obj/item/ammo_magazine/rocket/wp, null, VENDOR_ITEM_REGULAR),

		list("EXTRA SHARP AMMUNITION", 0, null, null, null),
		list("SHARP 9X-E Sticky Explosive Dart magazine (darts)", 40, /obj/item/ammo_magazine/rifle/sharp/explosive, null, VENDOR_ITEM_REGULAR),
		list("SHARP 9X-T Sticky incendiary Dart magazine (darts)", 40, /obj/item/ammo_magazine/rifle/sharp/incendiary, null, VENDOR_ITEM_REGULAR),
		list("SHARP 9X-F Flechette Dart Magazine (darts)", 40, /obj/item/ammo_magazine/rifle/sharp/flechette, null, VENDOR_ITEM_REGULAR),

		list("EXTRA PIG AMMUNITION", 0, null, null, null),
		list("M78 PIG pellets cannister (pellets)", 80, /obj/item/ammo_magazine/m78_pig, null, VENDOR_ITEM_REGULAR),
		list("DV9 heavy weapons battery", 80, /obj/item/heavygun_battery, null, VENDOR_ITEM_REGULAR),

		list("EXTRA GRENADES", 0, null, null, null),
		list("M40 HEDP Grenades x6", 20, /obj/effect/essentials_set/hedp_6_pack, null, VENDOR_ITEM_REGULAR),
		list("M40 HIDP Incendiary Grenades x6", 20, /obj/effect/essentials_set/hidp_6_pack, null, VENDOR_ITEM_REGULAR),
		list("M40 CCDP Chemical Compound Grenades x6", 20, /obj/effect/essentials_set/ccdp_6_pack, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-F Fragmentation Grenades x6", 20, /obj/effect/essentials_set/agmf_6_pack, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-I Incendiary Grenades x6", 20, /obj/effect/essentials_set/agmi_6_pack, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-S Smoke Grenades x6", 10, /obj/effect/essentials_set/agms_6_pack, null, VENDOR_ITEM_REGULAR),
		list("G2 Electroshock Grenade Pack x6", 20, /obj/effect/essentials_set/sebb_6_pack, null, VENDOR_ITEM_REGULAR),
		list("M40 HPDP White Phosphorus Packet (x3 grenades)", 20, /obj/item/storage/box/packet/phosphorus, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Frag Airburst Packet (x3 airburst grenades)", 15, /obj/item/storage/box/packet/airburst_he, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Incendiary Airburst Packet (x3 airburst grenades)", 15, /obj/item/storage/box/packet/airburst_incen, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Smoke Airburst Packet (x3 airburst grenades)", 10, /obj/item/storage/box/packet/airburst_smoke, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Hornet Airburst Packet (x3 airburst grenades", 10, /obj/item/storage/box/packet/hornet, null, VENDOR_ITEM_REGULAR),

		list("EXTRA FLAMETHROWER TANKS", 0, null, null, null),
		list("Large Incinerator Tank", 40, /obj/item/ammo_magazine/flamer_tank/large, null, VENDOR_ITEM_REGULAR),
		list("Large Incinerator Tank (B) (Green Flame)", 40, /obj/item/ammo_magazine/flamer_tank/large/B, null, VENDOR_ITEM_REGULAR),
		list("Large Incinerator Tank (X) (Blue Flame)", 40, /obj/item/ammo_magazine/flamer_tank/large/X, null, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("E-Tool", 5, /obj/item/tool/shovel/etool/folded, null, VENDOR_ITEM_REGULAR),
		list("Sandbags", 20, /obj/item/stack/sandbags_empty/half, null, VENDOR_ITEM_REGULAR),
		list("Concertina Wire x50", 10, /obj/item/stack/concertina_wire/full_stack, null, VENDOR_ITEM_REGULAR),
		list("Fulton Device Stack", 5, /obj/item/stack/fulton, null, VENDOR_ITEM_REGULAR),
		list("Range Finder", 10, /obj/item/device/binoculars/range, null, VENDOR_ITEM_REGULAR),
		list("Laser Designator", 15, /obj/item/device/binoculars/range/designator, null, VENDOR_ITEM_REGULAR),
		list("Fire Extinguisher (Portable)", 5, /obj/item/tool/extinguisher/mini, null, VENDOR_ITEM_REGULAR),
		list("Motion Detector", 15, /obj/item/device/motiontracker/adv, null, VENDOR_ITEM_REGULAR),
		list("Supply Beacon", 15, /obj/item/device/whiskey_supply_beacon, null, VENDOR_ITEM_REGULAR),
		list("Whistle", 5, /obj/item/device/whistle, null, VENDOR_ITEM_REGULAR),
	))
