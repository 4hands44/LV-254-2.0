/datum/emote/living/carbon/human/tagrilla
	species_type_allowed_typecache = list(/datum/species/human/hero/lesser/tagrilla)
	keybind_category = CATEGORY_HUMAN_EMOTE
	volume = 100
	emote_type = EMOTE_AUDIBLE

	/// A general category for the emote, for use in the emote panel. See [code/__DEFINES/emote_panels.dm] for categories.
	var/category = ""
	/// Override text for the emote to be displayed in the emote panel
	var/override_say = ""
