extends Node2D

@onready var guinea_pig_assets = load("res://Scenes/Garden/Guinea_Pig.tscn")

signal pig_purchased
signal pig_two_purchased

func _ready():
	pig_purchased.connect(get_parent().get_parent().get_node("Shop_Scene")._item_purchased.bind())
	pig_two_purchased.connect(get_parent().get_parent().get_node("Poop_Upgrades_Shop").get_node("ScrollContainer").get_node("VBoxContainer").get_node("ScrollContainer").get_node("HBoxContainer").get_node("Poop_Speed_Purchase")._new_pig_purchased.bind())
	pig_two_purchased.connect(get_parent().get_parent().get_node("Poop_Upgrades_Shop")._update_poop_upgrades.bind())

func _on_button_pressed():
	if (Globals.poop_amount >= 150) and (Globals.guinea_two_purchased == false):
		Globals.poop_amount -= 150
		Globals.guinea_pigs_purchased += 1

		var new_pig = guinea_pig_assets.instantiate()
		get_parent().get_parent().get_node("Garden").add_child(new_pig)
		new_pig.global_position = Vector2(randf_range(-4300, 3700), randf_range(-2000, 2000))
		
		var current_pig = get_tree().get_nodes_in_group("Pig")[-1]
		Globals.guinea_dictionary["Gizmo"] = current_pig.get_instance_id()
		Globals.new_pig = "Gizmo"
		
		var new_pig_sprite = new_pig.get_node("Guinea_Pig").get_node("Pig_Sprite")
		new_pig_sprite.texture = load("res://Sprites/Currently Used/Gizmo2.0-Sheet.png")
		new_pig_sprite.set_scale(Vector2(33, 32))
		
		$Gizmo_Label.text = "SOLD OUT"
		pig_purchased.emit()
		pig_two_purchased.emit()
		
		Globals.guinea_two_purchased = true
		Globals.guinea_purchase_order.append("Gizmo")


func _on_button_button_down() -> void:
	$Gizmo_Label.position = Vector2(-145, 8)


func _on_button_button_up() -> void:
	$Gizmo_Label.position = Vector2(-145, 0)
