extends Node

#Guinea pigs
var guinea_dictionary = {}
var new_pig = null
var upgrade_guinea_id = null
var poop_speed_upgrade_amount = 0.0
var double_poop_upgrade_amount = 0
var giant_poop_upgrade_minimum = 0
var giant_poop_upgrade_maximum = 0

#Unique upgrades
var squeek_frenzy_purchased = false
var squeek_frenzy_effect_active = false
var squeek_frenzy_duration = 0

var rain_or_shine_purchased = false
var giant_prismatic_purchased = false
var chroma_prismatic_odds = 1

var copper_poop_purchased = false
var copper_poop_value = 1

#Poop counts
var poop_amount = 9999999
var diamond_poop_amount = 99999999
var prismatic_poop_amount = 9999999

var currently_raining = false

#Shop purchases
var guinea_two_purchased = false
var rich_guinea_purchased = false
var rainbow_guinea_purchased = false
var king_calix_purchased = false

var guinea_pigs_purchased = 0
var pet_count = 0

#Achievements
var gold_rush_achievement_completed = false
var diamond_digger_achievement_completed = false
var taste_rainbow_achievement_completed = false
var colossal_crusher_achievement_completed = false
var poop_frenzy_achievement_completed = false
var disco_party_achievement_completed = false
var manure_millionare_achievement_completed = false
var petting_professional_achievement_completed = false

#Poop type purchases
var diamond_poop_purchased = false
var giant_poop_purchased = false
var prismatic_poop_purchased = false

var double_poop_purchased = false

#Pig information
var poop_ui_position : Vector2
var movespeed = 0

#Poop drops variables
var state = 0
var poop_drop_speed = 0
var golden_poop_active = false
var gold_poop_pig = null
var golden_poop_dropped = false
var poop_speed_multiplier = 1
var max_speed_upgrade = false
var giant_poop_min = 1
var giant_poop_max = 1.5



'''Scene saving'''
'''
var current_scene = null

func _ready() -> void:
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
	print_debug(current_scene)

func switch_scene(res_path):
	call_deferred("_deferred_switch_scene", res_path)
	
func _deferred_switch_scene(res_path):
	current_scene.free()
	var s = load(res_path)
	current_scene = s.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
'''
