extends Node2D

@onready var guinea_pig_assets = load("res://Scenes/Garden/Guinea_Pig.tscn")

signal shop_opened
signal achievements_opened

var pig_count = 1
var pig_name = "Guinea1"

func _ready():
	shop_opened.connect(get_parent().get_node("Shop_Scene").get_node("main_shop_camera")._switch_to_shop_cam.bind())
	achievements_opened.connect(get_parent().get_node("Achievements_Screen").get_node("achievements_cam")._switch_to_achievements_cam.bind())
	
	var new_pig = guinea_pig_assets.instantiate()
	add_child(new_pig)
	new_pig.global_position = Vector2(0,0)
		
	var new_pig_sprite = new_pig.get_node("Guinea_Pig").get_node("Pig_Sprite")
	new_pig_sprite.texture = load("res://Sprites/Currently Used/Bella Sheet.png")
	
	_update_guinea_dictionary()

func _on_hud_open_shop():
	shop_opened.emit()
	$Day_Night_Cycle.visible = false

func _switch_to_achievements_cam():
	achievements_opened.emit()
	$Day_Night_Cycle.visible = false
	
func _update_guinea_dictionary():
	var current_pig = get_tree().get_nodes_in_group("Pig")[-1]
	Globals.guinea_dictionary[pig_name] = current_pig.get_instance_id()
	pig_count += 1
	pig_name[6] = str(pig_count)
	print(Globals.guinea_dictionary)
	

