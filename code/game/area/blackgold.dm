//--------------------------------------Blackgold---------------------------------------//
// Fore = West  | Aft = East //
// Port = South | Starboard = North //
// Bow = Western|Stern = Eastern //(those are the front and back small sections)
// Naming convention is to start by port or starboard then put eitheir (bow,fore,midship,aft,stern)
//---------------------------------------------------------------------------------------//
/area/blackgold
	icon = 'icons/turf/area_almayer.dmi'
	// Ambience = list('sound/ambience/shipambience.ogg')
	icon_state = "almayer"
	powernet_name = "blackgold"
	ceiling = CEILING_METAL
	sound_environment = SOUND_ENVIRONMENT_ROOM
	soundscape_interval = 30
	// Soundscape_playlist = list('sound/effects/xylophone1.ogg', 'sound/effects/xylophone2.ogg', 'sound/effects/xylophone3.ogg')
	ambience_exterior = AMBIENCE_SHIP
	ceiling_muffle = FALSE

	// Whether this area is used for hijack evacuation progress
	var/hijack_evacuation_area = FALSE

	// The weight this area gives towards hijack evacuation progress
	var/hijack_evacuation_weight = 0

	// Whether this area is additive or multiplicative towards evacuation progress
	var/hijack_evacuation_type = EVACUATION_TYPE_NONE

/area/blackgold/Initialize(mapload, ...)
	. = ..()

	if(hijack_evacuation_area)
		SShijack.progress_areas[src] = power_equip

/obj/structure/machinery/computer/shuttle_control/blackgold/hangar
	name = "Elevator Console"
	icon = 'icons/obj/structures/machinery/computer.dmi'
	icon_state = "supply"
	unslashable = TRUE
	unacidable = TRUE
	explo_proof = TRUE
	density = TRUE
	req_access = null
	shuttle_tag = "Hangar"

/obj/structure/machinery/computer/shuttle_control/blackgold/maintenance
	name = "Elevator Console"
	icon = 'icons/obj/structures/machinery/computer.dmi'
	icon_state = "shuttle"
	unslashable = TRUE
	unacidable = TRUE
	explo_proof = TRUE
	density = TRUE
	req_access = null
	shuttle_tag = "Maintenance"

/area/blackgold/powered //for objects not intended to lose power
	name = "\improper Powered"
	icon_state = "selfdestruct"
	requires_power = 0

//---------------------------------------------------------------------------------------//
//-------------------------------------Service Deck--------------------------------------//
//---------------------------------------------------------------------------------------//

/area/blackgold/underdeck
	name = "USS blackgold - Under Deck"
	soundscape_playlist = SCAPE_PL_ENG
	soundscape_interval = 15

/area/blackgold/underdeck/req
	name = "USS blackgold - Under Deck Cargo"
	icon_state = "req"

/area/blackgold/underdeck/vehicle
	name = "USS blackgold - Under Deck Vehicle Bay"
	icon_state = "req"

//----------------------------------------Stairs-----------------------------------------//

/area/blackgold/underdeck/stairs
	resin_construction_allowed = FALSE
	allow_construction = FALSE

/area/blackgold/underdeck/stairs/port
	icon_state = "stairs_lowerdeck"
	name = "\improper Underdeck Port Elevator Shaft"

/area/blackgold/underdeck/stairs/star
	icon_state = "stairs_upperdeck"
	name = "\improper Underdeck Starboard Elevator Shaft"

//---------------------------------------------------------------------------------------//
//--------------------------------------Lower Deck---------------------------------------//
//---------------------------------------------------------------------------------------//

/area/blackgold/lower
	soundscape_playlist = SCAPE_PL_ENG
	soundscape_interval = 15

//----------------------------------------Stairs-----------------------------------------//

/area/blackgold/lower/stairs
	resin_construction_allowed = FALSE
	allow_construction = FALSE

/area/blackgold/lower/stairs/port
	icon_state = "stairs_lowerdeck"

/area/blackgold/lower/stairs/star
	icon_state = "stairs_upperdeck"

/area/blackgold/lower/stairs/port/fore
	name = "\improper Lower Deck Port-Fore Stairs"

/area/blackgold/lower/stairs/port/mid
	name = "\improper Lower Deck Port-Midship Stairs"

/area/blackgold/lower/stairs/port/aft
	name = "\improper Lower Deck Port-Aft Stairs"

/area/blackgold/lower/stairs/star/fore
	name = "\improper Lower Deck Starboard-Fore Stairs"

/area/blackgold/lower/stairs/star/mid
	name = "\improper Lower Deck Starboard-Midship Stairs"

/area/blackgold/lower/stairs/star/aft
	name = "\improper Lower Deck Starboard-Aft Stairs"

//---------------------------------------Hallways----------------------------------------//

/area/blackgold/lower/hallways

/area/blackgold/lower/hallways/port
	icon_state = "port"

/area/blackgold/lower/hallways/star
	icon_state = "starboard"

/area/blackgold/lower/hallways/mid
	icon_state = "stern"

/area/blackgold/lower/hallways/port/fore
	name = "\improper Lower Deck Port-Fore Hallway"

/area/blackgold/lower/hallways/port/mid
	name = "\improper Lower Deck Port-Midship Hallway"

/area/blackgold/lower/hallways/port/aft
	name = "\improper Lower Deck Port-Aft Hallway"

/area/blackgold/lower/hallways/star/fore
	name = "\improper Lower Deck Starboard-Fore Hallway"

/area/blackgold/lower/hallways/star/mid
	name = "\improper Lower Deck Starboard-Midship Hallway"

/area/blackgold/lower/hallways/star/aft
	name = "\improper Lower Deck Starboard-Aft Hallway"

/area/blackgold/lower/hallways/mid/fore
	name = "\improper Lower Deck Fore Hallway"

/area/blackgold/lower/hallways/mid/mid
	name = "\improper Lower Deck Midship Hallway"

/area/blackgold/lower/hallways/mid/aft
	name = "\improper Lower Deck Aft Hallway"

//--------------------------------------Maintenance--------------------------------------//

/area/blackgold/lower/maint

/area/blackgold/lower/maint/port
	icon_state = "upperhull"

/area/blackgold/lower/maint/star
	icon_state = "lowerhull"

/area/blackgold/lower/maint/port/fore
	name = "\improper Lower Deck Port-Fore Maintenance"

/area/blackgold/lower/maint/port/mid
	name = "\improper Lower Deck Port-Midship Maintenance"

/area/blackgold/lower/maint/port/aft
	name = "\improper Lower Deck Port-Aft Maintenance"

/area/blackgold/lower/maint/star/fore
	name = "\improper Lower Deck Starboard-Fore Maintenance"

/area/blackgold/lower/maint/star/mid
	name = "\improper Lower Deck Starboard-Midship Maintenance"

/area/blackgold/lower/maint/star/aft
	name = "\improper Lower Deck Starboard-Aft Maintenance"

//-----------------------------------------Rooms-----------------------------------------//

/area/blackgold/lower/rooms

/area/blackgold/lower/rooms/engineering
	name = "\improper Lower Deck Engineering"
	icon_state = "lowerengineering"

/area/blackgold/lower/rooms/engineering/storage
	name = "\improper Lower Deck Engineering Storage"

/area/blackgold/lower/rooms/engineering/reactor
	name = "\improper Lower Deck Reactor Core"
	icon_state = "coreroom"
	hijack_evacuation_area = TRUE
	hijack_evacuation_weight = 0.2
	hijack_evacuation_type = EVACUATION_TYPE_ADDITIVE

/area/blackgold/lower/rooms/engineering/ce
	name = "\improper Lower Deck Chief Engineer Office"
	icon_state = "ceroom"

/area/blackgold/lower/rooms/engineering/laundry
	name = "\improper Upper Deck Laundry Room"
	icon_state = "laundry"

/area/blackgold/lower/rooms/aicore
	name = "\improper AI Core"
	icon_state = "airoom"
	soundscape_playlist = SCAPE_PL_ARES
	soundscape_interval = 120
	flags_area = AREA_NOTUNNEL|AREA_UNWEEDABLE
	can_build_special = FALSE
	is_resin_allowed = FALSE
	resin_construction_allowed = FALSE

/area/blackgold/lower/rooms/hangar
	name = "\improper Lower Hangar Bays"
	icon_state = "hangar"
	soundscape_playlist = SCAPE_PL_HANGAR
	soundscape_interval = 50

/area/blackgold/lower/rooms/shuttle
	name = "\improper Shuttle Landing Bay"
	icon_state = "starboardpd"
	soundscape_playlist = SCAPE_PL_HANGAR
	soundscape_interval = 50

/area/blackgold/lower/rooms/shuttle/bow
	name = "\improper Lower Deck Bow Shuttle Landing Bay"

/area/blackgold/lower/rooms/shuttle/stern
	name = "\improper Lower Deck Stern Shuttle Landing Bay"

/area/blackgold/lower/rooms/cryo
	name = "\improper Lower Deck Cryo Cells"
	icon_state = "cryo"

/area/blackgold/lower/rooms/sea
	name = "\improper Lower Deck Senior Enlisted Advisor's Office"
	icon_state = "chiefmpoffice"

/area/blackgold/lower/rooms/req
	name = "\improper Lower Deck Requisitions Bay"
	icon_state = "req"

/area/blackgold/lower/rooms/range
	name = "\improper Lower Deck Firing Range"
	icon_state = "firingrange"

/area/blackgold/lower/rooms/gym
	name = "\improper Lower Deck Gym"
	icon_state = "officerrnr"

/area/blackgold/lower/rooms/conference
	name = "\improper Lower Deck Squad Conference Office"
	icon_state = "shared"

/area/blackgold/lower/rooms/liaison
	name = "\improper Lower Deck Corporate Liaison Office"
	icon_state = "corporatespace"

//-----------------------------------------Brig------------------------------------------//

/area/blackgold/lower/rooms/brig
	name = "\improper Lower Brig"
	icon_state = "brig"

/area/blackgold/lower/rooms/brig/evidence_storage
	name = "\improper Lower Brig Evidence Storage"

/area/blackgold/lower/rooms/brig/execution
	name = "\improper Lower Brig Execution Room"

/area/blackgold/lower/rooms/brig/cells
	name = "\improper Lower Brig Cells"
	icon_state = "brigcells"

/area/blackgold/lower/rooms/brig/warden
	name = "\improper Lower Brig Warden Office"
	icon_state = "chiefmpoffice"

//---------------------------------------------------------------------------------------//
//--------------------------------------Middle Deck--------------------------------------//
//---------------------------------------------------------------------------------------//

/area/blackgold/middle

//----------------------------------------Stairs-----------------------------------------//

/area/blackgold/middle/stairs
	resin_construction_allowed = FALSE
	allow_construction = FALSE

/area/blackgold/middle/stairs/port
	icon_state = "stairs_lowerdeck"

/area/blackgold/middle/stairs/star
	icon_state = "stairs_upperdeck"

/area/blackgold/middle/stairs/port/fore
	name = "\improper Middle Deck Port-Fore Stairs"

/area/blackgold/middle/stairs/port/mid
	name = "\improper Middle Deck Port-Midship Stairs"

/area/blackgold/middle/stairs/port/aft
	name = "\improper Middle Deck Port-Aft Stairs"

/area/blackgold/middle/stairs/star/fore
	name = "\improper Middle Deck Starboard-Fore Stairs"

/area/blackgold/middle/stairs/star/mid
	name = "\improper Middle Deck Starboard-Midship Stairs"

/area/blackgold/middle/stairs/star/aft
	name = "\improper Middle Deck Starboard-Aft Stairs"

//---------------------------------------Hallways----------------------------------------//

/area/blackgold/middle/hallways

/area/blackgold/middle/hallways/port
	icon_state = "port"

/area/blackgold/middle/hallways/star
	icon_state = "starboard"

/area/blackgold/middle/hallways/mid
	icon_state = "stern"

/area/blackgold/middle/hallways/port/fore
	name = "\improper Middle Deck Port-Fore Hallway"

/area/blackgold/middle/hallways/port/mid
	name = "\improper Middle Deck Port-Midship Hallway"

/area/blackgold/middle/hallways/port/aft
	name = "\improper Middle Deck Port-Aft Hallway"

/area/blackgold/middle/hallways/star/fore
	name = "\improper Middle Deck Starboard-Fore Hallway"

/area/blackgold/middle/hallways/star/mid
	name = "\improper Middle Deck Starboard-Midship Hallway"

/area/blackgold/middle/hallways/star/aft
	name = "\improper Middle Deck Starboard-Aft Hallway"

/area/blackgold/middle/hallways/mid/fore
	name = "\improper Middle Deck Fore Hallway"

/area/blackgold/middle/hallways/mid/mid
	name = "\improper Middle Deck Midship Hallway"

/area/blackgold/middle/hallways/mid/aft
	name = "\improper Middle Deck Aft Hallway"

//--------------------------------------Maintenance--------------------------------------//

/area/blackgold/middle/maint

/area/blackgold/middle/maint/port
	icon_state = "upperhull"

/area/blackgold/middle/maint/star
	icon_state = "lowerhull"

/area/blackgold/middle/maint/port/fore
	name = "\improper Middle Deck Port-Fore Maintenance"

/area/blackgold/middle/maint/port/mid
	name = "\improper Middle Deck Port-Midship Maintenance"

/area/blackgold/middle/maint/port/aft
	name = "\improper Middle Deck Port-Aft Maintenance"

/area/blackgold/middle/maint/star/fore
	name = "\improper Middle Deck Starboard-Fore Maintenance"

/area/blackgold/middle/maint/star/mid
	name = "\improper Middle Deck Starboard-Midship Maintenance"

/area/blackgold/middle/maint/star/aft
	name = "\improper Middle Deck Starboard-Aft Maintenance"

//-----------------------------------------Rooms-----------------------------------------//

/area/blackgold/middle/rooms

/area/blackgold/middle/rooms/aientrance
	name = "\improper AI Core Entrance"
	icon_state = "airoom"
	soundscape_playlist = SCAPE_PL_ARES
	soundscape_interval = 120
	flags_area = AREA_NOTUNNEL|AREA_UNWEEDABLE
	can_build_special = FALSE
	is_resin_allowed = FALSE
	resin_construction_allowed = FALSE

/area/blackgold/middle/rooms/hangar
	name = "\improper Hangar Bay"
	icon_state = "hangar"
	soundscape_playlist = SCAPE_PL_HANGAR
	soundscape_interval = 50

/area/blackgold/middle/rooms/orbital
	name = "\improper Weapon Control Deck"
	icon_state = "astronavigation"
	hijack_evacuation_area = TRUE
	hijack_evacuation_weight = 1.1
	hijack_evacuation_type = EVACUATION_TYPE_MULTIPLICATIVE

/area/blackgold/middle/rooms/squad
	name = "\improper Marine Cryobay"
	icon_state = "shared"

/area/blackgold/middle/rooms/squad/prep
	name = "\improper Marine Squad Preparation"

/area/blackgold/middle/rooms/req
	name = "\improper Middle Deck Requisitions Bay"
	icon_state = "req"

/area/blackgold/middle/rooms/briefing
	name = "\improper Briefing Hall"
	icon_state = "briefing"

/area/blackgold/middle/rooms/medical
	name = "\improper Medical Lower Lobby"
	icon_state = "medical"
	soundscape_playlist = SCAPE_PL_ELEVATOR_MUSIC
	soundscape_interval = 120
	minimap_color = MINIMAP_AREA_MEDBAY

/area/blackgold/middle/rooms/medical/operating
	icon_state = "operating"

/area/blackgold/middle/rooms/medical/operating/one
	name = "\improper Medical Operating Room 1"

/area/blackgold/middle/rooms/medical/operating/two
	name = "\improper Medical Operating Room 2"

/area/blackgold/middle/rooms/medical/operating/three
	name = "\improper Medical Operating Room 3"

/area/blackgold/middle/rooms/medical/chemistry
	name = "\improper Middle Deck Medbay Pharmacy"
	icon_state = "chemistry"

/area/blackgold/middle/rooms/medical/cmo
	name = "\improper Middle Deck Chief Medical Officer's Office"

/area/blackgold/middle/rooms/pumps
	name = "Lifeboat Fuel Pumps"
	icon_state = "lifeboat_pump"
	requires_power = 1
	hijack_evacuation_area = TRUE
	hijack_evacuation_weight = 0.1
	hijack_evacuation_type = EVACUATION_TYPE_ADDITIVE

/area/blackgold/middle/rooms/pumps/port
	name = "Port Lifeboat Fuel Pumps"

/area/blackgold/middle/rooms/pumps/starboard
	name = "Starboard Lifeboat Fuel Pumps"

/area/blackgold/middle/rooms/reporter
	name = "\improper Middle Deck Combat Correspondent Office"
	icon_state = "selfdestruct"

/area/blackgold/middle/rooms/workshop
	name = "\improper Middle Deck Vehicle Workshop"
	icon_state = "dropshiprepair"

/area/blackgold/middle/rooms/chapel
	name = "\improper Middle Deck Chapel"
	icon_state = "officerrnr"

//-------------------------------------Engineering---------------------------------------//

/area/blackgold/middle/rooms/engineering
	name = "\improper Middle Deck Aft Engineering"
	icon_state = "lowerengineering"
	minimap_color = MINIMAP_AREA_ENGI

/area/blackgold/middle/rooms/engineering/ot
	name = "\improper Middle Deck Aft Ordinance Lab"

//---------------------------------------------------------------------------------------//
//--------------------------------------Upper Deck---------------------------------------//
//---------------------------------------------------------------------------------------//

/area/blackgold/upper

//----------------------------------------Stairs-----------------------------------------//

/area/blackgold/upper/stairs
	resin_construction_allowed = FALSE
	allow_construction = FALSE

/area/blackgold/upper/stairs/port
	icon_state = "stairs_lowerdeck"

/area/blackgold/upper/stairs/star
	icon_state = "stairs_upperdeck"

/area/blackgold/upper/stairs/port/fore
	name = "\improper Upper Deck Port-Fore Stairs"

/area/blackgold/upper/stairs/port/mid
	name = "\improper Upper Deck Port-Midship Stairs"

/area/blackgold/upper/stairs/port/aft
	name = "\improper Upper Deck Port-Aft Stairs"

/area/blackgold/upper/stairs/star/fore
	name = "\improper Upper Deck Starboard-Fore Stairs"

/area/blackgold/upper/stairs/star/mid
	name = "\improper Upper Deck Starboard-Midship Stairs"

/area/blackgold/upper/stairs/star/aft
	name = "\improper Upper Deck Starboard-Aft Stairs"

//---------------------------------------Hallways----------------------------------------//

/area/blackgold/upper/hallways

/area/blackgold/upper/hallways/port
	icon_state = "port"

/area/blackgold/upper/hallways/star
	icon_state = "starboard"

/area/blackgold/upper/hallways/mid
	icon_state = "stern"

/area/blackgold/upper/hallways/port/fore
	name = "\improper Upper Deck Port-Fore Hallway"

/area/blackgold/upper/hallways/port/mid
	name = "\improper Upper Deck Port-Midship Hallway"

/area/blackgold/upper/hallways/port/aft
	name = "\improper Upper Deck Port-Aft Hallway"

/area/blackgold/upper/hallways/star/fore
	name = "\improper Upper Deck Starboard-Fore Hallway"

/area/blackgold/upper/hallways/star/mid
	name = "\improper Upper Deck Starboard-Midship Hallway"

/area/blackgold/upper/hallways/star/aft
	name = "\improper Upper Deck Starboard-Aft Hallway"

/area/blackgold/upper/hallways/mid/fore
	name = "\improper Upper Deck Fore Hallway"

/area/blackgold/upper/hallways/mid/mid
	name = "\improper Upper Deck Midship Hallway"

/area/blackgold/upper/hallways/mid/aft
	name = "\improper Upper Deck Aft Hallway"

//--------------------------------------Maintenance--------------------------------------//

/area/blackgold/upper/maint

/area/blackgold/upper/maint/port
	icon_state = "upperhull"

/area/blackgold/upper/maint/star
	icon_state = "lowerhull"

/area/blackgold/upper/maint/port/fore
	name = "\improper Upper Deck Port-Fore Maintenance"

/area/blackgold/upper/maint/port/mid
	name = "\improper Upper Deck Port-Midship Maintenance"

/area/blackgold/upper/maint/port/aft
	name = "\improper Upper Deck Port-Aft Maintenance"

/area/blackgold/upper/maint/star/fore
	name = "\improper Upper Deck Starboard-Fore Maintenance"

/area/blackgold/upper/maint/star/mid
	name = "\improper Upper Deck Starboard-Midship Maintenance"

/area/blackgold/upper/maint/star/aft
	name = "\improper Upper Deck Starboard-Aft Maintenance"

//-----------------------------------------Rooms-----------------------------------------//

/area/blackgold/upper/rooms

//----------------------------------------Command----------------------------------------//

/area/blackgold/upper/rooms/cic
	name = "\improper Combat Information Center"
	icon_state = "cic"
	soundscape_playlist = SCAPE_PL_CIC
	soundscape_interval = 50
	flags_area = AREA_NOTUNNEL

/area/blackgold/upper/rooms/cic/conference
	name = "\improper CIC Conference Room"
	icon_state = "cic"

/area/blackgold/upper/rooms/captain_mess
	name = "\improper Captain's Mess"
	icon_state = "briefing"

/area/blackgold/upper/rooms/companycommand
	soundscape_playlist = SCAPE_PL_CIC

/area/blackgold/upper/rooms/companycommand/alpha
	name = "\improper Alpha Company Command Office"
	icon_state = "alpha"

/area/blackgold/upper/rooms/companycommand/alpha/cc
	name = "\improper Alpha Company Commander's Office"

/area/blackgold/upper/rooms/companycommand/bravo
	name = "\improper Bravo Company Command Office"
	icon_state = "bravo"

/area/blackgold/upper/rooms/companycommand/bravo/cc
	name = "\improper Bravo Company Commander's Office"

/area/blackgold/upper/rooms/companycommand/charlie
	name = "\improper Charlie Company Command Office"
	icon_state = "charlie"

/area/blackgold/upper/rooms/companycommand/charlie/cc
	name = "\improper Charlie Company Commander's Office"

/area/blackgold/upper/rooms/companycommand/delta
	name = "\improper Delta Company Command Office"
	icon_state = "delta"

/area/blackgold/upper/rooms/companycommand/delta/cc
	name = "\improper Delta Company Commander's Office"

/area/blackgold/upper/rooms/commandbunks
	name = "\improper Commanding Officer's Office"
	icon_state = "livingspace"

/area/blackgold/upper/rooms/commandbunks/staff
	name = "\improper Staff Officer Bunks"

/area/blackgold/upper/rooms/commandbunks/adjunct
	name = "\improper Adjunct's Quarters"

/area/blackgold/upper/rooms/commandbunks/xo
	name = "\improper Executive Officer's Office"

/area/blackgold/upper/rooms/commandbunks/synth
	name = "\improper Upper Deck Synthetic Storage"

/area/blackgold/upper/rooms/evacuation
	name = "\improper Upper Deck Fore Evacuation Lounge"
	icon = 'icons/turf/areas.dmi'
	icon_state = "shuttle2"

/area/blackgold/upper/rooms/evacuation/aft
	name = "\improper Upper Deck Aft Evacuation Lounge"
	icon = 'icons/turf/areas.dmi'
	icon_state = "shuttle2"

/area/blackgold/upper/rooms/computer
	name = "\improper Upper Deck Computer Lab"
	icon_state = "ceroom"

/area/blackgold/upper/rooms/computer/storage
	name = "\improper Computer Lab Secure Storage"
	icon_state = "corporatespace"

/area/blackgold/upper/rooms/telecomms
	name = "\improper Upper Deck Telecommunications"
	icon_state = "tcomms"
	flags_area = AREA_NOTUNNEL

/area/blackgold/upper/rooms/lifeboat
	name = "\improper Lifeboat Docking Port"
	icon_state = "selfdestruct"

/area/blackgold/upper/rooms/lifeboat/port
	name = "\improper Upper Port Lifeboat Docking Port"

/area/blackgold/upper/rooms/lifeboat/star
	name = "\improper Upper Starboard Lifeboat Docking Port"

/area/blackgold/upper/rooms/lifeboat/dock
	name = "\improper Lifeboat Docking Area"
	icon_state = "lifeboat"
	flags_area = AREA_NOTUNNEL

/area/blackgold/upper/rooms/garden
	name = "\improper Upper Deck Garden"
	icon_state = "portemb"

/area/blackgold/upper/rooms/tanker
	name = "\improper Upper Deck Vehicle Crew Bunks"
	icon_state = "livingspace"

/area/blackgold/upper/rooms/intel
	name = "\improper Upper Deck Intelligence Officer's Bunks"
	icon_state = "livingspace"

//------------------------------------------Brig-----------------------------------------//

/area/blackgold/upper/rooms/brig
	name = "\improper Upper Brig"
	icon_state = "brig"

/area/blackgold/upper/rooms/brig/lobby
	name = "\improper Upper Brig Lobby"

/area/blackgold/upper/rooms/brig/armory
	name = "\improper Upper Brig Armory"

/area/blackgold/upper/rooms/brig
	name = "\improper Upper Brig MP Bunks"

/area/blackgold/upper/rooms/brig/cryo
	name = "\improper Upper Brig Cryo Pods"

/area/blackgold/upper/rooms/brig/medical
	name = "\improper Upper Brig Medical"

/area/blackgold/upper/rooms/brig/processing
	name = "\improper Upper Brig Processing and Holding"

/area/blackgold/upper/rooms/brig/chief
	name = "\improper Upper Brig Chief MP Office"
	icon_state = "chiefmpoffice"

/area/blackgold/upper/rooms/brig/stairs
	name = "\improper Brig Stairwell"
	icon_state = "stairs_lowerdeck"

//------------------------------------------Misc-----------------------------------------//

/area/blackgold/upper/rooms/hangar
	name = "\improper Upper Hangar Catwalk"
	icon_state = "hangar"
	soundscape_playlist = SCAPE_PL_HANGAR
	soundscape_interval = 50

/area/blackgold/upper/rooms/kitchen
	name = "\improper Upper Deck Kitchen"
	icon_state = "gruntrnr"

/area/blackgold/upper/rooms/kitchen/freezer
	name = "\improper Walk-in Freezer"
	temperature = ICE_COLONY_TEMPERATURE

/area/blackgold/upper/rooms/medical
	name = "\improper Upper Deck Aft Medbay"
	icon_state = "medical"
	soundscape_playlist = SCAPE_PL_ELEVATOR_MUSIC
	soundscape_interval = 120

/area/blackgold/upper/rooms/medical/research
	name = "\improper Upper Deck Aft Research Lab"

/area/blackgold/upper/rooms/medical/morgue
	name = "\improper Upper Deck Aft Morgue"
	icon_state = "operating"

/area/blackgold/upper/rooms/medical/containment
	name = "\improper Upper Deck Aft Research Containment"
	icon_state = "operating"
	flags_area = AREA_NOTUNNEL | AREA_CONTAINMENT

/area/blackgold/evacuation/pod1
/area/blackgold/evacuation/pod2
/area/blackgold/evacuation/pod3
/area/blackgold/evacuation/pod4
/area/blackgold/evacuation/pod5
/area/blackgold/evacuation/pod6
/area/blackgold/evacuation/pod7
/area/blackgold/evacuation/pod8
/area/blackgold/evacuation/pod9
/area/blackgold/evacuation/pod10
/area/blackgold/evacuation/pod11
/area/blackgold/evacuation/pod12
/area/blackgold/evacuation/pod13
/area/blackgold/evacuation/pod14
/area/blackgold/evacuation/pod15
/area/blackgold/evacuation/pod16
/area/blackgold/evacuation/pod17
/area/blackgold/evacuation/pod18

/area/blackgold/evacuation/stranded

/area/blackgold/evacuation/stranded/pod1
/area/blackgold/evacuation/stranded/pod2
/area/blackgold/evacuation/stranded/pod3
/area/blackgold/evacuation/stranded/pod4
/area/blackgold/evacuation/stranded/pod5
/area/blackgold/evacuation/stranded/pod6
/area/blackgold/evacuation/stranded/pod7
/area/blackgold/evacuation/stranded/pod8
/area/blackgold/evacuation/stranded/pod9
/area/blackgold/evacuation/stranded/pod10
/area/blackgold/evacuation/stranded/pod11
/area/blackgold/evacuation/stranded/pod12
/area/blackgold/evacuation/stranded/pod13
/area/blackgold/evacuation/stranded/pod14
/area/blackgold/evacuation/stranded/pod15
/area/blackgold/evacuation/stranded/pod16
/area/blackgold/evacuation/stranded/pod17
/area/blackgold/evacuation/stranded/pod18
