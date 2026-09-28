/datum/equipment_preset/mr_tracksuit
	name = "Mr Tracksuit(Warlord)"
	paygrades = list(PAY_SHORT_CIV = JOB_PLAYTIME_TIER_0)
	assignment = JOB_MR_TRACKSUIT
	flags = EQUIPMENT_PRESET_EXTRA
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_RUSSIAN)
	faction = FACTION_UPP // change later to unique so he can have better emote sounds

	skills = /datum/skills/tagrilla
	idtype = /obj/item/card/id/dogtag
	minimap_icon = "surv"

/datum/equipment_preset/mr_tracksuit/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = MALE
	new_human.change_real_name(new_human, "Mr. Tracksuit")
	new_human.f_style = "7 O'clock Shadow"
	new_human.h_style = "Crewcut"
	new_human.undershirt = "None"

	new_human.age = 32
	new_human.r_hair = 19
	new_human.g_hair = 6
	new_human.b_hair = 0
	new_human.r_eyes = 0
	new_human.g_eyes = 31
	new_human.b_eyes = 77
	idtype = /obj/item/card/id/dogtag

/datum/equipment_preset/mr_tracksuit/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/welding/killer(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/killer(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/killer(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/grey/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/np92(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/upp(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/upp(new_human), WEAR_IN_ACCESSORY)
	spawn_random_mr_tracksuit_loadout(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medical/scav_boss(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar(new_human), WEAR_R_STORE)

	new_human.set_species("Tagrilla")

	to_chat(new_human, SPAN_WARNING("You are Mr Tracksuit, infamous for your love of adidas, malls and machineguns. You are the anvil to your brother, The factory boss's hammer. You have pretty bad aim though, so you prefer to rush your foes and magdump with LMGs. Your tough exterior and near immunity to pain make you hard to put down, use this and the rest of your gear to your advantage to kill those against you!"))
