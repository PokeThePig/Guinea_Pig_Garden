extends Node

const save_location = "user://SaveFile.json"


var contents_to_save: Dictionary = {
	"regular_poop_amount": 0,
	"diamond_poop_amount": 0,
	"prismatic_poop_amount": 0,
	"gizmo_unlocked": false,
	"pennybags_unlocked": false,
	"chroma_unlocked": false,
	"calix_unlocked": false,
	"giant_poop_unlocked": false,
	"diamond_poop_unlocked": false,
	"prismatic_poop_unlocked": false,
	"bella_poop_speed": 1,
	"gizmo_poop_speed": 1,
	"pennybags_poop_speed": 1,
	"chroma_poop_speed": 1,
	"calix_poop_speed": 1,
	"bella_double_unlocked": false,
	"gizmo_double_unlocked": false,
	"pennybags_double_unlocked": false,
	"chroma_double_unlocked": false,
	"calix_double_unlocked": false,
	"bella_double_chance": 1,
	"gizmo_double_chance": 1,
	"pennybags_double_chance": 1,
	"chroma_double_chance": 1,
	"calix_double_chance": 1,
	"bella_giant_min": 1,
	"bella_giant_max": 1,
	"gizmo_giant_min": 1,
	"gizmo_giant_max": 1,
	"pennybags_giant_min": 1,
	"pennybags_giant_max": 1,
	"chroma_giant_min": 1,
	"chroma_giant_max": 1,
	"calix_giant_min": 1,
	"calix_giant_max": 1,
	"squeek_frenzy_unlocked": false,
	"squeek_frenzy_duration": 5,
	"hibernation_unlocked": false,
	"hibernation_sleep_duration": 30,
	"hibernation_effect_duration": 3,
	"copper_poop_unlocked": false,
	"copper_poop_worth": 2,
	"rain_or_shine_unlocked": false,
	"chroma_prismatic_chance": 100,
	"king_poop_unlocked": false,
	"guinea_order": [],
	"upgrades_left_dictionary": {},
	"gold_rush_unlocked": false,
	"diamond_digger_unlocked": false,
	"taste_rainbow_unlocked": false,
	"colossal_crusher_unlocked": false,
	"poop_frenzy_unlocked": false,
	"full_house_unlocked": false,
	"disco_party_unlocked": false,
	"manure_millionare_unlocked": false,
	"petting_professional_unlocked": false,
}

func _ready() -> void:
	_load()

func _save():
	var file = FileAccess.open(save_location, FileAccess.WRITE)
	file.store_var(contents_to_save.duplicate())
	file.close()
	
func _load():
	if FileAccess.file_exists(save_location):
		var file = FileAccess.open(save_location, FileAccess.READ)
		var data = file.get_var()
		file.close()
		
		var save_data = data.duplicate()
		contents_to_save.regular_poop_amount = save_data.regular_poop_amount
		contents_to_save.diamond_poop_amount = save_data.diamond_poop_amount
		contents_to_save.prismatic_poop_amount = save_data.prismatic_poop_amount
		contents_to_save.gizmo_unlocked = save_data.gizmo_unlocked
		contents_to_save.pennybags_unlocked = save_data.pennybags_unlocked
		contents_to_save.chroma_unlocked = save_data.chroma_unlocked
		contents_to_save.calix_unlocked = save_data.calix_unlocked
		contents_to_save.giant_poop_unlocked = save_data.giant_poop_unlocked
		contents_to_save.diamond_poop_unlocked = save_data.diamond_poop_unlocked
		contents_to_save.prismatic_poop_unlocked = save_data.prismatic_poop_unlocked
		contents_to_save.bella_poop_speed = save_data.bella_poop_speed
		contents_to_save.gizmo_poop_speed = save_data.gizmo_poop_speed
		contents_to_save.pennybags_poop_speed = save_data.pennybags_poop_speed
		contents_to_save.chroma_poop_speed = save_data.chroma_poop_speed
		contents_to_save.calix_poop_speed = save_data.calix_poop_speed
		contents_to_save.bella_double_unlocked = save_data.bella_double_unlocked
		contents_to_save.gizmo_double_unlocked = save_data.gizmo_double_unlocked
		contents_to_save.pennybags_double_unlocked = save_data.pennybags_double_unlocked
		contents_to_save.chroma_double_unlocked = save_data.chroma_double_unlocked
		contents_to_save.calix_double_unlocked = save_data.calix_double_unlocked
		contents_to_save.bella_double_chance = save_data.bella_double_chance
		contents_to_save.gizmo_double_chance = save_data.gizmo_double_chance
		contents_to_save.pennybags_double_chance = save_data.pennybags_double_chance
		contents_to_save.chroma_double_chance = save_data.chroma_double_chance
		contents_to_save.calix_double_chance = save_data.calix_double_chance
		contents_to_save.bella_giant_min = save_data.bella_giant_min
		contents_to_save.bella_giant_max = save_data.bella_giant_max
		contents_to_save.gizmo_giant_min = save_data.gizmo_giant_min
		contents_to_save.gizmo_giant_max = save_data.gizmo_giant_max
		contents_to_save.pennybags_giant_min = save_data.pennybags_giant_min
		contents_to_save.pennybags_giant_max = save_data.pennybags_giant_max
		contents_to_save.chroma_giant_min = save_data.chroma_giant_min
		contents_to_save.chroma_giant_max = save_data.chroma_giant_max
		contents_to_save.calix_giant_min = save_data.calix_giant_min
		contents_to_save.calix_giant_max = save_data.calix_giant_max
		contents_to_save.squeek_frenzy_unlocked = save_data.squeek_frenzy_unlocked
		contents_to_save.squeek_frenzy_duration = save_data.squeek_frenzy_duration
		contents_to_save.hibernation_unlocked = save_data.hibernation_unlocked
		contents_to_save.hibernation_sleep_duration = save_data.hibernation_sleep_duration
		contents_to_save.hibernation_effect_duration = save_data.hibernation_effect_duration
		contents_to_save.copper_poop_unlocked = save_data.copper_poop_unlocked
		contents_to_save.copper_poop_worth = save_data.copper_poop_worth
		contents_to_save.rain_or_shine_unlocked = save_data.rain_or_shine_unlocked
		contents_to_save.chroma_prismatic_chance = save_data.chroma_prismatic_chance
		contents_to_save.king_poop_unlocked = save_data.king_poop_unlocked
		contents_to_save.guinea_order = save_data.guinea_order
		contents_to_save.upgrades_left_dictionary = save_data.upgrades_left_dictionary
		contents_to_save.gold_rush_unlocked = save_data.gold_rush_unlocked
		contents_to_save.diamond_digger_unlocked = save_data.diamond_digger_unlocked
		contents_to_save.taste_rainbow_unlocked = save_data.taste_rainbow_unlocked
		contents_to_save.colossal_crusher_unlocked = save_data.colossal_crusher_unlocked
		contents_to_save.poop_frenzy_unlocked = save_data.poop_frenzy_unlocked
		contents_to_save.full_house_unlocked = save_data.full_house_unlocked
		contents_to_save.disco_party_unlocked = save_data.disco_party_unlocked
		contents_to_save.manure_millionare_unlocked = save_data.manure_millionare_unlocked
		contents_to_save.petting_professional_unlocked = save_data.petting_professional_unlocked
		
