/datum/equipment_preset/other/iron_bear
	name = "Iron Bear PMC"
	paygrades = list(PAY_SHORT_STLK = JOB_PLAYTIME_TIER_0)
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "Iron Bear"
	skills = /datum/skills/freelancer/SL
	languages = list(LANGUAGE_RUSSIAN, LANGUAGE_ENGLISH)
	faction = FACTION_WAGNER

/datum/equipment_preset/other/iron_bear/New()
	. = ..()
	access = get_access(ACCESS_LIST_EMERGENCY_RESPONSE) //ACCESS_COME_BACK_TO_ME

/datum/equipment_preset/other/iron_bear/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(80;MALE,20;FEMALE)
	var/datum/preferences/A = new()
	A.randomize_appearance(new_human)
	var/random_name
	if(new_human.gender == MALE)
		random_name = "[pick(GLOB.first_names_male_upp)] [pick(GLOB.last_names_upp)]"
		new_human.f_style = "5 O'clock Shadow"
	else
		random_name = "[pick(GLOB.first_names_female_upp)] [pick(GLOB.last_names_upp)]"
	new_human.change_real_name(new_human, random_name)
	new_human.age = rand(20,45)
	new_human.r_hair = 25
	new_human.g_hair = 25
	new_human.b_hair = 35

/datum/equipment_preset/other/iron_bear/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/other/iron_bear/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/windbreaker/windbreaker_brown(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/ushanka(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/brown(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack(new_human), WEAR_BACK)
//gun
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/np92(new_human), WEAR_WAIST)
//gear
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/survival/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/civ(new_human), WEAR_IN_BACK)

//*****************************************************************************************************/

/datum/equipment_preset/other/iron_bear/elite
	name = "Iron Bear PMC 2"
	paygrades = list(PAY_SHORT_STLK = JOB_PLAYTIME_TIER_0)
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "Iron Bear
	skills = /datum/skills/freelancer
	languages = list(LANGUAGE_RUSSIAN, LANGUAGE_ENGLISH)
	faction = FACTION_WAGNER

/datum/equipment_preset/other/iron_bear/elite/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/other/iron_bear/elite/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/webbing(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/royal_marine(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/brown(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/ushanka(new_human), WEAR_HEAD)
//gun
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/np92(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/ak4047/scav(new_human), WEAR_R_HAND)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ak4047/ap(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ak4047/ap(new_human), WEAR_IN_BACK)
//gear
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/survival/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/civ(new_human), WEAR_IN_BACK)

//*****************************************************************************************************
