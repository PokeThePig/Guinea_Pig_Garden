extends Node2D

var current_pig = 1
var pig_instance

@onready var upgrade_row_assets = load("res://Scenes/Shop/scroll_container.tscn")

#Unique upgrades
var unique_upgrade = null
@onready var squeek_frenzy_assets = load("res://Scenes/Shop/squeek_frenzy_purchase.tscn")
@onready var rain_or_shine_assets = load("res://Scenes/Shop/rain_or_shine_purchase.tscn")

signal shop_cam_from_poop_up

func _ready():
	shop_cam_from_poop_up.connect(get_parent().get_node("Shop_Scene").get_node("main_shop_camera")._switch_to_shop_cam_from_poop_up.bind())
	var upgrade_sprite = get_node("ScrollContainer/VBoxContainer/ScrollContainer/HBoxContainer/Pig_Sprite")
	upgrade_sprite.texture = load("res://Sprites/Currently Used/Bella Sheet.png")
	unique_upgrade = squeek_frenzy_assets.instantiate()
	get_node("ScrollContainer").get_node("VBoxContainer").get_node("ScrollContainer").get_node("HBoxContainer").add_child(unique_upgrade)
	unique_upgrade.global_position = $ScrollContainer/VBoxContainer/ScrollContainer/HBoxContainer/Unique_upgrade_placeholder.global_position
	unique_upgrade = null
	
	current_pig += 1

func _on_poop_up_to_shop_pressed():
	shop_cam_from_poop_up.emit()
	
func _update_poop_upgrades():
	await get_tree().create_timer(.01).timeout
	var upgrade_row_location = $ScrollContainer/VBoxContainer/ScrollContainer.global_position.y
	pig_instance = instance_from_id(Globals.guinea_dictionary[Globals.new_pig])
	current_pig += 1
	
	#Adding row
	var new_upgrade_row = upgrade_row_assets.instantiate()
	get_node("ScrollContainer").get_node("VBoxContainer").add_child(new_upgrade_row)
	
	#Customizing row
	new_upgrade_row.get_node("HBoxContainer").get_node("Pig_Sprite").texture = pig_instance.get_parent().get_node("Guinea_Pig").get_node("Pig_Sprite").texture
	new_upgrade_row.global_position = Vector2(-9149, upgrade_row_location + (100 * (current_pig - 2)))
	
	if (Globals.rainbow_guinea_purchased == true):
		if (pig_instance == instance_from_id(Globals.guinea_dictionary["Chroma"])):
			unique_upgrade = rain_or_shine_assets.instantiate()
			new_upgrade_row.get_node("HBoxContainer").add_child(unique_upgrade)
			unique_upgrade.global_position = new_upgrade_row.get_node("HBoxContainer").get_node("Unique_upgrade_placeholder").global_position
