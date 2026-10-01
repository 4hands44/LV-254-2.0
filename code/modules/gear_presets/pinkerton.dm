/datum/equipment_preset/other/pinkerton
	name = "pinkerton"
	faction = FACTION_PINKERTON
	rank = JOB_PKT
	idtype = /obj/item/card/id/pkt
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_SPANISH)
	minimap_background = "background_cmb"

/datum/equipment_preset/other/pinkerton/New()
	. = ..()
	access = get_access(ACCESS_LIST_PINKERTON) //access to marine and Wey-Yu brig and public areas, and all Colonial areas

/datum/equipment_preset/other/pinkerton/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(60;MALE,40;FEMALE)
	var/datum/preferences/A = new()
	A.randomize_appearance(new_human)
	var/random_name
	if(new_human.gender == MALE)
		random_name = "[pick(GLOB.first_names_male_colonist)] [pick(GLOB.last_names_colonist)]"
		new_human.f_style = "5 O'clock Shadow"
	else
		random_name = "[pick(GLOB.first_names_female_colonist)] [pick(GLOB.last_names_colonist)]"
	new_human.change_real_name(new_human, random_name)
	new_human.age = rand(20,45)
	new_human.r_hair = 25
	new_human.g_hair = 25
	new_human.b_hair = 35

//*****************************************************************************************************/

//standard

/datum/equipment_preset/other/pinkerton/standard
	name = "pinkerton security officer(Standard)"
	assignment = JOB_PKT
	rank = JOB_PKT
	paygrades = list(PAY_SHORT_PKT = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Opr."
	skills = /datum/skills/cmb
	flags = EQUIPMENT_PRESET_EXTRA

/datum/equipment_preset/other/pinkerton/standard/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pinkerton, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs, WEAR_R_EAR)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/pinkerton_tshirt, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/pinkerton_patch/large, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/light/vest/pinkerton, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/veteran/pmc/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pinkerton, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud, WEAR_EYES)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/swat, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/flashbang, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/flashbang, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/flashbang, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/flashbang, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/custom/teargas, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/zipcuffs/small, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/fsr, WEAR_IN_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/tactical/sec/full, WEAR_R_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster/armpit, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/revolver/cmb/slugger, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/cmb/slugger, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/cmb/slugger, WEAR_IN_ACCESSORY)

	if(prob(35))
		new_human.equip_to_slot_or_del(new/obj/item/storage/belt/marine, WEAR_WAIST)
		spawn_weapon(/obj/item/weapon/gun/rifle/kramer/sec, /obj/item/ammo_magazine/rifle/kramer/ap, new_human)
	if(prob(40))
		new_human.equip_to_slot_or_del(new /obj/item/storage/belt/shotgun/full/random, WEAR_WAIST)
		new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/pump/dual_tube/cmb/m3717, WEAR_R_HAND)
	else
		new_human.equip_to_slot_or_del(new/obj/item/storage/belt/marine, WEAR_WAIST)
		spawn_weapon(/obj/item/weapon/gun/rifle/l42a/sec, /obj/item/ammo_magazine/rifle/l42a/ap, new_human)



//team lead

/datum/equipment_preset/other/pinkerton/team_lead
	name = "pinkerton team leader(Standard)"
	assignment = JOB_PKT_TL
	rank = JOB_PKT_TL
	idtype = /obj/item/card/id/pktl
	paygrades = list(PAY_SHORT_PKT_TL = JOB_PLAYTIME_TIER_0)
	role_comm_title = "TL"
	skills = /datum/skills/cmb/leader
	flags = EQUIPMENT_PRESET_EXTRA

/datum/equipment_preset/other/pinkerton/team_lead/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pinkerton, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs, WEAR_R_EAR)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/pinkerton_tshirt, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/pinkerton_patch/large, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/light/vest/pinkerton, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/veteran/pmc/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pinkerton/sl, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud, WEAR_EYES)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/swat, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/flashbang, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/flashbang, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/flashbang, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/flashbang, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/custom/teargas, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/zipcuffs/small, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/fsr, WEAR_IN_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/tactical/sec/full, WEAR_R_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster/armpit, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/revolver/cmb/slugger, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/cmb/slugger, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/cmb/slugger, WEAR_IN_ACCESSORY)

	if(prob(25))
		new_human.equip_to_slot_or_del(new/obj/item/storage/belt/marine, WEAR_WAIST)
		spawn_weapon(/obj/item/weapon/gun/rifle/sa80/ugl/rifleman/sec, /obj/item/ammo_magazine/rifle/sa80/ap, new_human)
	else
		new_human.equip_to_slot_or_del(new/obj/item/storage/belt/marine, WEAR_WAIST)
		spawn_weapon(/obj/item/weapon/gun/rifle/kramer/sec, /obj/item/ammo_magazine/rifle/kramer/ap, new_human)

//director

/datum/equipment_preset/other/pinkerton/director
	name = "pinkerton site director"
	assignment = JOB_PKT_CO
	rank = JOB_PKT_CO
	idtype = /obj/item/card/id/pktco
	paygrades = list(PAY_SHORT_PKT_CO = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Dir."
	skills = /datum/skills/cmb/leader
	flags = EQUIPMENT_PRESET_EXTRA

/datum/equipment_preset/other/pinkerton/director/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pinkerton, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs, WEAR_R_EAR)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/pinkerton_tshirt, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/pinkerton_patch/small, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/light/vest/pinkerton, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/veteran/pmc/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/pinkerton, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud, WEAR_EYES)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/lockable, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/swat, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/flashbang, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/flashbang, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/fsr, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/tactical/sec/full, WEAR_R_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster/armpit, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/revolver/cmb/slugger, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/cmb/slugger, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/cmb/slugger, WEAR_IN_ACCESSORY)

	new_human.equip_to_slot_or_del(new/obj/item/storage/belt/marine, WEAR_WAIST)
	spawn_weapon(/obj/item/weapon/gun/rifle/sa80/ugl/rifleman/sec, /obj/item/ammo_magazine/rifle/sa80/ap, new_human)

//detective

/datum/equipment_preset/other/pinkerton/detective
	name = "pinkerton Private Investigator"
	assignment = JOB_PKT_DET
	rank = JOB_PKT_DET
	idtype = /obj/item/card/id/pktco
	paygrades = list(PAY_SHORT_PKT_DET = JOB_PLAYTIME_TIER_0)
	role_comm_title = "PI."
	skills = /datum/skills/cmb
	flags = EQUIPMENT_PRESET_EXTRA

/datum/equipment_preset/other/pinkerton/detective/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pinkerton, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs, WEAR_R_EAR)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/detective, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/pinkerton_patch/small, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/service/detective_trenchcoat, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup/brown, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/fedora, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/cigarette, WEAR_FACE)

	new_human.equip_to_slot_or_del(new /obj/item/tool/lighter/zippo, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/fancy/cigarettes/lucky_strikes, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/notepad, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/tool/pen, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/lockable, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/tactical/sec/full, WEAR_R_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/device/flashlight, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/device/clue_scanner, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crew_monitor, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/zipcuffs/small, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/fsr, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/camera, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/camera_film, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/taperecorder, WEAR_IN_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster/armpit, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/revolver/m44/custom, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/marksman, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/marksman, WEAR_IN_ACCESSORY)

//medic

/datum/equipment_preset/other/pinkerton/emt
	name = "pinkerton paramedic"
	assignment = JOB_PKT_MED
	rank = JOB_PKT_MED
	idtype = /obj/item/card/id/pkt
	paygrades = list(PAY_SHORT_PKT = JOB_PLAYTIME_TIER_0)
	role_comm_title = "EMT"
	skills = /datum/skills/cmb/medic
	flags = EQUIPMENT_PRESET_EXTRA

/datum/equipment_preset/other/pinkerton/emt/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pinkerton, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs, WEAR_R_EAR)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/pinkerton_tshirt, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/pinkerton_patch/large, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/light/vest/pinkerton, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/veteran/pmc/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pinkerton, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud, WEAR_EYES)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/tactical/sec/full, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/full/with_defib_and_analyzer(new_human), WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/surgical(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/swat, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/fsr, WEAR_IN_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/roller/surgical(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/surgical_line, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft, WEAR_IN_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster/armpit, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/revolver/cmb/slugger, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/cmb/slugger, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/cmb/slugger, WEAR_IN_ACCESSORY)

	spawn_weapon(/obj/item/weapon/gun/smg/m39, /obj/item/ammo_magazine/smg/m39/ap, new_human)

//engi

/datum/equipment_preset/other/pinkerton/engi
	name = "pinkerton sec-tech specialist"
	assignment = JOB_PKT_ENG
	rank = JOB_PKT_ENG
	idtype = /obj/item/card/id/pkt
	paygrades = list(PAY_SHORT_PKT = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Tech"
	skills = /datum/skills/cmb/engi
	flags = EQUIPMENT_PRESET_EXTRA

/datum/equipment_preset/other/pinkerton/engi/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pinkerton, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs, WEAR_R_EAR)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/pinkerton_tshirt, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/pinkerton_patch/large, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/light/vest/pinkerton, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/veteran/pmc/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pinkerton, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/hack_goggles, WEAR_EYES)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/jima, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/stack/concertina_wire, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/stack/sheet/metal/large_stack, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/stack/sheet/metal/large_stack, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/motiontracker/adv/hacked/pkt, WEAR_L_HAND)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/tactical/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/fsr, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/uav_drone, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster/armpit, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/revolver/cmb/slugger, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/cmb/slugger, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/cmb/slugger, WEAR_IN_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/shotgun/full/random, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/pump/dual_tube/cmb/m3717, WEAR_R_HAND)

/datum/equipment_preset/synth/pinkerton
	name = "Pinkerton Synthetic"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_PINKERTON
	assignment = JOB_PKT_SYN
	rank = JOB_PKT_SYN
	role_comm_title = "Syn"
	skills = /datum/skills/synthetic/cmb
	idtype = /obj/item/card/id/lanyard
	paygrades = list(PAY_SHORT_PKT  = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/synth/pinkerton/New()
	. = ..()
	access = get_access(ACCESS_LIST_PINKERTON)

/datum/equipment_preset/synth/pinkerton/load_gear(mob/living/carbon/human/new_human)
	new_human.allow_gun_usage = TRUE

	if(prob(50))
		new_human.gender = MALE
		new_human.change_real_name(new_human, "Connor")
	else
		new_human.gender = FEMALE
		new_human.change_real_name(new_human, "Kara")

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pinkerton, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs, WEAR_R_EAR)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/pinkerton_tshirt, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/pinkerton_patch/large, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/light/vest/pinkerton, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/veteran/pmc/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pinkerton, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud, WEAR_EYES)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/defibrillator/synthetic, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/zipcuffs/small, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/tactical/sec/full, WEAR_R_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster/armpit, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/revolver/cmb/slugger, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/cmb/slugger, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/cmb/slugger, WEAR_IN_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/full/with_defib_and_analyzer(new_human), WEAR_WAIST)

//standard - RIOT

/datum/equipment_preset/other/pinkerton/riot
	name = "pinkerton security officer(Riot)"
	assignment = JOB_PKT
	rank = JOB_PKT
	paygrades = list(PAY_SHORT_PKT = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Opr."
	skills = /datum/skills/cmb
	flags = EQUIPMENT_PRESET_EXTRA

/datum/equipment_preset/other/pinkerton/riot/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pinkerton, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs, WEAR_R_EAR)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/pinkerton_jumpsuit, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/pinkerton_patch, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/ua_riot/pinkerton, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/veteran/pmc/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pinkerton/riot, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud, WEAR_EYES)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/shield/riot(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/swat, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/custom/teargas, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/custom/teargas, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/custom/teargas, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/custom/teargas, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/tactical/sec/full, WEAR_R_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster/armpit, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/revolver/cmb/slugger, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/cmb/slugger, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/cmb/slugger, WEAR_IN_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/shotgun/riot, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/combat/riot, WEAR_R_HAND)

//team lead - RIOT

/datum/equipment_preset/other/pinkerton/riot_team_lead
	name = "pinkerton team leader(Riot)"
	assignment = JOB_PKT_TL
	rank = JOB_PKT_TL
	idtype = /obj/item/card/id/pktl
	paygrades = list(PAY_SHORT_PKT_TL = JOB_PLAYTIME_TIER_0)
	role_comm_title = "TL"
	skills = /datum/skills/cmb/leader
	flags = EQUIPMENT_PRESET_EXTRA

/datum/equipment_preset/other/pinkerton/riot_team_lead/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pinkerton, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs, WEAR_R_EAR)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/pinkerton_jumpsuit, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/pinkerton_patch, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/ua_riot/pinkerton, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/veteran/pmc/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pinkerton/riot, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud, WEAR_EYES)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/shield/riot(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/swat, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/custom/teargas, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/tactical/sec/full, WEAR_R_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster/armpit, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/revolver/cmb/slugger, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/cmb/slugger, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/cmb/slugger, WEAR_IN_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/shotgun/riot, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/combat/riot, WEAR_R_HAND)

//standard - death squad

/datum/equipment_preset/other/pinkerton/death
	name = "pinkerton strikebreaker (DEATHSQUAD)"
	assignment = JOB_PKT
	rank = JOB_PKT
	paygrades = list(PAY_SHORT_PKT = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Opr."
	skills = /datum/skills/cmb
	flags = EQUIPMENT_PRESET_EXTRA

/datum/equipment_preset/other/pinkerton/death/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pinkerton, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs, WEAR_R_EAR)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/pinkerton_jumpsuit, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/pinkerton_patch, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/ua_riot/pinkerton, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/veteran/pmc/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pinkerton/riot, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud, WEAR_EYES)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/shield/riot/ballistic/uscm(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/swat, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/custom/teargas, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/custom/teargas, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/custom/teargas, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/custom/teargas, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/tactical/sec/full, WEAR_R_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster/armpit, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/revolver/cmb/slugger, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/cmb/slugger, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/cmb/slugger, WEAR_IN_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/minigun, WEAR_R_HAND)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/minigun, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/minigun, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/minigun, WEAR_IN_BELT)

//team lead - deathsquad

/datum/equipment_preset/other/pinkerton/death_team_lead
	name = "pinkerton strikebreaker team leader(DEATHSQUAD)"
	assignment = JOB_PKT_TL
	rank = JOB_PKT_TL
	idtype = /obj/item/card/id/pktl
	paygrades = list(PAY_SHORT_PKT_TL = JOB_PLAYTIME_TIER_0)
	role_comm_title = "TL"
	skills = /datum/skills/cmb/leader
	flags = EQUIPMENT_PRESET_EXTRA

/datum/equipment_preset/other/pinkerton/death_team_lead/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pinkerton, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs, WEAR_R_EAR)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/pinkerton_jumpsuit, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/pinkerton_patch, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/ua_riot/pinkerton, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/veteran/pmc/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pinkerton/riot, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud, WEAR_EYES)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/shield/riot/ballistic/uscm(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/swat, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/custom/teargas, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/tactical/sec/full, WEAR_R_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster/armpit, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/revolver/cmb/slugger, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/cmb/slugger, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/cmb/slugger, WEAR_IN_ACCESSORY)


	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/minigun, WEAR_R_HAND)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/minigun, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/minigun, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/minigun, WEAR_IN_BELT)
