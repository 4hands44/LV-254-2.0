//ALMAYER AREAS--------------------------------------//
// Fore = West  | Aft = East //
// Port = South | Starboard = North //
// Bow = Western|Stern = Eastern //(those are the front and back small sections)
// Naming convention is to start by port or starboard then put eitheir (bow,fore,midship,aft,stern)
/area/point_rain
	icon = 'icons/turf/area_pointrain.dmi'
	// ambience = list('sound/ambience/shipambience.ogg')
	icon_state = "Point Rain"
	ceiling = CEILING_METAL
	temperature = TROPICAL_TEMP
	powernet_name = "point_rain"
	icon_state = "base_icon"


/area/point_rain/outdoors
	name = "Point Rain - Outdoors"
	icon_state = "outside"
	ceiling = CEILING_NONE
	ceiling_muffle = FALSE
	ambience_exterior = AMBIENCE_COAST
	soundscape_playlist = SCAPE_PL_PR_OUTDOORS

/area/point_rain/outdoors/inland
	name = "Point Rain - Outdoors"
	icon_state = "outside"
	ceiling = CEILING_NONE
	ceiling_muffle = FALSE
	ambience_exterior = AMBIENCE_COAST_INLAND
	soundscape_playlist = SCAPE_PL_PR_OUTDOORS

/area/point_rain/indoors
	name = "Point Rain - Indoors"
	icon_state = "bunker"
	ceiling = CEILING_METAL
	ambience_exterior = AMBIENCE_COAST_INDOORS
	soundscape_playlist = SCAPE_PL_HANGAR

/area/point_rain/indoors/underground
	name = "Point Rain - Underground Fortification"
	icon_state = "tunnel"
	ceiling = CEILING_DEEP_UNDERGROUND
	ceiling_muffle = FALSE
	ambience_exterior = AMBIENCE_SHIP

/area/point_rain/underground
	name = "Point Rain - Caverns"
	icon_state = "caves"
	ceiling = CEILING_DEEP_UNDERGROUND
	ceiling_muffle = FALSE
	ambience_exterior = AMBIENCE_COAST_INDOORS

//OUTDOORS AREAS

/area/point_rain/outdoors/port
	name = "Port"
	icon_state = "req1"

/area/point_rain/outdoors/beach
	name = "Beach"
	icon_state = "beach"

/area/point_rain/outdoors/beach/north_east
	name = "North-Eastern Beach"
	icon_state = "beach2"

/area/point_rain/outdoors/beach/east
	name = "Eastern Beach"
	icon_state = "beach3"

/area/point_rain/outdoors/beach/south_east
	name = "South-Eastern Beach"
	icon_state = "beach4"

/area/point_rain/outdoors/beach/east
	name = "Eastern Beach"
	icon_state = "beach"

/area/point_rain/outdoors/inland/wetland_bridge
	name = "Wetlands Bridge"
	icon_state = "hall0"
	ceiling = CEILING_NONE

/area/point_rain/outdoors/inland/southern_wetland
	name = "Southern Wetlands"
	icon_state = "s"
	ceiling = CEILING_NONE

/area/point_rain/outdoors/inland/southwestern_wetland
	name = "South-Western Wetlands"
	icon_state = "sw"
	ceiling = CEILING_NONE

/area/point_rain/outdoors/inland/southeastern_wetland
	name = "South-Eastern Wetlands"
	icon_state = "se"
	ceiling = CEILING_NONE

/area/point_rain/outdoors/inland/northern_costal_guns
	name = "Northern Analise Coastal Guns"
	icon_state = "north"
	ceiling = CEILING_NONE

/area/point_rain/outdoors/inland/southern_costal_guns
	name = "Southern Analise Coastal Guns"
	icon_state = "south"
	ceiling = CEILING_NONE

/area/point_rain/outdoors/inland/north_east
	name = "North-Eastern Inland"
	icon_state = "ne"
	ceiling = CEILING_NONE

/area/point_rain/outdoors/inland/southern_road
	name = "Southern road"
	icon_state = "s"
	ceiling = CEILING_NONE

/area/point_rain/outdoors/inland/outpost_road
	name = "Outpost Road"
	icon_state = "n"
	ceiling = CEILING_NONE

/area/point_rain/outdoors/inland/north_west
	name = "North-Western Inland"
	icon_state = "nw"
	ceiling = CEILING_NONE

/area/point_rain/outdoors/inland/south_east
	name = "South-Eastern Inland"
	icon_state = "se"
	ceiling = CEILING_NONE

/area/point_rain/outdoors/inland/south_west
	name = "South-Western Inland"
	icon_state = "sw"
	ceiling = CEILING_NONE

/area/point_rain/outdoors/inland/port_warehouses
	name = "Port Warehouses"
	icon_state = "platform"
	ceiling = CEILING_NONE

/area/point_rain/outdoors/inland/airfield
	name = "Airfield"
	icon_state = "offices4"
	ceiling = CEILING_NONE

/area/point_rain/outdoors/inland/base_exterior
	name = "Point Rain - Outer gate"
	icon_state = "outside"

/area/point_rain/outdoors/checkpoint
	name = "Military Checkpoint"
	icon_state = "hall0"
	ambience_exterior = AMBIENCE_COAST_INLAND
	soundscape_interval = 60
	soundscape_playlist = SCAPE_PL_CHECKPOINT


//cmd bunker
/area/point_rain/outdoors/command_bunker
	name = "Command bunker"
	icon_state = "outside"

/area/point_rain/outdoors/command_bunker/analise_exterior
	name = "Command bunker Analise"
	icon_state = "hall2"
	ambience_exterior = AMBIENCE_COAST_INLAND

/area/point_rain/outdoors/command_bunker/martha_exterior
	name = "Command bunker Martha-Exterior"
	icon_state = "hall3"

//INDOORS AREAS

/area/point_rain/indoors/hangar_1
	name = "Hangar 1"
	icon_state = "bunker"
	ambience_exterior = AMBIENCE_COAST_INLAND_INDOORS

/area/point_rain/indoors/hangar_2
	name = "Hangar 2"
	icon_state = "bunker"
	ambience_exterior = AMBIENCE_COAST_INLAND_INDOORS

/area/point_rain/indoors/motorpool
	name = "Point Rain - Motorpool"
	icon_state = "tunnels3"
	ceiling_muffle = FALSE
	ceiling = CEILING_UNDERGROUND_BLOCK_CAS
	ambience_exterior = AMBIENCE_COAST_INLAND_INDOORS

/area/point_rain/indoors/sally_port
	name = "Point Rain - sally port"
	icon_state = "tunnels4"
	ceiling_muffle = FALSE
	ceiling = CEILING_UNDERGROUND_BLOCK_CAS
	ambience_exterior = AMBIENCE_COAST_INLAND_INDOORS

/area/point_rain/indoors/underground/req
	name = "Requisitons bay"
	icon_state = "req"

/area/point_rain/indoors/underground/req/loading_dock
	name = "Requisitons loading bay"
	icon_state = "req1"
	ambience_exterior = AMBIENCE_COAST_INDOORS

/area/point_rain/indoors/underground/squad_prep
	name = "Requisitons bay"
	icon_state = "req2"

/area/point_rain/indoors/underground/bunks
	name = "Point Rain - Underground Fortification"
	icon_state = "livingspace"

/area/point_rain/indoors/underground/bunks/captain
	name = "Point Rain - Commander's Bunk"
	icon_state = "offices0"

/area/point_rain/indoors/underground/bunks/lieutenant
	name = "Point Rain - Officer's Bunk"
	icon_state = "offices1"

/area/point_rain/indoors/underground/bunks/enlisted_1
	name = "Point Rain - Bunk 1"
	icon_state = "livingspace"

/area/point_rain/indoors/underground/bunks/enlisted_2
	name = "Point Rain - Bunk 2"
	icon_state = "livingspace"

/area/point_rain/indoors/underground/cic_hallway
	name = "Point Rain - CIC Hallway"
	icon_state = "tunnel"

/area/point_rain/indoors/underground/actor_prep
	name = "Point Rain - Actor Prep"
	icon_state = "base_icon"
	unlimited_power = 1

/area/point_rain/indoors/uscm_warehouse
	name = "USCM Supply Warehouse"
	icon_state = "bunker"
	soundscape_playlist = SCAPE_PL_HANGAR
	soundscape_interval = 50

/area/point_rain/indoors/uscm_warehouse1
	name = "USCM Supply Warehouse 1"
	icon_state = "req1"

/area/point_rain/indoors/uscm_warehouse2
	name = "USCM Supply Warehouse 2"
	icon_state = "req2"


/area/point_rain/indoors/ds_hangar_1
	name = "Dropship Hangar 1"
	icon_state = "shuttle"
	ambience_exterior = AMBIENCE_COAST_INLAND_INDOORS

/area/point_rain/indoors/ds_hangar_2
	name = "Dropship Hangar 2"
	icon_state = "shuttle2"
	ambience_exterior = AMBIENCE_COAST_INLAND_INDOORS

/area/point_rain/indoors/port_warehouse
	name = "Warehouse"
	icon_state = "bunker"
	soundscape_playlist = SCAPE_PL_HANGAR
	soundscape_interval = 50

/area/point_rain/indoors/port_warehouse1
	name = "Warehouse 1"
	icon_state = "req0"

/area/point_rain/indoors/port_warehouse2
	name = "Warehouse 2"
	icon_state = "req1"

/area/point_rain/indoors/port_warehouse3
	name = "Warehouse 3"
	icon_state = "req3"

/area/point_rain/indoors/port_warehouse4
	name = "Warehouse 4"
	icon_state = "req4"

/area/point_rain/indoors/port_warehouse5
	name = "Warehouse 5"
	icon_state = "req0"

//cmd bunker
/area/point_rain/indoors/command_bunker
	name = "Point Rain - Command Bunker"
	icon_state = "bunker"
	ceiling = CEILING_METAL
	ambience_exterior = AMBIENCE_COAST_CIC
	soundscape_playlist = SCAPE_PL_CIC
	soundscape_interval = 50

/area/point_rain/indoors/checkpoint
	name = "Point Rain - Checkpoint"
	icon_state = "p1"
	ceiling = CEILING_METAL
	ambience_exterior = AMBIENCE_COAST_INLAND_INDOORS
	soundscape_interval = 60
	soundscape_playlist = SCAPE_PL_CHECKPOINT


//pillbox forward command bunkers
/area/point_rain/indoors/command_bunker/analise
	name = "Command Bunker Analise"
	icon_state = "p1"

/area/point_rain/indoors/command_bunker/martha
	name = "Command Bunker Martha"
	icon_state = "p2"

/area/point_rain/indoors/underground/cic
	name = "Point Rain - CIC"
	icon_state = "cic"
	ceiling = CEILING_DEEP_UNDERGROUND
	ambience_exterior = AMBIENCE_COAST_CIC_2

/area/point_rain/indoors/underground/medbay
	name = "Point Rain - Hospital"
	icon_state = "medical"

/area/point_rain/indoors/underground/surgery_1
	name = "OR 1"
	icon_state = "medical"

/area/point_rain/indoors/underground/surgery_2
	name = "OR 2"
	icon_state = "medical"

/area/point_rain/indoors/underground/engineering
	name = "Point Rain - Engineering"
	icon_state = "engineering"

//pillbox

/area/point_rain/indoors/pillbox
	name = "Pillbox"
	icon_state = "p6"

/area/point_rain/indoors/pillbox/able
	name = "Pillbox Able"
	icon_state = "p1"

/area/point_rain/indoors/pillbox/baker
	name = "Pillbox baker"
	icon_state = "p2"

/area/point_rain/indoors/pillbox/charlie
	name = "Pillbox charlie"
	icon_state = "p3"

/area/point_rain/indoors/pillbox/dog
	name = "Pillbox dog"
	icon_state = "p4"

/area/point_rain/indoors/pillbox/easy
	name = "Pillbox easy"
	icon_state = "p5"

/area/point_rain/indoors/pillbox/fox
	name = "Pillbox fox"
	icon_state = "p6"

/area/point_rain/indoors/pillbox/george
	name = "Pillbox George"
	icon_state = "p1"
	ambience_exterior = AMBIENCE_COAST_INLAND_INDOORS

/area/point_rain/indoors/pillbox/how
	name = "Pillbox How"
	icon_state = "p2"
	ambience_exterior = AMBIENCE_COAST_INLAND_INDOORS
