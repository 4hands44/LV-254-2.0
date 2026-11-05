/datum/equipment_preset/diamond_dog
	name = "Diamond Dog"
	paygrades = list(PAY_SHORT_FL_S = JOB_PLAYTIME_TIER_0)
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "Merc"
	skills = /datum/skills/rifleman
	languages = list(LANGUAGE_ENGLISH)
	faction = FACTION_DIAMOND_DOG
	idtype = /obj/item/card/id/dogtag

/datum/equipment_preset/diamond_dog/New()
	. = ..()
	access = get_access(ACCESS_LIST_EMERGENCY_RESPONSE) //ACCESS_COME_BACK_TO_ME

/datum/equipment_preset/diamond_dog/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(80;MALE,20;FEMALE)
	var/datum/preferences/A = new()
	A.randomize_appearance(new_human)
	var/random_name
	if(new_human.gender == MALE)
		random_name = "[pick(GLOB.first_names_male_upp)] [pick(GLOB.last_names_upp)]"
		new_human.f_style = "7 O'clock Shadow"
	else
		random_name = "[pick(GLOB.first_names_female_upp)] [pick(GLOB.last_names_upp)]"
	new_human.change_real_name(new_human, random_name)
	new_human.age = rand(20,45)
	new_human.r_hair = 25
	new_human.g_hair = 25
	new_human.b_hair = 35

/datum/equipment_preset/diamond_dog/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/diamond_dog/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/diamond_dog(new_human), WEAR_BODY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/brown(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack(new_human), WEAR_BACK)



	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/windbreaker/windbreaker_brown(new_human), WEAR_JACKET)

//gun
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/np92(new_human), WEAR_WAIST)
//gear
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/civ(new_human), WEAR_IN_BACK)

//*****************************************************************************************************/

/datum/equipment_preset/diamond_dog/snake
	name = "Snake"
	paygrades = list(PAY_SHORT_FL_S = JOB_PLAYTIME_TIER_0)
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "Merc"
	skills = /datum/skills/commander
	languages = list(LANGUAGE_ENGLISH)
	faction = FACTION_DIAMOND_DOG

/datum/equipment_preset/diamond_dog/snake/New()
	. = ..()
	access = get_access(ACCESS_LIST_EMERGENCY_RESPONSE) //ACCESS_COME_BACK_TO_ME

/datum/equipment_preset/diamond_dog/snake/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = MALE
	new_human.change_real_name(new_human, "Snake")
	new_human.f_style = "Full Beard"
	new_human.h_style = "Ponytail, Rough"

	new_human.age = 38
	new_human.r_hair = 76
	new_human.g_hair = 54
	new_human.b_hair = 33
	new_human.r_facial = 76
	new_human.g_facial = 54
	new_human.b_facial = 33
	new_human.r_eyes = 0
	new_human.g_eyes = 0
	new_human.b_eyes = 0
	idtype = /obj/item/card/id/dogtag

/datum/equipment_preset/diamond_dog/snake/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/diamond_dog/snake/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/diamond_dog(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/webbing/diamond_dog/black(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/insulated/black(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/headband/gray(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/eyepatch(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine(new_human), WEAR_FEET)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/health/ceramic_plate(new_human), WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack(new_human), WEAR_BACK)

//pistol
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster/armpit(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/np92/suppressed/tranq(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/np92/tranq(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/np92/tranq(new_human), WEAR_IN_ACCESSORY)
//rifle
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/kramer/sec(new_human), WEAR_IN_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/kramer/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/kramer/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/kramer/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/kramer/ap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/kramer/ap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/kramer/ap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/kramer/ap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/kramer/ap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/kramer/ap(new_human), WEAR_IN_JACKET)
//gear
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/civ(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/health/ceramic_plate(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/health/ceramic_plate(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/health/ceramic_plate(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/stack/fulton(new_human), WEAR_IN_BACK)
//*****************************************************************************************************/
