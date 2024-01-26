extends Node

#Poop counts
var poop_amount = 1000
var diamond_poop_amount = 0

#Shop purchases
var guinea_two_purchased = false
var diamond_poop_purchased = false
var giant_poop_purchased = false

var double_poop_purchased = false
var double_poop_chance = 10

var poop_ui_position : Vector2
var movespeed = 0

#poop drops variables
var movement_state = 0
var poop_drop_speed = 0
var golden_poop_active = false
var golden_poop_dropped = false
var poop_speed_multiplier = 1



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
