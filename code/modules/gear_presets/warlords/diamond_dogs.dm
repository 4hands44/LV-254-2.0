/datum/equipment_preset/diamond_dog
	name = "Diamond Dogs PMC"
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
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/diamond_dog(new_human), WEAR_BODY)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/cm/red(new_human), WEAR_HEAD)

	if(prob(50))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/civilian/black(new_human), WEAR_HEAD)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/brown/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack(new_human), WEAR_BACK)




//pistol
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster/armpit(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/np92/suppressed/tranq(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/np92/tranq(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/np92/tranq(new_human), WEAR_IN_ACCESSORY)
//pouch
	new_human.equip_to_slot_or_del(new /obj/item/storage/ifak/blk(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/tactical/full(new_human), WEAR_R_STORE)

//gear
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/health/ceramic_plate(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/health/ceramic_plate(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/health/ceramic_plate(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/civ(new_human), WEAR_IN_BACK)

	var/belt_choice = rand(1,3)
	switch(belt_choice)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/utility/full(new_human), WEAR_WAIST)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/full/with_defib_and_analyzer(new_human), WEAR_WAIST)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/grenade/upp/full(new_human), WEAR_WAIST)

	var/gear_choice = rand(1,8)
	switch(gear_choice)
		if(1)
			if(prob(50))
				new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/diamond_dog/tan(new_human), WEAR_JACKET)
			else
				new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/diamond_dog(new_human), WEAR_JACKET)
			spawn_weapon(/obj/item/weapon/gun/rifle/kramer/sec, /obj/item/ammo_magazine/rifle/kramer/ap, new_human)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/webbing/diamond_dog(new_human), WEAR_JACKET)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/shotgun/full/random, WEAR_WAIST)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/pump/dual_tube/cmb/m3717, WEAR_R_HAND)
		if(3)
			if(prob(50))
				new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/diamond_dog/tan(new_human), WEAR_JACKET)
			else
				new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/diamond_dog(new_human), WEAR_JACKET)
			spawn_weapon(/obj/item/weapon/gun/rifle/l42a/sec, /obj/item/ammo_magazine/rifle/l42a/ap, new_human)
		if(4)
			if(prob(50))
				new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/diamond_dog/tan(new_human), WEAR_JACKET)
			else
				new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/diamond_dog(new_human), WEAR_JACKET)
			spawn_weapon(/obj/item/weapon/gun/rifle/ak4047/scav, /obj/item/ammo_magazine/rifle/ak4047/ap, new_human)
		if(5)
			if(prob(50))
				new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/diamond_dog/tan(new_human), WEAR_JACKET)
			else
				new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/diamond_dog(new_human), WEAR_JACKET)
			spawn_weapon(/obj/item/weapon/gun/rifle/ak4047_lmg/mr_tracksuit, /obj/item/ammo_magazine/rifle/ak4047_drum/ap, new_human)
		if(6)
			if(prob(50))
				new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/diamond_dog/tan(new_human), WEAR_JACKET)
			else
				new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/diamond_dog(new_human), WEAR_JACKET)
			spawn_weapon(/obj/item/weapon/gun/rifle/mar40/carbine/tactical, /obj/item/ammo_magazine/rifle/mar40/ap, new_human)
		if(7)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/webbing/diamond_dog(new_human), WEAR_JACKET)
			spawn_weapon(/obj/item/weapon/gun/pkp, /obj/item/ammo_magazine/pkp, new_human)
		if(8)
			if(prob(50))
				new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/diamond_dog/tan(new_human), WEAR_JACKET)
			else
				new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/diamond_dog(new_human), WEAR_JACKET)
			spawn_weapon(/obj/item/weapon/gun/smg/bizon/tagrilla, /obj/item/ammo_magazine/smg/bizon/ap, new_human)



//*****************************************************************************************************/

/datum/equipment_preset/diamond_dog/snake
	name = "Diamond Dogs - Snake(Warlord)"
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
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/health/ceramic_plate(new_human), WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack(new_human), WEAR_BACK)

//pistol
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster/armpit(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/np92/suppressed/tranq(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/np92/tranq(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/np92/tranq(new_human), WEAR_IN_ACCESSORY)
//pouch
	new_human.equip_to_slot_or_del(new /obj/item/storage/ifak/blk(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/tactical/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/smoke(new_human), WEAR_L_STORE)
//gear
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/m42_night_goggles/upp(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/civ(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/stack/fulton(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crew_monitor(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/chameleon(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/snake_decoy(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/snake_decoy(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/snake_decoy(new_human), WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/health/ceramic_plate(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/health/ceramic_plate(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/health/ceramic_plate(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/snake_crate(new_human), WEAR_IN_BACK)
//rifle
	spawn_weapon(/obj/item/weapon/gun/rifle/kramer/sec, /obj/item/ammo_magazine/rifle/kramer/ap, new_human)

	new_human.set_species("Human Hero") //Snake is STRONG.

	to_chat(new_human, SPAN_WARNING("You are Snake, the leader of the Diamond Dogs PMCs! Your goal to to achive objectives as stealthy and with as little bloodshed as possible."))
//*****************************************************************************************************/


//--the box--\\

/obj/item/snake_crate
	name = "large crate"
	desc = "It's a basic storage unit. This one has a snake inside."
	icon = 'icons/obj/structures/crates.dmi'
	item_icons = list(
		WEAR_L_HAND = 'icons/obj/structures/crates.dmi',
		WEAR_R_HAND = 'icons/obj/structures/crates.dmi',
	)
	icon_state = "snakecrate"
	equip_sounds = "rustle"


/obj/item/snake_decoy
	name = "deployable decoy"
	desc = "A cardboard poster made in snake's own image."
	w_class = SIZE_SMALL
	icon = 'icons/obj/items/weapons/grenade.dmi'
	icon_state = "ir_beacon"
	var/activated = 0
	var/icon_activated = "ir_beacon_active"


/obj/item/snake_decoy/attack_self(mob/user)
	..()

	if(!ishuman(user))
		return
	if(!user.mind)
		to_chat(user, "It doesn't seem to do anything for you.")
		return

	playsound(src,'sound/machines/click.ogg', 15, 1)

	if(activated)
		to_chat(user, "Toss it to deploy")
		return


	activated = 1
	anchored = TRUE
	w_class = 10
	icon_state = "[icon_activated]"


	var/mob/living/carbon/C = user
	if(istype(C) && !C.throw_mode)
		C.toggle_throw_mode(THROW_MODE_NORMAL)

	sleep(20) //10 seconds should be enough.
	var/turf/T = get_turf(src) //Make sure we get the turf we're tossing this on.
	playsound(src,'sound/machines/hiss.ogg', 25, 1)
	new /obj/structure/target/snake(T)
	qdel(src)
	return


