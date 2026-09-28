/datum/emote/living/carbon/human/tagrilla/aggressive
	category = TAGRILLA_EMOTE_CATEGORY_AGGRESSIVE

// Enemy Spotted
/datum/emote/living/carbon/human/tagrilla/aggressive/spotted
	override_say = "Enemy Spotted"
	key = "enemyspotted"

/datum/emote/living/carbon/human/tagrilla/aggressive/spotted/get_sound(mob/living/user)
	return pick('sound/voice/tagrilla/enemyspotted_1.ogg',
				'sound/voice/tagrilla/enemyspotted_2.ogg',
				'sound/voice/tagrilla/enemyspotted_3.ogg',
				'sound/voice/tagrilla/enemyspotted_4.ogg') // 4 is english

// Enemy Lost
/datum/emote/living/carbon/human/tagrilla/aggressive/lost
	override_say = "Lost Visual"
	key = "enemylost"

/datum/emote/living/carbon/human/tagrilla/aggressive/lost/get_sound(mob/living/user)
	return pick('sound/voice/tagrilla/enemylost_1.ogg',
				'sound/voice/tagrilla/enemylost_2.ogg',
				'sound/voice/tagrilla/enemylost_3.ogg')

// Enemy Killed
/datum/emote/living/carbon/human/tagrilla/aggressive/kill
	override_say = "Enemy Killed"
	key = "enemydown"

/datum/emote/living/carbon/human/tagrilla/aggressive/kill/get_sound(mob/living/user)
	return pick('sound/voice/tagrilla/enemydown_1.ogg',
				'sound/voice/tagrilla/enemydown_2.ogg',
				'sound/voice/tagrilla/enemydown_3.ogg')

// Warcry
/datum/emote/living/carbon/human/tagrilla/aggressive/warcry
	override_say = "Warcry"
	key = "fighting"

/datum/emote/living/carbon/human/tagrilla/aggressive/warcry/get_sound(mob/living/user)
	return pick('sound/voice/tagrilla/fighting_1.ogg',
				'sound/voice/tagrilla/fighting_2.ogg',
				'sound/voice/tagrilla/fighting_3.ogg',
				'sound/voice/tagrilla/fighting_4.ogg',
				'sound/voice/tagrilla/fighting_5.ogg',
				'sound/voice/tagrilla/fighting_6.ogg')

// Grenade
/datum/emote/living/carbon/human/tagrilla/aggressive/grenade
	override_say = "Grenade"
	key = "grenade"

/datum/emote/living/carbon/human/tagrilla/aggressive/grenade/get_sound(mob/living/user)
	return pick('sound/voice/tagrilla/grenade_1.ogg',
				'sound/voice/tagrilla/grenade_2.ogg',
				'sound/voice/tagrilla/grenade_3.ogg')
