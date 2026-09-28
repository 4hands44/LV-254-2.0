/datum/emote/living/carbon/human/tagrilla/passive
	category = TAGRILLA_EMOTE_CATEGORY_PASSIVE

// Pain
/datum/emote/living/carbon/human/tagrilla/passive/pain
	override_say = "Pained"
	key = "hurt"
	sound = 'sound/voice/tagrilla/hurt.ogg'

// Compliment
/datum/emote/living/carbon/human/tagrilla/passive/compliment
	override_say = "Good Job"
	key = "workgood"

/datum/emote/living/carbon/human/tagrilla/passive/compliment/get_sound(mob/living/user)
	return pick('sound/voice/tagrilla/workgood_1.ogg',
				'sound/voice/tagrilla/workgood_2.ogg')

// Insult
/datum/emote/living/carbon/human/tagrilla/passive/insult
	override_say = "Bad Job"
	key = "workbad"

/datum/emote/living/carbon/human/tagrilla/passive/insult/get_sound(mob/living/user)
	return pick('sound/voice/tagrilla/workbad_1.ogg',
				'sound/voice/tagrilla/workbad_2.ogg')

// Need Ammo
/datum/emote/living/carbon/human/tagrilla/passive/ammo
	override_say = "Need Ammo"
	key = "needammo"

/datum/emote/living/carbon/human/tagrilla/passive/ammo/get_sound(mob/living/user)
	return pick('sound/voice/tagrilla/needammo_1.ogg',
				'sound/voice/tagrilla/needammo_2.ogg')
