/datum/equipment_preset/upp/ivan
	name = "Crazy Ivan(Warlord)"
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_UE6 = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/everything
	assignment = "UPP Armsmaster"
	rank = "UPP Armsmaster"
	role_comm_title = null
	faction = FACTION_WARLORD // For Only NAMED Boss Type characters

	minimap_icon = "surv"

/datum/equipment_preset/upp/ivan/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = MALE
	new_human.change_real_name(new_human, "Ivan")
	new_human.f_style = "Shaved"
	new_human.h_style = "Shaved Head"
	new_human.skin_color = "pale3"
	new_human.r_hair = 165
	new_human.g_hair = 42
	new_human.b_hair = 42

/datum/equipment_preset/upp/ivan/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/ivan, WEAR_BACK)
	//back filled with random guns, it's awesome
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP, WEAR_L_EAR)
	//body + webbing
	var/obj/item/clothing/under/marine/veteran/UPP/UPP = new()
	var/obj/item/clothing/accessory/storage/webbing/W = new()
	UPP.attach_accessory(new_human, W)
	new_human.equip_to_slot_or_del(UPP, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/jacket/ivan, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/m60, WEAR_J_STORE)
	//webbing
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/m60, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/m60, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/m60, WEAR_IN_ACCESSORY)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/autoinjector/full, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medical/full, WEAR_R_STORE)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/ivanberet, WEAR_HEAD)
	//limb
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/pmc, WEAR_HANDS)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/ivan, WEAR_WAIST)
	//belt filled with random magazines, it's cool

	new_human.set_species("Human Hero") //Ivan is STRONG.
