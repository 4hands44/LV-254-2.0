/obj/structure/machinery/cm_vending/clothing/squad_marines
	name = "\improper ColMarTech Enlisted Marine Uniform Rack"
	desc = "An automated uniform vendor for enlisted marines."
	req_access = list(ACCESS_MARINE_PREP)
	vendor_role = list(JOB_SQUAD_MARINE, JOB_SQUAD_LEADER, JOB_SQUAD_ENGI, JOB_SQUAD_MEDIC, JOB_SQUAD_SPECIALIST, JOB_SQUAD_SMARTGUN, JOB_SQUAD_TEAM_LEADER)

/obj/structure/machinery/cm_vending/clothing/squad_marines/get_listed_products(mob/user)
	if(!user)
		var/list/combined = list()
		combined += GLOB.cm_vending_clothing_leader
		combined += GLOB.cm_vending_clothing_marine
		combined += GLOB.cm_vending_clothing_medic
		combined += GLOB.cm_vending_clothing_engi
		combined += GLOB.cm_vending_clothing_smartgun
		combined += GLOB.cm_vending_clothing_specialist
		combined += GLOB.cm_vending_clothing_tl
		return combined
	if(user.job == JOB_SQUAD_LEADER)
		return GLOB.cm_vending_clothing_leader
	else if(user.job == JOB_SQUAD_TEAM_LEADER)
		return GLOB.cm_vending_clothing_tl
	else if(user.job == JOB_SQUAD_ENGI)
		return GLOB.cm_vending_clothing_engi
	else if(user.job == JOB_SQUAD_MEDIC)
		return GLOB.cm_vending_clothing_medic
	else if(user.job == JOB_SQUAD_SPECIALIST)
		return GLOB.cm_vending_clothing_specialist
	else if(user.job == JOB_SQUAD_SMARTGUN)
		return GLOB.cm_vending_clothing_smartgun
	else if(user.job == JOB_SQUAD_MARINE)
		return GLOB.cm_vending_clothing_marine
	return ..()

//------------Squad Leader---------------

GLOBAL_LIST_INIT(cm_vending_clothing_leader, list(
		list("STANDARD EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Standard Marine Apparel", 0, list(/obj/item/clothing/under/marine, /obj/item/clothing/shoes/marine/knife, /obj/item/clothing/gloves/marine, /obj/item/device/radio/headset/almayer/marine, /obj/item/clothing/ears/earmuffs/earplugs, /obj/item/clothing/head/helmet/marine/leader), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("B12 Pattern Armor", 0, /obj/item/clothing/suit/storage/marine/medium/leader, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_MANDATORY),
		list("MRE", 0, /obj/item/storage/box/mre, MARINE_CAN_BUY_MRE, VENDOR_ITEM_MANDATORY),
		list("Map", 0, /obj/item/map/current_map, MARINE_CAN_BUY_ATTACHMENT, VENDOR_ITEM_MANDATORY),

		list("BACKPACK (CHOOSE 1)", 0, null, null, null),
		list("IMP Backpack", 0, /obj/item/storage/backpack/marine, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Lightweight IMP Backpack", 0, /obj/item/storage/backpack/marine/satchel/squad, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_RECOMMENDED),
		list("Machete Scabbard (Full)", 0, /obj/item/storage/large_holster/machete/full, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Satchel", 0, /obj/item/storage/backpack/marine/satchel, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_RECOMMENDED),

		list("BELT (CHOOSE 1)", 0, null, null, null),
		list("G8-A General Utility Pouch", 0, /obj/item/storage/backpack/general_belt, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),
		list("M276 Ammo Load Rig", 0, /obj/item/storage/belt/marine, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),
		list("M276 General Pistol Holster Rig", 0, /obj/item/storage/belt/gun/m4a3, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Lifesaver Bag", 0, /obj/item/storage/belt/medical/lifesaver, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Medical Storage Rig", 0, /obj/item/storage/belt/medical, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M39 Holster Rig", 0, /obj/item/storage/belt/gun/m39, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M10 Holster Rig", 0, /obj/item/storage/belt/gun/m10, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 General Revolver Holster Rig", 0, /obj/item/storage/belt/gun/m44, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M82F Holster Rig", 0, /obj/item/storage/belt/gun/flaregun, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Shotgun Shell Loading Rig", 0, /obj/item/storage/belt/shotgun, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Toolbelt Rig (Full)", 0, /obj/item/storage/belt/utility/full, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M40 Grenade Rig", 0, /obj/item/storage/belt/grenade, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),

		list("POUCHES (CHOOSE 2)", 0, null, null, null),
		list("Autoinjector Pouch (Full)", 0, /obj/item/storage/pouch/autoinjector/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Individual First-Aid Kit (Tan)", 0, /obj/item/storage/ifak, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Individual First-Aid Kit (Black)", 0, /obj/item/storage/ifak/blk, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Flare Pouch (Full)", 0, /obj/item/storage/pouch/flare/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Fuel Tank Strap Pouch", 0, /obj/item/storage/pouch/flamertank, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Large General Pouch", 0, /obj/item/storage/pouch/general/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Sling Pouch", 0, /obj/item/storage/pouch/sling, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Large Magazine Pouch", 0, /obj/item/storage/pouch/magazine/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Large Shotgun Shell Pouch", 0, /obj/item/storage/pouch/shotgun/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Large Pistol Magazine Pouch", 0, /obj/item/storage/pouch/magazine/pistol/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Pistol Pouch", 0, /obj/item/storage/pouch/pistol, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),

		list("ACCESSORIES (CHOOSE 1)", 0, null, null, null),
		list("Black Webbing Vest", 0, /obj/item/clothing/accessory/storage/black_vest, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Brown Webbing Vest", 0, /obj/item/clothing/accessory/storage/black_vest/brown_vest, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Shoulder Holster", 0, /obj/item/clothing/accessory/storage/holster, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Webbing", 0, /obj/item/clothing/accessory/storage/webbing, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Black Webbing", 0, /obj/item/clothing/accessory/storage/webbing/black, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Drop Pouch", 0, /obj/item/clothing/accessory/storage/droppouch, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),

		list("MASK (CHOOSE 1)", 0, null, null, null),
		list("Gas Mask", 0, /obj/item/clothing/mask/gas, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),
		list("Heat Absorbent Coif", 0, /obj/item/clothing/mask/rebreather/scarf, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),
	))

//------------Team lead---------------

GLOBAL_LIST_INIT(cm_vending_clothing_tl, list(
		list("STANDARD EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Standard Marine Apparel", 0, list(/obj/item/clothing/under/marine, /obj/item/clothing/shoes/marine/knife, /obj/item/clothing/gloves/marine, /obj/item/device/radio/headset/almayer/marine, /obj/item/clothing/head/helmet/marine/rto), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("M4 Pattern Armor", 0, /obj/item/clothing/suit/storage/marine/medium/rto, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_MANDATORY),
		list("MRE", 0, /obj/item/storage/box/mre, MARINE_CAN_BUY_MRE, VENDOR_ITEM_MANDATORY),
		list("Map", 0, /obj/item/map/current_map, MARINE_CAN_BUY_KIT, VENDOR_ITEM_MANDATORY),
		list("Essential Fireteam Leader Utilities", 0, /obj/effect/essentials_set/tl, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_MANDATORY),

		list("BELT (CHOOSE 1)", 0, null, null, null),
		list("G8-A General Utility Pouch", 0, /obj/item/storage/backpack/general_belt, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Ammo Load Rig", 0, /obj/item/storage/belt/marine, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),
		list("M276 General Pistol Holster Rig", 0, /obj/item/storage/belt/gun/m4a3, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M39 Holster Rig", 0, /obj/item/storage/belt/gun/m39, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M10 Holster Rig", 0, /obj/item/storage/belt/gun/m10, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 General Revolver Holster Rig", 0, /obj/item/storage/belt/gun/m44, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M82F Holster Rig", 0, /obj/item/storage/belt/gun/flaregun, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Shotgun Shell Loading Rig", 0, /obj/item/storage/belt/shotgun, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Toolbelt Rig (Full)", 0, /obj/item/storage/belt/utility/full, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),
		list("M276 M40 Grenade Rig", 0, /obj/item/storage/belt/grenade, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),

		list("POUCHES (CHOOSE 2)", 0, null, null, null),
		list("Individual First-Aid Kit (Tan)", 0, /obj/item/storage/ifak, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Individual First-Aid Kit (Black)", 0, /obj/item/storage/ifak/blk, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("First Responder Pouch", 0, /obj/item/storage/pouch/first_responder, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Flare Pouch (Full)", 0, /obj/item/storage/pouch/flare/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Fuel Tank Strap Pouch", 0, /obj/item/storage/pouch/flamertank, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Large General Pouch", 0, /obj/item/storage/pouch/general/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Sling Pouch", 0, /obj/item/storage/pouch/sling, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Large Pistol Magazine Pouch", 0, /obj/item/storage/pouch/magazine/pistol/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Magazine Pouch", 0, /obj/item/storage/pouch/magazine, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Shotgun Shell Pouch", 0, /obj/item/storage/pouch/shotgun, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Sidearm Pouch", 0, /obj/item/storage/pouch/pistol, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Tools Pouch (Full)", 0, /obj/item/storage/pouch/tools/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),

		list("ACCESSORIES (CHOOSE 1)", 0, null, null, null),
		list("Black Webbing Vest", 0, /obj/item/clothing/accessory/storage/black_vest, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Brown Webbing Vest", 0, /obj/item/clothing/accessory/storage/black_vest/brown_vest, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Shoulder Holster", 0, /obj/item/clothing/accessory/storage/holster, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Webbing", 0, /obj/item/clothing/accessory/storage/webbing, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Black Webbing", 0, /obj/item/clothing/accessory/storage/webbing/black, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Drop Pouch", 0, /obj/item/clothing/accessory/storage/droppouch, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),

		list("MASK (CHOOSE 1)", 0, null, null, null),
		list("Gas Mask", 0, /obj/item/clothing/mask/gas, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),
		list("Heat Absorbent Coif", 0, /obj/item/clothing/mask/rebreather/scarf, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR)
	))

//------------Squad Engineer---------------
GLOBAL_LIST_INIT(cm_vending_clothing_engi, list(
		list("STANDARD EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Standard Marine Apparel", 0, list(/obj/item/clothing/under/marine/engineer, /obj/item/clothing/shoes/marine/knife, /obj/item/clothing/gloves/marine, /obj/item/device/radio/headset/almayer/marine, /obj/item/clothing/ears/earmuffs/earplugs), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("MRE", 0, /obj/item/storage/box/mre, MARINE_CAN_BUY_MRE, VENDOR_ITEM_MANDATORY),
		list("Map", 0, /obj/item/map/current_map, MARINE_CAN_BUY_KIT, VENDOR_ITEM_MANDATORY),

		list("HELMET (CHOOSE 1)", 0, null, null, null),
		list("M10 technician helmet", 0, /obj/item/clothing/head/helmet/marine/tech, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("M10 welding helmet", 0, /obj/item/clothing/head/helmet/marine/welding, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),

		list("ARMOR (CHOOSE 1)", 0, null, null, null),
		list("Standard Armor", 0, /obj/item/clothing/suit/storage/marine/medium, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_RECOMMENDED),
		list("Heavy Armor", 0, /obj/item/clothing/suit/storage/marine/heavy, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_REGULAR),

		list("BACKPACK (CHOOSE 1)", 0, null, null, null),
		list("Machete Scabbard (Full)", 0, /obj/item/storage/large_holster/machete/full, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Technician Backpack", 0, /obj/item/storage/backpack/marine/tech, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Technician Satchel", 0, /obj/item/storage/backpack/marine/satchel/tech, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Technician Welderpack", 0, /obj/item/storage/backpack/marine/engineerpack, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_MANDATORY),
		list("Technician Welder-Satchel", 0, /obj/item/storage/backpack/marine/engineerpack/satchel, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Technician Welder Chestrig", 0, /obj/item/storage/backpack/marine/engineerpack/welder_chestrig, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_MANDATORY),
		list("Grenade Satchel", 0, /obj/item/storage/backpack/marine/grenadepack, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),

		list("BELT (CHOOSE 1)", 0, null, null, null),
		list("G8-A General Utility Pouch", 0, /obj/item/storage/backpack/general_belt, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Ammo Load Rig", 0, /obj/item/storage/belt/marine, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 General Pistol Holster Rig", 0, /obj/item/storage/belt/gun/m4a3, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M39 Holster Rig", 0, /obj/item/storage/belt/gun/m39, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 General Revolver Holster Rig", 0, /obj/item/storage/belt/gun/m44, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M82F Holster Rig", 0, /obj/item/storage/belt/gun/flaregun, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Shotgun Shell Loading Rig", 0, /obj/item/storage/belt/shotgun, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Toolbelt Rig (Full)", 0, /obj/item/storage/belt/utility/full, MARINE_CAN_BUY_BELT, VENDOR_ITEM_MANDATORY),
		list("M276 M40 Grenade Rig", 0, /obj/item/storage/belt/grenade, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M277 Pattern Construction Rig", 0, /obj/item/storage/belt/utility/construction, MARINE_CAN_BUY_BELT, VENDOR_ITEM_MANDATORY),
		list("M276 Mortar Operator Belt", 0, /obj/item/storage/belt/gun/mortarbelt, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Toolbelt Rig (Full)", 0, /obj/item/storage/belt/gun/utility/full/ms, MARINE_CAN_BUY_BELT, VENDOR_ITEM_MANDATORY),
		list("M276 M40 Grenade Rig", 0, /obj/item/storage/belt/grenade, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),

		list("POUCHES (CHOOSE 2)", 0, null, null, null),
		list("Construction Pouch", 0, /obj/item/storage/pouch/construction, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Individual First-Aid Kit (Tan)", 0, /obj/item/storage/ifak, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Individual First-Aid Kit (Black)", 0, /obj/item/storage/ifak/blk, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Electronics Pouch (Full)", 0, /obj/item/storage/pouch/electronics/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Explosive Pouch", 0, /obj/item/storage/pouch/explosive, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Flare Pouch (Full)", 0, /obj/item/storage/pouch/flare/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Large Pistol Magazine Pouch", 0, /obj/item/storage/pouch/magazine/pistol/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Magazine Pouch", 0, /obj/item/storage/pouch/magazine, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Shotgun Shell Pouch", 0, /obj/item/storage/pouch/shotgun, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medium General Pouch", 0, /obj/item/storage/pouch/general/medium, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Pistol Pouch", 0, /obj/item/storage/pouch/pistol, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Tools Pouch (Full)", 0, /obj/item/storage/pouch/tools/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Engineer kit Pouch", 0, /obj/item/storage/pouch/engikit, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),


		list("ACCESSORIES (CHOOSE 1)", 0, null, null, null),
		list("Black Webbing Vest", 0, /obj/item/clothing/accessory/storage/black_vest, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Brown Webbing Vest", 0, /obj/item/clothing/accessory/storage/black_vest/brown_vest, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Shoulder Holster", 0, /obj/item/clothing/accessory/storage/holster, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Webbing", 0, /obj/item/clothing/accessory/storage/webbing, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Black Webbing", 0, /obj/item/clothing/accessory/storage/webbing/black, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Drop Pouch", 0, /obj/item/clothing/accessory/storage/droppouch, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Small Tool Webbing (Full)", 0, /obj/item/clothing/accessory/storage/tool_webbing/small/equipped, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),

		list("MASK (CHOOSE 1)", 0, null, null, null),
		list("Gas Mask", 0, /obj/item/clothing/mask/gas, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),
		list("Heat Absorbent Coif", 0, /obj/item/clothing/mask/rebreather/scarf, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),
	))

//------------Squad medic---------------
GLOBAL_LIST_INIT(cm_vending_clothing_medic, list(
		list("STANDARD EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Standard Marine Apparel", 0, list(/obj/item/clothing/under/marine/medic, /obj/item/clothing/shoes/marine/knife, /obj/item/clothing/gloves/marine, /obj/item/device/radio/headset/almayer/marine, /obj/item/clothing/ears/earmuffs/earplugs), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("Combat Sterile Gloves", 0, /obj/item/clothing/gloves/marine/medical, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_REGULAR),
		list("MRE", 0, /obj/item/storage/box/mre, MARINE_CAN_BUY_MRE, VENDOR_ITEM_MANDATORY),
		list("Map", 0, /obj/item/map/current_map, MARINE_CAN_BUY_KIT, VENDOR_ITEM_MANDATORY),

		list("ARMOR (CHOOSE 1)", 0, null, null, null),
		list("Light Armor", 0, /obj/item/clothing/suit/storage/marine/light, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_REGULAR),
		list("Medium Armor", 0, /obj/item/clothing/suit/storage/marine/medium, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_RECOMMENDED),
		list("Heavy Armor", 0, /obj/item/clothing/suit/storage/marine/heavy, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_REGULAR),

		list("HELMET (CHOOSE 1)", 0, null, null, null),
		list("M10 Corpsman Helmet", 0, /obj/item/clothing/head/helmet/marine/medic, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("M10 White Corpsman Helmet", 0, /obj/item/clothing/head/helmet/marine/medic/white, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),

		list("BACKPACK (CHOOSE 1)", 0, null, null, null),
		list("Medical Backpack", 0, /obj/item/storage/backpack/marine/medic, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Medical Satchel", 0, /obj/item/storage/backpack/marine/satchel/medic, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_RECOMMENDED),

		list("BELT (CHOOSE 1)", 0, null, null, null),
		list("M276 Lifesaver Bag (Full)", 0, /obj/item/storage/belt/medical/lifesaver/full, MARINE_CAN_BUY_BELT, VENDOR_ITEM_MANDATORY),
		list("M276 Medical Storage Rig (Full)", 0, /obj/item/storage/belt/medical/full, MARINE_CAN_BUY_BELT, VENDOR_ITEM_MANDATORY),
		list("M276 Ammo Load Rig", 0, /obj/item/storage/belt/marine, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 General Pistol Holster Rig", 0, /obj/item/storage/belt/gun/m4a3, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M39 Holster Rig", 0, /obj/item/storage/belt/gun/m39, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M44 Holster Rig", 0, /obj/item/storage/belt/gun/m44, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M82F Holster Rig", 0, /obj/item/storage/belt/gun/flaregun, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Shotgun Shell Loading Rig", 0, /obj/item/storage/belt/shotgun, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M40 Grenade Rig", 0, /obj/item/storage/belt/grenade, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),

		list("POUCHES (CHOOSE 2)", 0, null, null, null),
		list("Pressurized Reagent Canister Pouch (Revival Mix - Tricordrazine)", 0, /obj/item/storage/pouch/pressurized_reagent_canister/revival_tricord, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Pressurized Reagent Canister Pouch (Revival Mix - Peridaxon)", 0, /obj/item/storage/pouch/pressurized_reagent_canister/revival_peri, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Individual First-Aid Kit (Tan)", 0, /obj/item/storage/ifak, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Individual First-Aid Kit (Black)", 0, /obj/item/storage/ifak/blk, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Multiple First-Aid Kit (empty)", 0, /obj/item/storage/pouch/medkit, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Autoinjector Pouch", 0, /obj/item/storage/pouch/autoinjector, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("First Responder Pouch", 0, /obj/item/storage/pouch/first_responder, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Pressurized Reagent Canister Pouch (Bicaridine)", 0, /obj/item/storage/pouch/pressurized_reagent_canister/bicaridine, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Pressurized Reagent Canister Pouch (Kelotane)", 0, /obj/item/storage/pouch/pressurized_reagent_canister/kelotane, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Pressurized Reagent Canister Pouch (Tricordrazine)", 0, /obj/item/storage/pouch/pressurized_reagent_canister/tricordrazine, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Pressurized Reagent Canister Pouch (EMPTY)", 0, /obj/item/storage/pouch/pressurized_reagent_canister, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Vial Pouch (Full)", 0, /obj/item/storage/pouch/vials/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Pouch", 0, /obj/item/storage/pouch/medical, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Flare Pouch (Full)", 0, /obj/item/storage/pouch/flare/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Large General Pouch", 0, /obj/item/storage/pouch/general/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Sling Pouch", 0, /obj/item/storage/pouch/sling, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Large Pistol Magazine Pouch", 0, /obj/item/storage/pouch/magazine/pistol/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Magazine Pouch", 0, /obj/item/storage/pouch/magazine, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Shotgun Shell Pouch", 0, /obj/item/storage/pouch/shotgun, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Pistol Pouch", 0, /obj/item/storage/pouch/pistol, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),

		list("ACCESSORIES (CHOOSE 1)", 0, null, null, null),
		list("Surgical Webbing Vest", 0, /obj/item/clothing/accessory/storage/surg_vest/equipped, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Brown Webbing Vest", 0, /obj/item/clothing/accessory/storage/black_vest/brown_vest, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Black Webbing Vest", 0, /obj/item/clothing/accessory/storage/black_vest, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Shoulder Holster", 0, /obj/item/clothing/accessory/storage/holster, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Webbing", 0, /obj/item/clothing/accessory/storage/webbing, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Black Webbing", 0, /obj/item/clothing/accessory/storage/webbing/black, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Drop Pouch", 0, /obj/item/clothing/accessory/storage/droppouch, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),

		list("MASK (CHOOSE 1)", 0, null, null, null),
		list("Sterile Mask", 0, /obj/item/clothing/mask/surgical, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),
		list("Gas Mask", 0, /obj/item/clothing/mask/gas, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),
		list("Heat Absorbent Coif", 0, /obj/item/clothing/mask/rebreather/scarf, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR)
	))

//------------Squad Specialist---------------
GLOBAL_LIST_INIT(cm_vending_clothing_specialist, list(
		list("STANDARD EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Standard Marine Apparel", 0, list(/obj/item/clothing/under/marine, /obj/item/clothing/shoes/marine/knife, /obj/item/clothing/gloves/marine, /obj/item/device/radio/headset/almayer/marine), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("MRE", 0, /obj/item/storage/box/mre, MARINE_CAN_BUY_MRE, VENDOR_ITEM_MANDATORY),
		list("Map", 0, /obj/item/map/current_map, MARINE_CAN_BUY_KIT, VENDOR_ITEM_MANDATORY),

		list("BACKPACK (CHOOSE 1)", 0, null, null, null),
		list("IMP Backpack", 0, /obj/item/storage/backpack/marine, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Lightweight IMP Backpack", 0, /obj/item/storage/backpack/marine/satchel/squad, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_RECOMMENDED),
		list("Satchel", 0, /obj/item/storage/backpack/marine/satchel, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_RECOMMENDED),

		list("BELT (CHOOSE 1)", 0, null, null, null),
		list("G8-A General Utility Pouch", 0, /obj/item/storage/backpack/general_belt, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),
		list("M276 Ammo Load Rig", 0, /obj/item/storage/belt/marine, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 General Pistol Holster Rig", 0, /obj/item/storage/belt/gun/m4a3, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),
		list("M276 M39 Holster Rig", 0, /obj/item/storage/belt/gun/m39, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M10 Holster Rig", 0, /obj/item/storage/belt/gun/m10, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 General Revolver Holster Rig", 0, /obj/item/storage/belt/gun/m44, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M82F Holster Rig", 0, /obj/item/storage/belt/gun/flaregun, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Shotgun Shell Loading Rig", 0, /obj/item/storage/belt/shotgun, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),

		list("POUCHES (CHOOSE 2)", 0, null, null, null),
		list("Individual First-Aid Kit (Tan)", 0, /obj/item/storage/ifak, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Individual First-Aid Kit (Black)", 0, /obj/item/storage/ifak/blk, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Flare Pouch (Full)", 0, /obj/item/storage/pouch/flare/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Magazine Pouch", 0, /obj/item/storage/pouch/magazine, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Shotgun Shell Pouch", 0, /obj/item/storage/pouch/shotgun, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Large Pistol Magazine Pouch", 0, /obj/item/storage/pouch/magazine/pistol/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medium General Pouch", 0, /obj/item/storage/pouch/general/medium, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Pistol Pouch", 0, /obj/item/storage/pouch/pistol, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Sling Pouch", 0, /obj/item/storage/pouch/sling, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),

		list("ACCESSORIES (CHOOSE 1)", 0, null, null, null),
		list("Brown Webbing Vest", 0, /obj/item/clothing/accessory/storage/black_vest/brown_vest, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Black Webbing Vest", 0, /obj/item/clothing/accessory/storage/black_vest, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Shoulder Holster", 0, /obj/item/clothing/accessory/storage/holster, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Webbing", 0, /obj/item/clothing/accessory/storage/webbing, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Black Webbing", 0, /obj/item/clothing/accessory/storage/webbing/black, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Drop Pouch", 0, /obj/item/clothing/accessory/storage/droppouch, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),

		list("MASK (CHOOSE 1)", 0, null, null, null),
		list("Gas Mask", 0, /obj/item/clothing/mask/gas, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),
		list("Heat Absorbent Coif", 0, /obj/item/clothing/mask/rebreather/scarf, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),

		list("RESTRICTED FIREARMS", 0, null, null, null),
		list("VP78 Pistol", 15, /obj/item/storage/box/guncase/vp78, null, VENDOR_ITEM_REGULAR),
		list("SU-6 Smart Pistol", 15, /obj/item/storage/box/guncase/smartpistol, null, VENDOR_ITEM_REGULAR),

		list("SIDEARM AMMUNITION", 0, null, null, null),
		list("M10 HV extended magazine (10x20mm)", 10, /obj/item/ammo_magazine/pistol/m10/extended , null, VENDOR_ITEM_REGULAR),
		list("M10 HV drum magazine (10x20mm)", 15, /obj/item/ammo_magazine/pistol/m10/drum , null, VENDOR_ITEM_REGULAR),
		list("M44 Heavy Speed Loader (.44)", 10, /obj/item/ammo_magazine/revolver/heavy, null, VENDOR_ITEM_REGULAR),
		list("M44 Marksman Speed Loader (.44)", 10, /obj/item/ammo_magazine/revolver/marksman, null, VENDOR_ITEM_REGULAR),
		list("M4A3 HP Magazine", 5, /obj/item/ammo_magazine/pistol/hp, null, VENDOR_ITEM_REGULAR),
		list("M4A3 AP Magazine", 5, /obj/item/ammo_magazine/pistol/ap, null, VENDOR_ITEM_REGULAR),
		list("VP78 Magazine", 5, /obj/item/ammo_magazine/pistol/vp78, null, VENDOR_ITEM_REGULAR),
		list("SU-6 Smartpistol Magazine (.45)", 10, /obj/item/ammo_magazine/pistol/smart, null, VENDOR_ITEM_REGULAR),

		list("CLOTHING ITEMS", 0, null, null, null),
		list("Machete Scabbard (Full)", 6, /obj/item/storage/large_holster/machete/full, null, VENDOR_ITEM_REGULAR),
		list("Machete Pouch (Full)", 15, /obj/item/storage/pouch/machete/full, null, VENDOR_ITEM_REGULAR),
		list("USCM Radio Telephone Pack", 15, /obj/item/storage/backpack/marine/satchel/rto, null, VENDOR_ITEM_REGULAR),
		list("Fuel Tank Strap Pouch", 5, /obj/item/storage/pouch/flamertank, null, VENDOR_ITEM_REGULAR),
		list("Welding Goggles", 3, /obj/item/clothing/glasses/welding, null, VENDOR_ITEM_REGULAR),
		list("Large General Pouch", 10, /obj/item/storage/pouch/general/large, null, VENDOR_ITEM_REGULAR),
		list("M276 Pattern Combat Toolbelt Rig", 15, /obj/item/storage/belt/gun/utility, null, VENDOR_ITEM_REGULAR),
		list("Autoinjector Pouch (Full)", 15, /obj/item/storage/pouch/autoinjector/full, null, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Roller Bed", 5, /obj/item/roller, null, VENDOR_ITEM_REGULAR),
		list("Fulton Device Stack", 5, /obj/item/stack/fulton, null, VENDOR_ITEM_REGULAR),
		list("Fire Extinguisher (Portable)", 5, /obj/item/tool/extinguisher/mini, null, VENDOR_ITEM_REGULAR),
		list("Motion Detector", 10, /obj/item/device/motiondetector, null, VENDOR_ITEM_REGULAR),
		list("Data Detector", 10, /obj/item/device/motiondetector/intel, null, VENDOR_ITEM_REGULAR),
		list("Whistle", 5, /obj/item/device/whistle, null, VENDOR_ITEM_REGULAR),

		list("BINOCULARS", 0, null, null, null),
		list("Binoculars", 5, /obj/item/device/binoculars, null, VENDOR_ITEM_REGULAR),
		list("Range Finder", 10, /obj/item/device/binoculars/range, null, VENDOR_ITEM_REGULAR),
		list("Laser Designator", 15, /obj/item/device/binoculars/range/designator, null, VENDOR_ITEM_REGULAR),

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

//------------Squad Smartgunner---------------
GLOBAL_LIST_INIT(cm_vending_clothing_smartgun, list(
		list("STANDARD EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Standard Marine Apparel", 0, list(/obj/item/clothing/under/marine, /obj/item/clothing/shoes/marine/knife, /obj/item/clothing/gloves/marine, /obj/item/clothing/head/cmcap/bridge, /obj/item/clothing/head/helmet/marine,  /obj/item/clothing/accessory/flak), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("MRE", 0, /obj/item/storage/box/mre, MARINE_CAN_BUY_MRE, VENDOR_ITEM_MANDATORY),
		list("Map", 0, /obj/item/map/current_map, MARINE_CAN_BUY_KIT, VENDOR_ITEM_MANDATORY),

		list("RADIO HEADSET (PICK ONE)", 0, null, null, null),
		list("Marine radio headset", 0, list(/obj/item/device/radio/headset/almayer/marine, /obj/item/clothing/ears/earmuffs/earplugs), MARINE_CAN_BUY_EAR, VENDOR_ITEM_RECOMMENDED),
		list("M5 Camera Gear radio headset", 0, list(/obj/item/device/radio/headset/almayer/marine/overwatch_camera, /obj/item/clothing/ears/earmuffs/earplugs), MARINE_CAN_BUY_EAR, VENDOR_ITEM_RECOMMENDED),

		list("BELT", 0, null, null, null),
		list("M802 Smartgunner Sidearm Belt", 0, /obj/item/storage/belt/gun/smartgunner/teamwork/full, MARINE_CAN_BUY_BELT, VENDOR_ITEM_MANDATORY),
		list("M802 Plasmagunner Belt", 0, /obj/item/storage/belt/marine/smartgunner/xm_limited, MARINE_CAN_BUY_BELT, VENDOR_ITEM_MANDATORY),
		list("M802 HPR Supportgunner Belt", 0, /obj/item/storage/belt/gun/smartgunner/hpr, MARINE_CAN_BUY_BELT, VENDOR_ITEM_MANDATORY),
		list("M276 Ammo Load Rig", 0, /obj/item/storage/belt/marine, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),

		list("BACKPACK", 0, null, null, null),
		list("IMP Ammo Bearer Pack", 0, /obj/item/storage/backpack/marine/ammo_rack, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_MANDATORY),

		list("POUCHES (CHOOSE 2)", 0, null, null, null),
		list("Flare Pouch (Full)", 0, /obj/item/storage/pouch/flare/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Electronics Pouch", 0, /obj/item/storage/pouch/electronics, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Individual First-Aid Kit (Tan)", 0, /obj/item/storage/ifak, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Individual First-Aid Kit (Black)", 0, /obj/item/storage/ifak/blk, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Large Pistol Magazine Pouch", 0, /obj/item/storage/pouch/magazine/pistol/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Magazine Pouch", 0, /obj/item/storage/pouch/magazine, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Shotgun Shell Pouch", 0, /obj/item/storage/pouch/shotgun, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medium General Pouch", 0, /obj/item/storage/pouch/general/medium, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Pistol Pouch", 0, /obj/item/storage/pouch/pistol, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Machete Pouch (Full)", 0, /obj/item/storage/pouch/machete/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Sling Pouch", 0, /obj/item/storage/pouch/sling, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),

		list("ACCESSORIES (CHOOSE 1)", 0, null, null, null),
		list("Brown Webbing Vest", 0, /obj/item/clothing/accessory/storage/black_vest/brown_vest, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Black Webbing Vest", 0, /obj/item/clothing/accessory/storage/black_vest, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Shoulder Holster", 0, /obj/item/clothing/accessory/storage/holster, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Webbing", 0, /obj/item/clothing/accessory/storage/webbing, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Black Webbing", 0, /obj/item/clothing/accessory/storage/webbing/black, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Drop Pouch", 0, /obj/item/clothing/accessory/storage/droppouch, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),

		list("MASK (CHOOSE 1)", 0, null, null, null),
		list("Gas Mask", 0, /obj/item/clothing/mask/gas, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),
		list("Heat Absorbent Coif", 0, /obj/item/clothing/mask/rebreather/scarf, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),
))

//------------Squad Rifleman---------------
GLOBAL_LIST_INIT(cm_vending_clothing_marine, list(
		list("STANDARD EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Standard Marine Apparel", 0, list(/obj/item/clothing/under/marine, /obj/item/clothing/shoes/marine/knife, /obj/item/clothing/gloves/marine, /obj/item/device/radio/headset/almayer/marine, /obj/item/clothing/ears/earmuffs/earplugs, /obj/item/clothing/head/helmet/marine), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("MRE", 0, /obj/item/storage/box/mre, MARINE_CAN_BUY_MRE, VENDOR_ITEM_MANDATORY),
		list("Map", 0, /obj/item/map/current_map, MARINE_CAN_BUY_KIT, VENDOR_ITEM_MANDATORY),

		list("ARMOR (CHOOSE 1)", 0, null, null, null),
		list("Standard Armor", 0, /obj/item/clothing/suit/storage/marine/medium, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_REGULAR),
		list("Heavy Armor", 0, /obj/item/clothing/suit/storage/marine/heavy, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_REGULAR),

		list("BACKPACK (CHOOSE 1)", 0, null, null, null),
		list("IMP Backpack", 0, /obj/item/storage/backpack/marine, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Lightweight IMP Backpack", 0, /obj/item/storage/backpack/marine/satchel/squad, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_RECOMMENDED),
		list("IMP Ammo Bearer Pack", 0, /obj/item/storage/backpack/marine/ammo_rack, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_MANDATORY),
		list("Satchel", 0, /obj/item/storage/backpack/marine/satchel, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_RECOMMENDED),
		list("Shotgun Scabbard", 0, /obj/item/storage/large_holster/m37, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),

		list("CLOTHING ITEMS", 0, null, null, null),
		list("Drop Pouch", 15, /obj/item/clothing/accessory/storage/droppouch, null, VENDOR_ITEM_REGULAR),
		list("Shoulder Holster", 15, /obj/item/clothing/accessory/storage/holster, null, VENDOR_ITEM_REGULAR),
		list("Welding Goggles", 5, /obj/item/clothing/glasses/welding, null, VENDOR_ITEM_REGULAR),
		list("Sling Pouch", 15, /obj/item/storage/pouch/sling, null, VENDOR_ITEM_REGULAR),
		list("Large General Pouch", 15, /obj/item/storage/pouch/general/large, null, VENDOR_ITEM_REGULAR),

		list("BELT (CHOOSE 1)", 0, null, null, null),
		list("M276 Ammo Load Rig", 0, /obj/item/storage/belt/marine, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),
		list("M276 General Pistol Holster Rig", 0, /obj/item/storage/belt/gun/m4a3, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Knife Rig (Full)", 0, /obj/item/storage/belt/knifepouch, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M39 Holster Rig", 0, /obj/item/storage/belt/gun/m39, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 General Revolver Holster Rig", 0, /obj/item/storage/belt/gun/m44, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M82F Holster Rig", 0, /obj/item/storage/belt/gun/flaregun, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Shotgun Shell Loading Rig", 0, /obj/item/storage/belt/shotgun, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 G8-A General Utility Pouch", 0, /obj/item/storage/backpack/general_belt, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M40 Grenade Rig (Empty)", 0, /obj/item/storage/belt/grenade, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),

		list("POUCHES (CHOOSE 2)", 0, null, null, null),
		list("Bayonet Sheath (Full)", 0, /obj/item/storage/pouch/bayonet, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Individual First-Aid Kit (Tan)", 0, /obj/item/storage/ifak, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Individual First-Aid Kit (Black)", 0, /obj/item/storage/ifak/blk, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Flare Pouch (Full)", 0, /obj/item/storage/pouch/flare/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Small Document Pouch", 0, /obj/item/storage/pouch/document/small, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Magazine Pouch", 0, /obj/item/storage/pouch/magazine, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Shotgun Shell Pouch", 0, /obj/item/storage/pouch/shotgun, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medium General Pouch", 0, /obj/item/storage/pouch/general/medium, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Pistol Magazine Pouch", 0, /obj/item/storage/pouch/magazine/pistol, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Pistol Pouch", 0, /obj/item/storage/pouch/pistol, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),

		list("MASK (CHOOSE 1)", 0, null, null, null),
		list("Gas Mask", 0, /obj/item/clothing/mask/gas, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),
		list("Heat Absorbent Coif", 0, /obj/item/clothing/mask/rebreather/scarf, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),
		list("Rebreather", 0, /obj/item/clothing/mask/rebreather, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),

		list("HELMET OPTICS", 0, null, null, null),
		list("Medical Helmet Optic", 15, /obj/item/device/helmet_visor/medical, null, VENDOR_ITEM_REGULAR),
		list("Welding Visor", 5, /obj/item/device/helmet_visor/welding_visor, null, VENDOR_ITEM_REGULAR),

		list("RADIO KEYS", 0, null, null, null),
		list("Engineering Radio Encryption Key", 5, /obj/item/device/encryptionkey/engi, null, VENDOR_ITEM_REGULAR),
		list("Intel Radio Encryption Key", 5, /obj/item/device/encryptionkey/intel, null, VENDOR_ITEM_REGULAR),
		list("JTAC Radio Encryption Key", 5, /obj/item/device/encryptionkey/jtac, null, VENDOR_ITEM_REGULAR),
		list("Supply Radio Encryption Key", 5, /obj/item/device/encryptionkey/req, null, VENDOR_ITEM_REGULAR),
	))
