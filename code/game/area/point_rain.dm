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

/area/point_rain/indoors
	name = "Point Rain - Indoors"
	icon_state = "bunker"
	ceiling = CEILING_METAL
	ambience_exterior = AMBIENCE_COAST_INDOORS

/area/point_rain/indoors/underground
	name = "Point Rain - Underground Fortification"
	icon_state = "tunnel"
	ceiling = CEILING_DEEP_UNDERGROUND
	ambience_exterior = AMBIENCE_COAST_INDOORS

/area/point_rain/underground
	name = "Point Rain - Caverns"
	icon_state = "caves"
	ceiling = CEILING_DEEP_UNDERGROUND
	ambience_exterior = AMBIENCE_COAST_INDOORS

//OUTDOORS AREAS

/area/point_rain/outdoors/port
	name = "Port"
	icon_state = "req1"

/area/point_rain/outdoors/port_road
	name = "Port Road"
	icon_state = "lane1n"

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

/area/point_rain/outdoors/checkpoint
	name = "Military Checkpoint"
	icon_state = "hall0"
	soundscape_interval = 60
	soundscape_playlist = SCAPE_PL_CHECKPOINT


/area/point_rain/outdoors/command_bunker
	name = "Command bunker"
	icon_state = "outside"

/area/point_rain/outdoors/command_bunker/analise_exterior
	name = "Command bunker Analise"
	icon_state = "outside"

/area/point_rain/outdoors/command_bunker/martha_exterior
	name = "Command bunker Martha-Exterior"
	icon_state = "outside"

//INDOORS AREAS

/area/point_rain/indoors/command_bunker
	name = "Point Rain - Command Bunker"
	icon_state = "bunker"
	ceiling = CEILING_METAL
	ambience_exterior = AMBIENCE_COAST_CIC

/area/point_rain/indoors/checkpoint
	name = "Point Rain - Checkpoint"
	icon_state = "p1"
	ceiling = CEILING_METAL
	soundscape_interval = 60
	soundscape_playlist = SCAPE_PL_CHECKPOINT


//pillbox forward command bunkers
/area/point_rain/indoors/command_bunker/analise
	name = "Command Bunker Analise"
	icon_state = "p1"

/area/point_rain/indoors/command_bunker/martha
	name = "Command Bunker Martha"
	icon_state = "p2"


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
