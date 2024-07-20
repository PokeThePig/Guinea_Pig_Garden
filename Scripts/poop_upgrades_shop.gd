extends Node2D

@onready var speed_upgrade_assets = load("res://Scenes/Shop/poop_speed_purchase.tscn")
@onready var double_upgrade_assets = load("res://Scenes/Shop/double_poop_drop_purchase.tscn")
@onready var giant_upgrade_assets = load("res://Scenes/Shop/giant_poop_upgrade.tscn")

var current_pig = 1
var current_scroll_size = 800
var pig_instance

signal shop_cam_from_poop_up

func _ready():
	shop_cam_from_poop_up.connect(get_parent().get_node("Shop_Scene").get_node("main_shop_camera")._switch_to_shop_cam_from_poop_up.bind())
	var upgrade_sprite = get_node("ScrollContainer/VBoxContainer/Pig_Sprite")
	upgrade_sprite.texture = load("res://Sprites/Currently Used/Bella Sheet.png")
	current_pig += 1

func _on_poop_up_to_shop_pressed():
	shop_cam_from_poop_up.emit()
	
func _update_poop_upgrades():
	await get_tree().create_timer(.01).timeout
	
	var speed_upgrade_location = $ScrollContainer/VBoxContainer/Poop_Speed_Purchase.global_position.y
	var double_upgrade_location = $ScrollContainer/VBoxContainer/Double_poop_drop_purchase.global_position.y
	var giant_upgrade_location = $ScrollContainer/VBoxContainer/giant_poop_upgrade.global_position.y
	var sprite_upgrade_location = $ScrollContainer/VBoxContainer/Pig_Sprite.global_position.y
	
	pig_instance = instance_from_id(Globals.guinea_dictionary["Guinea" + str(current_pig)])
	current_pig += 1
	current_scroll_size += 250
	$ScrollContainer/VBoxContainer.set_custom_minimum_size(Vector2(0,current_scroll_size))
	var new_speed_upgrades =  speed_upgrade_assets.instantiate()
	var new_double_upgrades = double_upgrade_assets.instantiate()
	var new_giant_upgrades = giant_upgrade_assets.instantiate()
	var new_sprite = $ScrollContainer/VBoxContainer/Pig_Sprite.duplicate()
	get_node("ScrollContainer").get_node("VBoxContainer").add_child(new_speed_upgrades)
	get_node("ScrollContainer").get_node("VBoxContainer").add_child(new_double_upgrades)
	get_node("ScrollContainer").get_node("VBoxContainer").add_child(new_giant_upgrades)
	get_node("ScrollContainer").get_node("VBoxContainer").add_child(new_sprite)
	new_sprite.texture = pig_instance.get_parent().get_node("Guinea_Pig").get_node("Pig_Sprite").texture
	
	new_speed_upgrades.global_position = Vector2(-2600, speed_upgrade_location + (320 * (current_pig - 2)))
	new_double_upgrades.global_position = Vector2(-2192, double_upgrade_location + (320 * (current_pig - 2)))
	new_giant_upgrades.global_position = Vector2(-1776, giant_upgrade_location + (320 * (current_pig - 2)))
	new_sprite.global_position = Vector2(-2935, sprite_upgrade_location + (320 * (current_pig - 2)))
