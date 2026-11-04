/datum/equipment_preset/other/stalker
	name = "S.T.A.L.K.E.R."
	paygrades = list(PAY_SHORT_STLK = JOB_PLAYTIME_TIER_0)
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "S.T.A.L.K.E.R."
	skills = /datum/skills/freelancer/SL
	languages = list(LANGUAGE_RUSSIAN, LANGUAGE_ENGLISH)
	faction = FACTION_SCAV

/datum/equipment_preset/other/stalker/New()
	. = ..()
	access = get_access(ACCESS_LIST_EMERGENCY_RESPONSE) //ACCESS_COME_BACK_TO_ME

/datum/equipment_preset/other/stalker/load_name(mob/living/carbon/human/new_human, randomise)
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

/datum/equipment_preset/other/stalker/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/other/stalker/load_gear(mob/living/carbon/human/new_human)

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

/datum/equipment_preset/other/stalker/elite
	name = "S.T.A.L.K.E.R. Elite"
	paygrades = list(PAY_SHORT_STLK = JOB_PLAYTIME_TIER_0)
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "S.T.A.L.K.E.R."
	skills = /datum/skills/freelancer
	languages = list(LANGUAGE_RUSSIAN, LANGUAGE_ENGLISH)
	faction = FACTION_SCAV

/datum/equipment_preset/other/stalker/elite/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/other/stalker/elite/load_gear(mob/living/carbon/human/new_human)

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
/datum/equipment_preset/synth/working_joe/scav
	name = "Synthetic - Scavin Joe"
	joe_type = SYNTH_UPP_JOE
	paygrades = list(PAY_SHORT_STLK = JOB_PLAYTIME_TIER_0)
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "S.T.A.L.K.E.R."
	faction = FACTION_SCAV

/datum/equipment_preset/synth/working_joe/scav/load_gear(mob/living/carbon/human/new_human)
	var/choice = rand(1,2)
	new_human.allow_gun_usage = TRUE
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/joe(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/joe(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/device/defibrillator/synthetic/seegson(new_human.back), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/stack/sheet/wood/large_stack(new_human.back), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/scavin_joe(new_human.back), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool/hugetank, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/extinguisher(new_human), WEAR_L_HAND)
	new_human.equip_to_slot_or_del(new /obj/item/maintenance_jack(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/webbing(new_human), WEAR_JACKET)

	switch(choice)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/synthetic/joe/engi(new_human), WEAR_BODY)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/synthetic/joe/engi/overalls(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/utility/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/sling(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/first_responder/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/working_joe_pda(new_human.back), WEAR_IN_L_STORE)
	new_human.equip_to_slot(new /obj/item/weapon/chloroform(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/storage/box/zipcuffs/small(new_human), WEAR_IN_BACK)

/datum/equipment_preset/synth/working_joe/scav/load_name(mob/living/carbon/human/new_human, randomise)
	var/nam_choice = rand(1,10)
	switch(nam_choice)
		if(1)
			new_human.change_real_name(new_human, "Scav'in Joe #[rand(100)][rand(100)]")
		if(2)
			new_human.change_real_name(new_human, "S.T.E.A.L. 'ing Joe #[rand(100)][rand(100)]")
		if(3)
			new_human.change_real_name(new_human, "Мусорщик Джо #[rand(100)][rand(100)]")
		if(4)
			new_human.change_real_name(new_human, "Working Joey #[rand(100)][rand(100)]")
		if(5)
			new_human.change_real_name(new_human, "Johnathan Freeman #[rand(10)]")
		if(6)
			new_human.change_real_name(new_human, "Robbin' Joe #[rand(100)][rand(100)]")
		if(7)
			new_human.change_real_name(new_human, "Sticky Fingers Steve #[rand(100)][rand(100)]")
		if(8)
			new_human.change_real_name(new_human, "Plunderin Pete #[rand(100)][rand(100)]")
		if(9)
			new_human.change_real_name(new_human, "Dopey Dave #[rand(100)][rand(100)]")
		if(10)
			new_human.change_real_name(new_human, "блять Bot #[rand(100)][rand(100)]")

//*****************************************************************************************************/
