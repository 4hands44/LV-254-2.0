/datum/emote/living/carbon/human/tagrilla/passive
	category = TAGRILLA_EMOTE_CATEGORY_PASSIVE
	emote_type = EMOTE_AUDIBLE|EMOTE_VISIBLE

// Pain
/datum/emote/living/carbon/human/tagrilla/passive/pain
	key = "In Pain"

/datum/emote/living/carbon/human/tagrilla/passive/pain/get_sound(mob/living/user)
	return 'sound/voice/tagrilla/hurt.ogg'

// Compliment
/datum/emote/living/carbon/human/tagrilla/passive/compliment
	key = "Good Job"

/datum/emote/living/carbon/human/tagrilla/passive/compliment/get_sound(mob/living/user)
	return pick('sound/voice/tagrilla/workgood_1.ogg',
				'sound/voice/tagrilla/workgood_2.ogg')

// Insult
/datum/emote/living/carbon/human/tagrilla/passive/insult
	key = "Bad Job"

/datum/emote/living/carbon/human/tagrilla/passive/insult/get_sound(mob/living/user)
	return pick('sound/voice/tagrilla/workbad_1.ogg',
				'sound/voice/tagrilla/workbad_2.ogg')

// Need Ammo
/datum/emote/living/carbon/human/tagrilla/passive/ammo
	key = "Need Ammo"

/datum/emote/living/carbon/human/tagrilla/passive/ammo/get_sound(mob/living/user)
	return pick('sound/voice/tagrilla/needammo_1.ogg',
				'sound/voice/tagrilla/needammo_2.ogg')
