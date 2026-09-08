/datum/equipment_preset/tagrilla
	name = "Factory Boss"
	paygrades = list(PAY_SHORT_CIV = JOB_PLAYTIME_TIER_0)
	assignment = JOB_TAGRILLA
	flags = EQUIPMENT_PRESET_EXTRA

	skills = /datum/skills/tagrilla
	idtype = /obj/item/card/id/dogtag
	minimap_icon = "surv"

/datum/equipment_preset/tagrilla/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = MALE
	new_human.change_real_name(new_human, "Psychotically Angry Man")
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

/datum/equipment_preset/tagrilla/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/welding/tagrilla(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/tagrilla(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/tagrilla(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/tagrilla(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/grey/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/sling/sledge/tagrilla/full(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/armband/bandage, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/ak4047/tagrilla(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ak4047/ap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ak4047/ap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ak4047/ap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ak4047(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ak4047(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ak4047(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/upp(new_human), WEAR_R_STORE)

	new_human.set_species("Lesser Human Hero") //Tagrilla is STRONG.

	to_chat(new_human, SPAN_WARNING("You are the Factory Boss, infamously angry and psychotic. You are armed with your AK4047 and your trusty sledgehammer, use both wisely with your other gear to kill any in your path!"))
