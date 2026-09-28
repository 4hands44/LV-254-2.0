/obj/item/ammo_magazine/hardpoint/m56_cupola
	name = "M56 Cupola Magazine"
	desc = "A box of 500, 10x28mm caseless tungsten rounds for the M56D heavy machine gun system."
	caliber = "10x28mm" //Correlates to smartguns
	icon = 'icons/obj/items/weapons/guns/ammo_by_faction/USCM/vehicles.dmi'
	icon_state = "cupola_1"
	w_class = SIZE_LARGE
	default_ammo = /datum/ammo/bullet/machinegun
	max_rounds = 500
	gun_type = /obj/item/hardpoint/primary/m56

/obj/item/ammo_magazine/hardpoint/m56_cupola/update_icon()
	icon_state = "cupola_[current_rounds <= 0 ? "0" : "1"]"

