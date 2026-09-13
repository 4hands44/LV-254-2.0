//-------------------------------------------------//
//------------------PARENT AREAS-------------------//
//-------------------------------------------------//

/area/factory
	name = "Moroski Factory"
	icon_state = "template"
	icon = 'icons/turf/area_factory.dmi'
	can_build_special = TRUE
	powernet_name = "ground"
	minimap_color = MINIMAP_AREA_COLONY

/area/factory/bounds
	name = "Out Of Bounds"
	icon_state = "bounds"
	ceiling = CEILING_MAX
	is_resin_allowed = FALSE
	flags_area = AREA_NOTUNNEL
	minimap_color = MINIMAP_AREA_OOB
	requires_power = FALSE

// Z - LEVELS
/area/factory/z1
	name = "Moroski Factory Floor -1"
	icon_state = "one"

/area/factory/z2
	name = "Moroski Factory Floor 0"
	icon_state = "two"

/area/factory/z3
	name = "Moroski Factory Floor 1"
	icon_state = "three"

/area/factory/z4
	name = "Moroski Factory Floor 2"
	icon_state = "four"

// INTERIOR
/area/factory/z1/indoors
	name = "Moroski Factory Floor -1 Interior"
	ceiling = CEILING_UNDERGROUND_METAL_BLOCK_CAS
	soundscape_playlist = SCAPE_PL_LV759_INDOORS
	ambience_exterior = AMBIENCE_HYBRISA_INTERIOR

/area/factory/z2/indoors
	name = "Moroski Factory Floor 0 Interior"
	ceiling = CEILING_METAL
	soundscape_playlist = SCAPE_PL_LV759_INDOORS
	ambience_exterior = AMBIENCE_HYBRISA_INTERIOR

/area/factory/z3/indoors
	name = "Moroski Factory Floor 1 Interior"
	ceiling = CEILING_METAL
	soundscape_playlist = SCAPE_PL_LV759_INDOORS
	ambience_exterior = AMBIENCE_HYBRISA_INTERIOR

/area/factory/z4/indoors
	name = "Moroski Factory Floor 2 Interior"
	ceiling = CEILING_METAL
	soundscape_playlist = SCAPE_PL_LV759_INDOORS
	ambience_exterior = AMBIENCE_HYBRISA_INTERIOR

// EXTERIOR
/area/factory/z2/outdoors
	name = "Moroski Factory Floor 0 Exterior"
	ceiling = CEILING_NONE
	soundscape_playlist = SCAPE_PL_LV759_OUTDOORS
	ambience_exterior = AMBIENCE_CITY
	soundscape_interval = 25

/area/factory/z3/outdoors
	name = "Moroski Factory Floor 1 Exterior"
	ceiling = CEILING_NONE
	soundscape_playlist = SCAPE_PL_LV759_OUTDOORS
	ambience_exterior = AMBIENCE_CITY
	soundscape_interval = 25

/area/factory/z4/outdoors
	name = "Moroski Factory Floor 2 Exterior"
	ceiling = CEILING_NONE
	soundscape_playlist = SCAPE_PL_LV759_OUTDOORS
	ambience_exterior = AMBIENCE_CITY
	soundscape_interval = 25

//-------------------------------------------------//
//------------------Z - LEVEL 1--------------------//
//-------------------------------------------------//

// Z - LEVEL 1 DIRECTIONAL INDOORS
/area/factory/z1/indoors/directional
	name = "Moroski Factory Basement -1, North"
	icon_state = "north"

/area/factory/z1/indoors/directional/east
	name = "Moroski Factory Basement -1, East"
	icon_state = "east"

/area/factory/z1/indoors/directional/south
	name = "Moroski Factory Basement -1, South"
	icon_state = "south"

/area/factory/z1/indoors/directional/west
	name = "Moroski Factory Basement -1, West"
	icon_state = "west"

// Z - LEVEL 1 INDOORS
/area/factory/z1/indoors/office
	name = "Moroski Factory Basement -1, Office"
	icon_state = "office"

/area/factory/z1/indoors/double
	name = "Moroski Factory Basement -1, Double Tanks"
	icon_state = "double"

/area/factory/z1/indoors/triple
	name = "Moroski Factory Basement -1, Triple Tanks"
	icon_state = "triple"

/area/factory/z1/indoors/engineering
	name = "Moroski Factory Basement -1, Engineering Closet"
	icon_state = "engi"
	minimap_color = MINIMAP_AREA_ENGI

/area/factory/z1/indoors/wet
	name = "Moroski Factory Basement -1, Wet Room"
	icon_state = "wet"

/area/factory/z1/indoors/sewer
	name = "Moroski Factory Basement -1, Sewer Tunnel"
	icon_state = "sewer"

//-------------------------------------------------//
//------------------Z - LEVEL 2--------------------//
//-------------------------------------------------//

// Z - LEVEL 2 DIRECTIONAL INDOORS
/area/factory/z2/indoors/directional
	name = "Moroski Factory Floor 0, North"
	icon_state = "north"

/area/factory/z2/indoors/directional/east
	name = "Moroski Factory Floor 0, East"
	icon_state = "east"

/area/factory/z2/indoors/directional/south
	name = "Moroski Factory Floor 0, South"
	icon_state = "south"

/area/factory/z2/indoors/directional/west
	name = "Moroski Factory Floor 0, West"
	icon_state = "west"

// Z - LEVEL 2 DIRECTIONAL OUTDOORS
/area/factory/z2/outdoors/directional
	name = "Moroski Factory Grounds 0, North"
	icon_state = "north"
	minimap_color = MINIMAP_AREA_JUNGLE

/area/factory/z2/outdoors/directional/east
	name = "Moroski Factory Grounds 0, East"
	icon_state = "east"

/area/factory/z2/outdoors/directional/south
	name = "Moroski Factory Grounds 0, South"
	icon_state = "south"

/area/factory/z2/outdoors/directional/west
	name = "Moroski Factory Grounds 0, West"
	icon_state = "west"

// Z - LEVEL 2 INDOORS
/area/factory/z2/indoors/office
	name = "Moroski Factory Grounds 0, Office"
	icon_state = "office"
	minimap_color = MINIMAP_AREA_COMMAND

/area/factory/z2/indoors/lab
	name = "Moroski Factory Grounds 0, Lab"
	icon_state = "lab"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/factory/z2/indoors/shack
	name = "Moroski Factory Grounds 0, Wood Shack"
	icon_state = "shack"

/area/factory/z2/indoors/tent
	name = "Moroski Factory Grounds 0, Medical Tent"
	icon_state = "tent"
	minimap_color = MINIMAP_AREA_MEDBAY

/area/factory/z2/indoors/postman
	name = "Moroski Factory Floor 0, Postman Bunker"
	icon_state = "postman"

// Z - LEVEL 2 OUTDOORS
/area/factory/z2/outdoors/landing
	name = "Moroski Factory Grounds 0, Southeast Landing Zone"
	icon_state = "lz1"
	is_landing_zone = TRUE
	linked_lz = DROPSHIP_LZ1
	minimap_color = MINIMAP_AREA_LZ

/area/factory/z2/outdoors/comms
	name = "Moroski Factory Grounds 0, Eastern Parking Lot"
	icon_state = "comms1"
	linked_lz = DROPSHIP_LZ1
	minimap_color = MINIMAP_AREA_COMMS

/area/factory/z2/outdoors/comms/two
	name = "Moroski Factory Grounds 0, Western Parking Lot"
	icon_state = "comms2"
	linked_lz = DROPSHIP_LZ2

//-------------------------------------------------//
//------------------Z - LEVEL 3--------------------//
//-------------------------------------------------//

// Z - LEVEL 3 DIRECTIONAL INDOORS
/area/factory/z3/indoors/directional
	name = "Moroski Factory Catwalks 1, North"
	icon_state = "north"

/area/factory/z3/indoors/directional/east
	name = "Moroski Factory Catwalks 1, East"
	icon_state = "east"

/area/factory/z3/indoors/directional/south
	name = "Moroski Factory Catwalks 1, South"
	icon_state = "south"

/area/factory/z3/indoors/directional/west
	name = "Moroski Factory Catwalks 1, West"
	icon_state = "west"

// Z - LEVEL 3 DIRECTIONAL OUTDOORS
/area/factory/z3/outdoors/directional
	name = "Moroski Factory Grounds 1, North"
	icon_state = "north"
	minimap_color = MINIMAP_AREA_JUNGLE

/area/factory/z3/outdoors/directional/east
	name = "Moroski Factory Grounds 1, East"
	icon_state = "east"

/area/factory/z3/outdoors/directional/south
	name = "Moroski Factory Grounds 1, South"
	icon_state = "south"

/area/factory/z3/outdoors/directional/west
	name = "Moroski Factory Grounds 1, West"
	icon_state = "west"

// Z - LEVEL 3 INDOORS
/area/factory/z3/indoors/office
	name = "Moroski Factory Floor 1, Shower"
	icon_state = "office"
	minimap_color = MINIMAP_AREA_COMMAND

/area/factory/z3/indoors/lab
	name = "Moroski Factory Floor 1, Lab"
	icon_state = "lab"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/factory/z3/indoors/shack
	name = "Moroski Factory Floor 1, Wood Shack"
	icon_state = "shack"

/area/factory/z3/indoors/server
	name = "Moroski Factory Floor 1, Server Overhang"
	icon_state = "server"

//-------------------------------------------------//
//------------------Z - LEVEL 4--------------------//
//-------------------------------------------------//

// Z - LEVEL 4 DIRECTIONAL INDOORS
/area/factory/z4/indoors/directional
	name = "Moroski Factory Catwalks 2, North"
	icon_state = "north"

/area/factory/z4/indoors/directional/east
	name = "Moroski Factory Catwalks 2, East"
	icon_state = "east"

/area/factory/z4/indoors/directional/south
	name = "Moroski Factory Catwalks 2, South"
	icon_state = "south"

/area/factory/z4/indoors/directional/west
	name = "Moroski Factory Catwalks 2, West"
	icon_state = "west"

// Z - LEVEL 4 DIRECTIONAL OUTDOORS
/area/factory/z4/outdoors/directional
	name = "Moroski Factory Grounds 2, North"
	icon_state = "north"
	minimap_color = MINIMAP_AREA_JUNGLE

/area/factory/z4/outdoors/directional/east
	name = "Moroski Factory Grounds 2, East"
	icon_state = "east"

/area/factory/z4/outdoors/directional/south
	name = "Moroski Factory Grounds 2, South"
	icon_state = "south"

/area/factory/z4/outdoors/directional/west
	name = "Moroski Factory Grounds 2, West"
	icon_state = "west"

// Z - LEVEL 4 INDOORS
/area/factory/z4/indoors/office
	name = "Moroski Factory Floor 2, Office"
	icon_state = "office"
	minimap_color = MINIMAP_AREA_COMMAND

/area/factory/z4/indoors/balcony
	name = "Moroski Factory Floor 2, Lab Balcony"
	icon_state = "balcony"
	minimap_color = MINIMAP_AREA_GLASS

/area/factory/z4/indoors/bridge
	name = "Moroski Factory Floor 2, Sky-bridge"
	icon_state = "bridge"
	minimap_color = MINIMAP_AREA_GLASS

/area/factory/z4/indoors/ship
	name = "Moroski Factory Floor 2, Crashed Ship"
	icon_state = "ship"
	minimap_color = MINIMAP_AREA_SEC
