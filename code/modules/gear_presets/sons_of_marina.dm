//--------SOM--------\\

//----------Soldier
/datum/equipment_preset/colonist/som
	name = "Sons of Marina Militia(SOM)"
	assignment = JOB_SOM_MILITIA
	rank = JOB_SOM_MILITIA
	faction = list(FACTION_XENOMORPH, )
	languages = list(LANGUAGE_CELTIC, LANGUAGE_ENGLISH)
	skills = /datum/skills/civilian/survivor/militia

/datum/equipment_preset/colonist/som/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/frontier(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/ultrazine/liaison(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/chloralhydrate(new_human), WEAR_IN_BACK)
	if(prob(45))
		new_human.equip_to_slot_or_del(new /obj/item/storage/large_holster/machete/full(new_human), WEAR_WAIST)
	else
		new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/webley/full(new_human), WEAR_WAIST)
//robe
	if(prob(25))
		new_human.equip_to_slot_or_del(new 	/obj/item/clothing/suit/storage/webbing(new_human), WEAR_JACKET)
	if(prob(45))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/cultist_hoodie/collie(new_human), WEAR_JACKET)
	if(prob(50))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/cultist_hoodie/som/ghillie(new_human), WEAR_JACKET)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/cultist_hoodie/som(new_human), WEAR_JACKET)
//hat
	if(prob(5))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cultist_hood/barbedwire(new_human), WEAR_HEAD)
	if(prob(10))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cultist_hood/skull_mask(new_human), WEAR_HEAD)
	if(prob(15))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cultist_hood(new_human), WEAR_HEAD)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cultist_hood/som(new_human), WEAR_HEAD)
	if(prob(35))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cultist_hood/headscarf(new_human), WEAR_HEAD)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/ua_riot(new_human), WEAR_HEAD)

	spawn_som_rifle(new_human)
	spawn_rebel_shoes(new_human)
	spawn_rebel_gloves(new_human)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/survival/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert(new_human), WEAR_R_STORE)

	if(prob(15))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	if(prob(35))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs(new_human), WEAR_R_EAR)
	else
		new_human.equip_to_slot_or_del(new /obj/item/prop/helmetgarb/helmet_gasmask(new_human), WEAR_R_EAR) //fuck you I know this is shitcode
//mask
	if(prob(15))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/red(new_human), WEAR_FACE)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/black(new_human), WEAR_FACE)
	if(prob(30))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/tornscarf/urban(new_human), WEAR_FACE)
	else
		new_human.equip_to_slot_or_del(new /obj/item/prop/helmetgarb/helmet_gasmask(new_human), WEAR_FACE)
	. = ..()


//----------Witchdoctor

/datum/equipment_preset/colonist/som/medi
	name = "Sons of Marina Witch Doktor(SOM)"
	assignment = JOB_SOM_MEDIC
	rank = JOB_SOM_MEDIC
	faction = list(FACTION_XENOMORPH, )
	languages = list(LANGUAGE_CELTIC, LANGUAGE_ENGLISH)
	skills = /datum/skills/civilian/survivor/militia

/datum/equipment_preset/colonist/som/medi/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/frontier(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/cultist_hoodie/som(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cultist_hood/veilhood(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/survival/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/structure/bed/portable_surgery(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/surgical_line, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/clf_patch, WEAR_ACCESSORY)
	if(new_human.disabilities & NEARSIGHTED)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health/prescription(new_human), WEAR_EYES)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health(new_human), WEAR_EYES)
	spawn_rebel_shoes(new_human)
	spawn_rebel_gloves(new_human)
	spawn_weapon(/obj/item/weapon/gun/rifle/l42a/abr40, /obj/item/ammo_magazine/rifle/l42a/abr40, new_human)

	if(prob(15))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	if(prob(35))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs(new_human), WEAR_R_EAR)
	else
		new_human.equip_to_slot_or_del(new /obj/item/prop/helmetgarb/helmet_gasmask(new_human), WEAR_R_EAR) //fuck you I know this is shitcode
//----------Zealot

/datum/equipment_preset/colonist/som_z
	name = "Sons of Marina Zealot(SOM)"
	assignment = JOB_SOM_ZEALOT
	rank = JOB_SOM_ZEALOT
	faction = list(FACTION_XENOMORPH, )
	languages = list(LANGUAGE_CELTIC, LANGUAGE_ENGLISH)
	skills = /datum/skills/civilian/survivor/militia

/datum/equipment_preset/colonist/som_z/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/frontier(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/grenade/som(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/welding(new_human), WEAR_EYES)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/bombvest(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cultist_hood/som(new_human), WEAR_HEAD)

	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/ultrazine/liaison(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/emergency(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/inaprovaline(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/implanter/rejuv(new_human), WEAR_IN_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/gas/nerve_gas(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/gas/nerve_gas(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new/obj/item/storage/pouch/machete/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/machete/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/twohanded/fireaxe(new_human), WEAR_R_HAND)
	spawn_rebel_shoes(new_human)
	spawn_rebel_gloves(new_human)

//----------Zealot-gunner

/datum/equipment_preset/colonist/som_z_g
	name = "Sons of Marina Zealot Gunner(SOM)"
	assignment = JOB_SOM_ZEALOT
	rank = JOB_SOM_ZEALOT
	faction = list(FACTION_XENOMORPH, )
	languages = list(LANGUAGE_CELTIC, LANGUAGE_ENGLISH)
	skills = /datum/skills/civilian/survivor/militia

/datum/equipment_preset/colonist/som_z_g/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/frontier(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_FACE)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cultist_hood/som(new_human), WEAR_HEAD)

	new_human.equip_to_slot_or_del(new /obj/item/device/m2c_gun(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/m2c(new_human), WEAR_WAIST)

//robe
	new_human.equip_to_slot_or_del(new 	/obj/item/clothing/suit/storage/webbing(new_human), WEAR_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/ultrazine/liaison(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/emergency(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/inaprovaline(new_human), WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new/obj/item/storage/pouch/machete/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/machete/full(new_human), WEAR_L_STORE)
	spawn_rebel_shoes(new_human)
	spawn_rebel_gloves(new_human)


//----------Paladin

/datum/equipment_preset/colonist/som_p
	name = "Sons of Marina Paladin(SOM)"
	assignment = JOB_SOM_PALLY
	rank = JOB_SOM_PALLY
	faction = list(FACTION_XENOMORPH, )
	languages = list(LANGUAGE_CELTIC, LANGUAGE_ENGLISH)
	skills = /datum/skills/civilian/survivor/militia

/datum/equipment_preset/colonist/som_p/load_gear(mob/living/carbon/human/new_human)
	new_human.set_species("Hero")
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/frontier(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/grenade/som(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/webley/full(new_human), WEAR_R_HAND)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/cultist_hoodie/som/paladin(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cultist_hood/som(new_human), WEAR_HEAD)

	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/ultrazine/liaison(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/emergency(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/inaprovaline(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/implanter/rejuv(new_human), WEAR_IN_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/gas/nerve_gas(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/gas/nerve_gas(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new/obj/item/storage/pouch/machete/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/machete/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/shield/riot(new_human), WEAR_L_HAND)
	spawn_rebel_shoes(new_human)
	spawn_rebel_gloves(new_human)

//----------Acolyte

/datum/equipment_preset/colonist/som_a
	name = "Sons of Marina Acolyte(SOM)"
	assignment = JOB_SOM_ACOLYTE
	rank = JOB_SOM_ACOLYTE
	faction = list(FACTION_XENOMORPH, )
	languages = list(LANGUAGE_CELTIC, LANGUAGE_ENGLISH)
	skills = /datum/skills/civilian/survivor/militia

/datum/equipment_preset/colonist/som_a/load_gear(mob/living/carbon/human/new_human)
	new_human.set_species("Horror")
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/frontier(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/cultist_hoodie/som/acolyte(new_human), WEAR_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/storage/large_holster/machete/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/device/implanter/rejuv(new_human), WEAR_IN_BACK)
	spawn_rebel_shoes(new_human)
	spawn_rebel_gloves(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/survival/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert(new_human), WEAR_R_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/flail(new_human), WEAR_R_HAND)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/flail(new_human), WEAR_L_HAND)

	. = ..()

//----------Shaman

/datum/equipment_preset/colonist/som_s
	name = "Sons of Marina Shaman(SOM)"
	assignment = JOB_SOM_PRIEST
	rank = JOB_SOM_PRIEST
	faction = list(FACTION_XENOMORPH, )
	languages = list(LANGUAGE_CELTIC, LANGUAGE_ENGLISH)
	skills = /datum/skills/civilian/survivor/militia

/datum/equipment_preset/colonist/som_s/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/frontier(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/cultist_hoodie/som(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cultist_hood/som(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/flail(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/chloralhydrate(new_human), WEAR_IN_BACK)
	spawn_rebel_shoes(new_human)
	spawn_rebel_gloves(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/survival/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert(new_human), WEAR_R_STORE)
	spawn_weapon(/obj/item/weapon/gun/rifle/l42a/abr40, /obj/item/ammo_magazine/rifle/l42a/abr40, new_human)

	if(prob(15))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/red(new_human), WEAR_FACE)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/black(new_human), WEAR_FACE)
	if(prob(30))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/tornscarf/urban(new_human), WEAR_FACE)
	else
		new_human.equip_to_slot_or_del(new /obj/item/prop/helmetgarb/helmet_gasmask(new_human), WEAR_FACE)
	. = ..()

//----------Ascended

/datum/equipment_preset/colonist/som_ascended
	name = "Sons of Marina Ascended(SOM)"
	assignment = JOB_SOM_PRIEST
	rank = JOB_SOM_PRIEST
	faction = list(FACTION_XENOMORPH, )
	languages = list(LANGUAGE_CELTIC, LANGUAGE_ENGLISH)
	skills = /datum/skills/civilian/survivor/militia

/datum/equipment_preset/colonist/som_ascended/load_gear(mob/living/carbon/human/new_human)
	new_human.set_species("Horror")
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/frontier(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/cultist_hoodie/som(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cultist_hood/som(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/webley/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/chloralhydrate(new_human), WEAR_IN_BACK)
	spawn_rebel_shoes(new_human)
	spawn_rebel_gloves(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/survival/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/yautja/knife(new_human), WEAR_R_STORE)
	spawn_weapon(/obj/item/weapon/gun/rifle/l42a/abr40, /obj/item/ammo_magazine/rifle/l42a/abr40, new_human)

	if(prob(50))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/red(new_human), WEAR_FACE)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/black(new_human), WEAR_FACE)
	. = ..()


/obj/item/clothing/head/bearpelt

