extends Node2D

@onready var guinea_pig_assets = load("res://Scenes/Garden/Guinea_Pig.tscn")

signal pig_purchased
signal rainbow_pig_purchased

func _ready():
	pig_purchased.connect(get_parent().get_parent().get_node("Shop_Scene")._item_purchased.bind())
	rainbow_pig_purchased.connect(get_parent().get_parent().get_node("Poop_Upgrades_Shop").get_node("ScrollContainer").get_node("VBoxContainer").get_node("ScrollContainer").get_node("HBoxContainer").get_node("Poop_Speed_Purchase")._new_pig_purchased.bind())
	rainbow_pig_purchased.connect(get_parent().get_parent().get_node("Poop_Upgrades_Shop")._update_poop_upgrades.bind())
	
func _on_button_pressed():
	if (Globals.prismatic_poop_amount >= 15) and (Globals.rainbow_guinea_purchased == false):
		Globals.prismatic_poop_amount -= 15
		Globals.guinea_pigs_purchased += 1

		var new_pig = guinea_pig_assets.instantiate()
		get_parent().get_parent().get_node("Garden").add_child(new_pig)
		new_pig.global_position = Vector2(randf_range(-4300, 3700), randf_range(-2000, 2000))
		
		var current_pig = get_tree().get_nodes_in_group("Pig")[-1]
		Globals.guinea_dictionary["Chroma"] = current_pig.get_instance_id()
		Globals.new_pig = "Chroma"
		
		var new_pig_sprite = new_pig.get_node("Guinea_Pig").get_node("Pig_Sprite")
		new_pig_sprite.texture = load("res://Sprites/Currently Used/Chroma2.0-Sheet.png")
		
		var new_pig_assets = new_pig.get_node("Guinea_Pig")
		new_pig_assets.set_scale(Vector2(1, 1))
		
		$Chroma_Label.text = "SOLD OUT"
		pig_purchased.emit()
		rainbow_pig_purchased.emit()
		
		Globals.rainbow_guinea_purchased = true
		Globals.guinea_purchase_order.append("Chroma")


func _on_button_button_down() -> void:
	$Chroma_Label.position = Vector2(-144, 8)

func _on_button_button_up() -> void:
	$Chroma_Label.position = Vector2(-144, 0)
