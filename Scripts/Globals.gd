extends Node

#Poop counts
var poop_amount = 999999
var diamond_poop_amount = 5
var prismatic_poop_amount = 10

var currently_raining = false

#Shop purchases
var guinea_two_purchased = false
var rich_guinea_purchased = false
var rainbow_guinea_purchased = false
var king_calix_purchased = false

var guinea_pigs_purchased = 0
var pet_count = 999

var gold_rush_achievement_completed = false
var diamond_digger_achievement_completed = false
var taste_rainbow_achievement_completed = false
var colossal_crusher_achievement_completed = false
var poop_frenzy_achievement_completed = false
var disco_party_achievement_completed = false
var manure_millionare_achievement_completed = false
var petting_professional_achievement_completed = false

var diamond_poop_purchased = false
var giant_poop_purchased = false
var prismatic_poop_purchased = false

var double_poop_purchased = false
var double_poop_chance = 10

var poop_ui_position : Vector2
var movespeed = 0

#poop drops variables
var state = 0
var poop_drop_speed = 0
var golden_poop_active = false
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
