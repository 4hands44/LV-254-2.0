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
	minimap_color = MINIMAP_AREA_CAVES_DEEP
	requires_power = FALSE

// Z - LEVELS
/area/factory/z1
	name = "Moroski Factory Cellar"
	icon_state = "one"

/area/factory/z2
	name = "Moroski Factory Main Floor"
	icon_state = "two"

/area/factory/z3
	name = "Moroski Factory Second Floor"
	icon_state = "three"

/area/factory/z4
	name = "Moroski Factory Third Floor"
	icon_state = "four"

// INTERIOR
/area/factory/z1/indoors
	name = "Moroski Factory Cellar"
	ceiling = CEILING_UNDERGROUND_METAL_BLOCK_CAS
	soundscape_playlist = SCAPE_PL_LV759_INDOORS
	ambience_exterior = AMBIENCE_HYBRISA_INTERIOR

/area/factory/z2/indoors
	name = "Moroski Factory Main Floor"
	ceiling = CEILING_METAL
	soundscape_playlist = SCAPE_PL_LV759_INDOORS
	ambience_exterior = AMBIENCE_HYBRISA_INTERIOR

/area/factory/z3/indoors
	name = "Moroski Factory Second Floor"
	ceiling = CEILING_METAL
	soundscape_playlist = SCAPE_PL_LV759_INDOORS
	ambience_exterior = AMBIENCE_HYBRISA_INTERIOR

/area/factory/z4/indoors
	name = "Moroski Factory Third Floor"
	ceiling = CEILING_METAL
	soundscape_playlist = SCAPE_PL_LV759_INDOORS
	ambience_exterior = AMBIENCE_HYBRISA_INTERIOR

// EXTERIOR
/area/factory/z1/outdoors
	name = "Underground Cavern"
	ceiling = CEILING_UNDERGROUND_BLOCK_CAS
	soundscape_playlist = SCAPE_PL_LV759_DEEPCAVES
	ambience_exterior = AMBIENCE_HYBRISA_CAVES
	soundscape_interval = 25
	minimap_color = MINIMAP_AREA_CAVES

/area/factory/z2/outdoors
	name = "Moroski Factory Grounds"
	ceiling = CEILING_NONE
	soundscape_playlist = SCAPE_PL_LV759_OUTDOORS
	ambience_exterior = AMBIENCE_CITY
	soundscape_interval = 25

/area/factory/z3/outdoors
	name = "Moroski Factory Exterior Catwalks"
	ceiling = CEILING_NONE
	soundscape_playlist = SCAPE_PL_LV759_OUTDOORS
	ambience_exterior = AMBIENCE_CITY
	soundscape_interval = 25

/area/factory/z4/outdoors
	name = "Moroski Factory Exterior Upper Catwalks"
	ceiling = CEILING_NONE
	soundscape_playlist = SCAPE_PL_LV759_OUTDOORS
	ambience_exterior = AMBIENCE_CITY
	soundscape_interval = 25

//-------------------------------------------------//
//------------------Z - LEVEL 1--------------------//
//-------------------------------------------------//

// Z - LEVEL 1 DIRECTIONAL INDOORS
/area/factory/z1/indoors/directional
	name = "Moroski Factory Cellar, North"
	icon_state = "north"

/area/factory/z1/indoors/directional/east
	name = "Moroski Factory Cellar, East"
	icon_state = "east"

/area/factory/z1/indoors/directional/south
	name = "Moroski Factory Cellar, South"
	icon_state = "south"

/area/factory/z1/indoors/directional/west
	name = "Moroski Factory Cellar, West"
	icon_state = "west"

// Z - LEVEL 1 DIRECTIONAL OUTDOORS
/area/factory/z1/outdoors/directional
	name = "Underground Cavern, North"
	icon_state = "north"

/area/factory/z1/outdoors/directional/east
	name = "Underground Cavern, East"
	icon_state = "east"

/area/factory/z1/outdoors/directional/south
	name = "Underground Cavern, South"
	icon_state = "south"

/area/factory/z1/outdoors/directional/west
	name = "Underground Cavern, West"
	icon_state = "west"

// Z - LEVEL 1 INDOORS
/area/factory/z1/indoors/office
	name = "Moroski Factory Cellar, Office"
	icon_state = "office"

/area/factory/z1/indoors/double
	name = "Moroski Factory Cellar, Double Tanks"
	icon_state = "double"

/area/factory/z1/indoors/triple
	name = "Moroski Factory Cellar, Triple Silos"
	icon_state = "triple"

/area/factory/z1/indoors/engineering
	name = "Moroski Factory Cellar, Backup Power"
	icon_state = "engi"
	minimap_color = MINIMAP_AREA_ENGI

/area/factory/z1/indoors/wet
	name = "Moroski Factory Cellar, Wet Room"
	icon_state = "wet"

/area/factory/z1/indoors/sewer
	name = "Moroski Factory Cellar, Sewage Tunnel"
	icon_state = "sewer"

//-------------------------------------------------//
//------------------Z - LEVEL 2--------------------//
//-------------------------------------------------//

// Z - LEVEL 2 DIRECTIONAL INDOORS
/area/factory/z2/indoors/directional
	name = "Moroski Factory Main Floor, North"
	icon_state = "north"

/area/factory/z2/indoors/directional/east
	name = "Moroski Factory Main Floor, East"
	icon_state = "east"

/area/factory/z2/indoors/directional/south
	name = "Moroski Factory Main Floor, South"
	icon_state = "south"

/area/factory/z2/indoors/directional/west
	name = "Moroski Factory Main Floor, West"
	icon_state = "west"

// Z - LEVEL 2 DIRECTIONAL OUTDOORS
/area/factory/z2/outdoors/directional
	name = "Moroski Factory Grounds, North"
	icon_state = "north"
	minimap_color = MINIMAP_AREA_JUNGLE

/area/factory/z2/outdoors/directional/east
	name = "Moroski Factory Grounds, East"
	icon_state = "east"

/area/factory/z2/outdoors/directional/south
	name = "Moroski Factory Grounds, South"
	icon_state = "south"

/area/factory/z2/outdoors/directional/west
	name = "Moroski Factory Grounds, West"
	icon_state = "west"

// Z - LEVEL 2 GATES
/area/factory/z2/indoors/gate
	name = "Moroski Factory Main Floor, Southwest Gate 0"
	icon_state = "zero"
	minimap_color = MINIMAP_AREA_GLASS

/area/factory/z2/indoors/gate/one
	name = "Moroski Factory Main Floor, Northeast Gate 1"
	icon_state = "one"
	minimap_color = MINIMAP_AREA_GLASS

/area/factory/z2/indoors/gate/two
	name = "Moroski Factory Main Floor, Northeast Gate 2"
	icon_state = "two"
	minimap_color = MINIMAP_AREA_GLASS

/area/factory/z2/indoors/gate/three
	name = "Moroski Factory Main Floor, Northwest Gate 3"
	icon_state = "three"
	minimap_color = MINIMAP_AREA_GLASS

/area/factory/z2/indoors/gate/four
	name = "Moroski Factory Main Floor, Medical Tent Gate 4"
	icon_state = "four"
	minimap_color = MINIMAP_AREA_GLASS

/area/factory/z2/indoors/gate/five
	name = "Moroski Factory Main Floor, South Gate 5"
	icon_state = "five"
	minimap_color = MINIMAP_AREA_GLASS

// Z - LEVEL 2 INDOORS
/area/factory/z2/indoors/office
	name = "Moroski Factory Main Floor, Office"
	icon_state = "office"
	minimap_color = MINIMAP_AREA_COMMAND

/area/factory/z2/indoors/lab
	name = "Moroski Factory Main Floor, Lab"
	icon_state = "lab"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/factory/z2/indoors/shack
	name = "Moroski Factory Main Floor, Wood Shack"
	icon_state = "shack"

/area/factory/z2/indoors/tent
	name = "Moroski Factory Main Floor, Eastern Medical Tent"
	icon_state = "tent"
	minimap_color = MINIMAP_AREA_MEDBAY

/area/factory/z2/indoors/postman
	name = "Moroski Factory Main Floor, Postman Bunker"
	icon_state = "postman"

/area/factory/z2/indoors/processing
	name = "Moroski Factory Main Floor, Central Processing"
	icon_state = "processing"

/area/factory/z2/indoors/holding
	name = "Moroski Factory Main Floor, Southwest Holding Bay"
	icon_state = "holding"

/area/factory/z2/indoors/loader
	name = "Moroski Factory Main Floor, Northeast Powerloader Storage"
	icon_state = "loader"

/area/factory/z2/indoors/unloading
	name = "Moroski Factory Main Floor, North Unloading Bay"
	icon_state = "unload"

/area/factory/z2/indoors/chemical
	name = "Moroski Factory Main Floor, Southeast Chemical Storage"
	icon_state = "chemical"

// Z - LEVEL 2 OUTDOORS
/area/factory/z2/outdoors/landing
	name = "Moroski Factory Grounds, Southeast Landing Zone"
	icon_state = "lz1"
	is_landing_zone = TRUE
	linked_lz = DROPSHIP_LZ1
	minimap_color = MINIMAP_AREA_LZ

/area/factory/z2/outdoors/comms
	name = "Moroski Factory Grounds, Eastern Parking Lot"
	icon_state = "comms1"
	linked_lz = DROPSHIP_LZ1
	minimap_color = MINIMAP_AREA_COMMS

/area/factory/z2/outdoors/comms/two
	name = "Moroski Factory Grounds, Western Parking Lot"
	icon_state = "comms2"
	linked_lz = DROPSHIP_LZ2

//-------------------------------------------------//
//------------------Z - LEVEL 3--------------------//
//-------------------------------------------------//

// Z - LEVEL 3 DIRECTIONAL INDOORS
/area/factory/z3/indoors/directional
	name = "Moroski Factory Catwalks, North"
	icon_state = "north"

/area/factory/z3/indoors/directional/east
	name = "Moroski Factory Catwalks, East"
	icon_state = "east"

/area/factory/z3/indoors/directional/south
	name = "Moroski Factory Catwalks, South"
	icon_state = "south"

/area/factory/z3/indoors/directional/west
	name = "Moroski Factory Catwalks, West"
	icon_state = "west"

// Z - LEVEL 3 DIRECTIONAL OUTDOORS
/area/factory/z3/outdoors/directional
	name = "Moroski Factory Exterior Catwalks, North"
	icon_state = "north"
	minimap_color = MINIMAP_AREA_GLASS

/area/factory/z3/outdoors/directional/east
	name = "Moroski Factory Exterior Catwalks, East"
	icon_state = "east"

/area/factory/z3/outdoors/directional/south
	name = "Moroski Factory Exterior Catwalks, South"
	icon_state = "south"

/area/factory/z3/outdoors/directional/west
	name = "Moroski Factory Exterior Catwalks, West"
	icon_state = "west"

// Z - LEVEL 3 INDOORS
/area/factory/z3/indoors/office
	name = "Moroski Factory Second Floor, Office Showers"
	icon_state = "shower"
	minimap_color = MINIMAP_AREA_COMMAND

/area/factory/z3/indoors/lab
	name = "Moroski Factory Second Floor, Lab"
	icon_state = "lab"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/factory/z3/indoors/shack
	name = "Moroski Factory Second Floor, Wood Shack"
	icon_state = "shack"

/area/factory/z3/indoors/server
	name = "Moroski Factory Second Floor, Servers"
	icon_state = "server"
	minimap_color = MINIMAP_AREA_RESEARCH

//-------------------------------------------------//
//------------------Z - LEVEL 4--------------------//
//-------------------------------------------------//

// Z - LEVEL 4 DIRECTIONAL INDOORS
/area/factory/z4/indoors/directional
	name = "Moroski Factory Upper Catwalks, North"
	icon_state = "north"

/area/factory/z4/indoors/directional/east
	name = "Moroski Factory Upper Catwalks, East"
	icon_state = "east"

/area/factory/z4/indoors/directional/south
	name = "Moroski Factory Upper Catwalks, South"
	icon_state = "south"

/area/factory/z4/indoors/directional/west
	name = "Moroski Factory Upper Catwalks, West"
	icon_state = "west"

// Z - LEVEL 4 INDOORS
/area/factory/z4/indoors/office
	name = "Moroski Factory Second Floor, Office"
	icon_state = "office"
	minimap_color = MINIMAP_AREA_COMMAND

/area/factory/z4/indoors/office/foreman
	name = "Moroski Factory Second Floor, Foreman's Office"
	icon_state = "foreman"
	minimap_color = MINIMAP_AREA_SEC

/area/factory/z4/indoors/balcony
	name = "Moroski Factory Second Floor, Lab Balcony"
	icon_state = "balcony"
	minimap_color = MINIMAP_AREA_GLASS

/area/factory/z4/indoors/bridge
	name = "Moroski Factory Second Floor, Sky-bridge"
	icon_state = "bridge"
	minimap_color = MINIMAP_AREA_GLASS

/area/factory/z4/indoors/ship
	name = "Moroski Factory Second Floor, Crashed Ship"
	icon_state = "ship"
	minimap_color = MINIMAP_AREA_SEC
