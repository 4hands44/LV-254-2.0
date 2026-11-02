/datum/equipment_preset/uscm/geared_specialist
	name = "USCM Specialist(Cryo)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE

	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_SPECPREP)
	assignment = JOB_SQUAD_MARINE
	rank = JOB_SQUAD_MARINE
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	paygrades = list(PAY_SHORT_ME2)
	role_comm_title = "Spc"
	skills = /datum/skills/rifleman

	minimap_icon = "spec"
	dress_under = list(/obj/item/clothing/under/marine/dress/blues)
	dress_over = list(/obj/item/clothing/suit/storage/jacket/marine/dress/blues)

/datum/equipment_preset/uscm/geared_specialist/load_status(mob/living/carbon/human/new_human)
	return //No cryo munchies

//*****************************************************************************************************/

/datum/equipment_preset/uscm/geared_specialist/b18
	name = "USCM Specialist (B18 Armor)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE

/datum/equipment_preset/uscm/geared_specialist/b18/load_gear(mob/living/carbon/human/new_human)

//clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/cryo(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
//accessory
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest/brown_vest(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/health/ceramic_plate(new_human), WEAR_ACCESSORY)
//armor
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/specialist(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/specialist(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/specialist(new_human), WEAR_HEAD)
//gear
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/m42_night_goggles(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_FACE)
//storage
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/squad(new_human), WEAR_BACK)
//items
	new_human.equip_to_slot_or_del(new /obj/item/device/motiontracker/adv, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/ifak(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/high_explosive(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/high_explosive(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/health/ceramic_plate(new_human), WEAR_IN_BACK)
//vest items
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_JACKET)
//--weapons--\\

//primary
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/combat(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful(new_human), WEAR_IN_ACCESSORY)
//secondary
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/dual_pistol/vp78m6_b18(new_human), WEAR_WAIST)
//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/smoke(new_human), WEAR_R_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/uscm/geared_specialist/scout
	name = "USCM Specialist (Scout)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE

/datum/equipment_preset/uscm/geared_specialist/scout/load_gear(mob/living/carbon/human/new_human)
//clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/cryo(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
//accessory
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster/armpit(new_human), WEAR_ACCESSORY)
//armor
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/scout(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/M3S(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/M4RA(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/black(new_human), WEAR_FACE)
//storage
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/scout_cloak(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/large_holster/machete/full(new_human), WEAR_WAIST)
//items
	new_human.equip_to_slot_or_del(new /obj/item/device/motiontracker/adv(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/bodybag/tarp/reactive/scout(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/high_explosive(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/ifak(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic(new_human), WEAR_IN_BACK)
//vest items
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range/designator/scout(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/encryptionkey/jtac(new_human), WEAR_IN_JACKET)
//weapon
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp78/vp78m6(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp78(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp78(new_human), WEAR_IN_ACCESSORY)
//rifle
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m4ra_custom/attachies(new_human), WEAR_J_STORE)
//R
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/custom(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/custom(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/custom(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/custom(new_human), WEAR_IN_R_STORE)
//L
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/custom/incendiary(new_human), WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/custom/incendiary(new_human), WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/custom/impact(new_human), WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/custom/impact(new_human), WEAR_IN_L_STORE)
	GLOB.character_traits[/datum/character_trait/skills/spotter].apply_trait(new_human)

//*****************************************************************************************************/

/datum/equipment_preset/uscm/geared_specialist/sniper
	name = "USCM Specialist (Sniper)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE

/datum/equipment_preset/uscm/geared_specialist/sniper/load_gear(mob/living/carbon/human/new_human)
//clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/cryo(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf(new_human), WEAR_FACE)
//accessory
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest/brown_vest(new_human), WEAR_ACCESSORY)
//armor
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/ghillie(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/ghillie(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/m42_night_goggles(new_human), WEAR_EYES)
//storage
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/squad(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/ifak(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/smoke(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/dual_pistol/vp78m6(new_human), WEAR_WAIST)
//items
	new_human.equip_to_slot_or_del(new /obj/item/device/motiontracker/adv, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller/bedroll(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/high_explosive(new_human), WEAR_IN_BACK)
//vest items
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range/designator(new_human), WEAR_IN_ACCESSORY)
//weapon
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/sniper/M42A(new_human), WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/incendiary(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/incendiary(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/flak(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/flak(new_human), WEAR_IN_JACKET)
	GLOB.character_traits[/datum/character_trait/skills/spotter].apply_trait(new_human)

//*****************************************************************************************************/

/datum/equipment_preset/uscm/geared_specialist/spotter
	name = "USCM Specialist (Spotter)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE

/datum/equipment_preset/uscm/geared_specialist/spotter/load_gear(mob/living/carbon/human/new_human)
//clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/cryo(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf(new_human), WEAR_FACE)
//accessory
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest/brown_vest(new_human), WEAR_ACCESSORY)
//armor
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/ghillie(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/ghillie(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/m42_night_goggles(new_human), WEAR_EYES)
//storage
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/rto(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/ifak(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/smoke(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m39/heap(new_human), WEAR_WAIST)
//items
	new_human.equip_to_slot_or_del(new /obj/item/device/motiontracker/adv, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller/bedroll(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/high_explosive(new_human), WEAR_IN_BACK)
//vest items
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range/designator/spotter(new_human), WEAR_IN_ACCESSORY)
//weapon
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m4ra/tactical(new_human), WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/heap(new_human), WEAR_IN_JACKET)
	GLOB.character_traits[/datum/character_trait/skills/spotter].apply_trait(new_human)

//*****************************************************************************************************/

/datum/equipment_preset/uscm/geared_specialist/sadar
	name = "USCM Specialist (SADAR)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE

/datum/equipment_preset/uscm/geared_specialist/sadar/load_gear(mob/living/carbon/human/new_human)
//clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/cryo(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
//accessory
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest/brown_vest(new_human), WEAR_ACCESSORY)
//armor
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/M3T(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/M3T(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/mgoggles(new_human), WEAR_IN_HELMET)
//storage
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/rocketpack(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/ifak(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/C4(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m39/heap(new_human), WEAR_WAIST)
//items
	new_human.equip_to_slot_or_del(new /obj/item/roller/bedroll(new_human), WEAR_IN_JACKET)
//vest items
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars(new_human), WEAR_IN_ACCESSORY)
//weapon
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/launcher/rocket/m5(new_human), WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket/frag(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket/frag(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket/ap(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket/ap(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket/wp(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket/wp(new_human), WEAR_IN_BACK)


	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/heap(new_human), WEAR_IN_JACKET)

//*****************************************************************************************************/

/datum/equipment_preset/uscm/geared_specialist/loader
	name = "USCM Specialist (SADAR Loader)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE

/datum/equipment_preset/uscm/geared_specialist/loader/load_gear(mob/living/carbon/human/new_human)
//clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/cryo(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
//accessory
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest/brown_vest(new_human), WEAR_ACCESSORY)
//armor
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/M3T(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/M3T(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/mgoggles(new_human), WEAR_IN_HELMET)
//storage
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/rocketpack(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/ifak(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/sling(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/utility/spec(new_human), WEAR_WAIST)
//items
	new_human.equip_to_slot_or_del(new /obj/item/roller/bedroll(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/motiontracker/adv(new_human), WEAR_IN_R_STORE)
//vest items
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars(new_human), WEAR_IN_ACCESSORY)
//weapon

//spare rockets
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket/frag(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket/frag(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket/ap(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket/ap(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket/wp(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket/wp(new_human), WEAR_IN_BACK)

//primary
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/combat(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful(new_human), WEAR_IN_JACKET)


//*****************************************************************************************************/

/datum/equipment_preset/uscm/geared_specialist/pig
	name = "USCM Specialist (PIG Operator)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE

/datum/equipment_preset/uscm/geared_specialist/pig/load_gear(mob/living/carbon/human/new_human)
//clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/cryo(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
//accessory
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest/brown_vest(new_human), WEAR_ACCESSORY)
//armor
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/M3T(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/M3T(new_human), WEAR_JACKET)
//storage
	new_human.equip_to_slot_or_del(new /obj/item/storage/ifak(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/utility/spec(new_human), WEAR_WAIST)
//vest items
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_IN_ACCESSORY)
//weapon
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large/mk1_heap(new_human), WEAR_R_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/pig_backpack(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/heavygun_battery(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/heavygun_battery(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/m78_pig(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/m78_pig(new_human), WEAR_IN_JACKET)

//*****************************************************************************************************/

/datum/equipment_preset/uscm/geared_specialist/pig_loader
	name = "USCM Specialist (PIG Loader)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE

/datum/equipment_preset/uscm/geared_specialist/pig_loader/load_gear(mob/living/carbon/human/new_human)
//clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/cryo(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
//accessory
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest/brown_vest(new_human), WEAR_ACCESSORY)
//armor
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/M3T(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/M3T(new_human), WEAR_JACKET)
//storage
	new_human.equip_to_slot_or_del(new /obj/item/storage/ifak(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/utility/spec(new_human), WEAR_WAIST)
//vest items
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_IN_ACCESSORY)
//weapon
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large/mk1_heap(new_human), WEAR_R_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/heavygun_battery(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/heavygun_battery(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/m78_pig(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/m78_pig(new_human), WEAR_IN_JACKET)

//*****************************************************************************************************/

/datum/equipment_preset/uscm/geared_specialist/grenadier
	name = "USCM Specialist (Grenadier)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE

/datum/equipment_preset/uscm/geared_specialist/grenadier/load_gear(mob/living/carbon/human/new_human)
//clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/cryo(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
//accessory
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster/armpit(new_human), WEAR_ACCESSORY)
//armor
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/M3G(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/grenadier(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/M3G(new_human), WEAR_JACKET)
//storage
	new_human.equip_to_slot_or_del(new /obj/item/storage/ifak(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m39/heap(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/grenade/large/full(new_human), WEAR_BACK)
//weapon
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/launcher/grenade/m92(new_human), WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp78/vp78m6(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp78(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp78(new_human), WEAR_IN_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_IN_JACKET)

//*****************************************************************************************************/

/datum/equipment_preset/uscm/geared_specialist/pyro
	name = "USCM Specialist (Pyro)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE

/datum/equipment_preset/uscm/geared_specialist/pyro/load_gear(mob/living/carbon/human/new_human)
//clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/cryo(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
//accessory
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest/brown_vest(new_human), WEAR_ACCESSORY)
//armor
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/M3G(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/pyro(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/M35(new_human), WEAR_JACKET)
//storage
	new_human.equip_to_slot_or_del(new /obj/item/storage/ifak(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/utility/spec(new_human), WEAR_WAIST)
//vest items
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_IN_ACCESSORY)
//weapon
	new_human.equip_to_slot_or_del(new /obj/item/storage/large_holster/fuelpack(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/flamer/M240T/auto(new_human), WEAR_IN_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flamertank(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/flamer_tank/large(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/tool/extinguisher(new_human), WEAR_IN_R_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/heap(new_human), WEAR_IN_JACKET)

//*****************************************************************************************************/

/datum/equipment_preset/uscm/geared_specialist/sharp
	name = "USCM Specialist (SHARP gunner)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE

/datum/equipment_preset/uscm/geared_specialist/sharp/load_gear(mob/living/carbon/human/new_human)
//clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/cryo(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
//accessory
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster/armpit(new_human), WEAR_ACCESSORY)
//armor
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/grenadier(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/M3G(new_human), WEAR_JACKET)
//storage
	new_human.equip_to_slot_or_del(new /obj/item/storage/ifak(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/sharp(new_human), WEAR_WAIST)
//jacket
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_IN_JACKET)
//weapon
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large/mk1_heap(new_human), WEAR_R_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/sharp(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/sharp/explosive(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/sharp/explosive(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/sharp/explosive(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/sharp/explosive(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/sharp/flechette(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/sharp/flechette(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/sharp/incendiary(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/sharp/incendiary(new_human), WEAR_IN_BELT)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp78/vp78m6(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp78(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp78(new_human), WEAR_IN_ACCESSORY)
