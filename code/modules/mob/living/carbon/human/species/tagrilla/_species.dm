// Scav Boss Tagrilla
/datum/species/human/hero/lesser/tagrilla
	name = "Tagrilla"
	name_plural = "Tagrillers"
	mob_inherent_traits = list(
		TRAIT_TAGRILLA,
		TRAIT_HEARTLESS,
		TRAIT_SUPER_STRONG,
		TRAIT_EMOTE_CD_EXEMPT
	)
	death_message = "slowly stumbles forward, letting out a final pained grunt before falling over dead."
	death_sound = 'sound/voice/tagrilla/death.ogg'


/datum/species/human/hero/lesser/tagrilla/handle_post_spawn(mob/living/carbon/human/H)
	give_action(H, /datum/action/tagrilla_emote_panel)
	return ..()


// Emote Panel
/datum/species/human/hero/lesser/tagrilla/open_emote_panel()
	var/datum/tagrilla_emote_panel/ui = new(usr)
	ui.ui_interact(usr)


/datum/action/tagrilla_emote_panel
	name = "Open Emote Panel"
	action_icon_state = "looc_toggle"


/datum/action/tagrilla_emote_panel/can_use_action()
	. = ..()
	if(!.)
		return FALSE
	if(!istagrilla(owner))
		return FALSE
	return TRUE


/datum/action/tagrilla_emote_panel/action_activate()
	. = ..()
	if(!can_use_action())
		return
	var/mob/living/carbon/human/human_owner = owner
	var/datum/species/human/hero/lesser/tagrilla/tagrilla_species = human_owner.species
	tagrilla_species.open_emote_panel()


/datum/tagrilla_emote_panel
	COOLDOWN_DECLARE(panel_emote_cooldown)


/datum/tagrilla_emote_panel/proc/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Emotes")
		ui.open()


/datum/tagrilla_emote_panel/ui_state(mob/user)
	return GLOB.conscious_state


/datum/tagrilla_emote_panel/ui_data(mob/user)
	var/list/data = list()
	data["on_cooldown"] = !COOLDOWN_FINISHED(src, panel_emote_cooldown)
	return data


/datum/tagrilla_emote_panel/ui_static_data(mob/user)
	var/list/data = list()
	data["theme"] = "crtred"
	data["categories"] = GLOB.tagrilla_categories
	data["emotes"] = list()

	for(var/datum/emote/living/carbon/human/tagrilla/emote as anything in GLOB.tagrilla_emotes)
		data["emotes"] += list(list(
			"id" = initial(emote.key),
			"text" = (initial(emote.override_say)),
			"category" = initial(emote.category),
			"path" = "[emote]",
		))
	return data


/datum/tagrilla_emote_panel/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("emote")
			var/datum/emote/living/carbon/human/tagrilla/path
			if(!params["emotePath"])
				return
			path = text2path(params["emotePath"])
			if(!path || !COOLDOWN_FINISHED(src, panel_emote_cooldown))
				return
			if(!(path in subtypesof(/datum/emote/living/carbon/human/tagrilla)))
				return

			COOLDOWN_START(src, panel_emote_cooldown, 2.5 SECONDS)
			usr.emote(initial(path.key))
			return TRUE
