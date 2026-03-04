extends Node2D

@onready var guinea_pig_assets = load("res://Scenes/Garden/Guinea_Pig.tscn")

var face_left = true

signal pig_purchased
signal butterscotch_purchased

func _ready():
	pig_purchased.connect(get_parent().get_parent().get_node("Shop_Scene")._item_purchased.bind())
	butterscotch_purchased.connect(get_parent().get_parent().get_node("Poop_Upgrades_Shop").get_node("ScrollContainer").get_node("VBoxContainer").get_node("ScrollContainer").get_node("HBoxContainer").get_node("Poop_Speed_Purchase")._new_pig_purchased.bind())
	butterscotch_purchased.connect(get_parent().get_parent().get_node("Poop_Upgrades_Shop")._update_poop_upgrades.bind())

func _on_button_pressed():
	if (Globals.diamond_poop_amount >= 1) and (Globals.butterscotch_purchased == false):
		Globals.diamond_poop_amount -= 1
		Globals.guinea_pigs_purchased += 1

		var new_pig = guinea_pig_assets.instantiate()
		get_parent().get_parent().get_node("Garden").add_child(new_pig)
		new_pig.global_position = Vector2(randf_range(-500, 500), randf_range(-200, 200))
		
		var current_pig = get_tree().get_nodes_in_group("Pig")[-1]
		Globals.guinea_dictionary["Butterscotch"] = current_pig.get_instance_id()
		Globals.new_pig = "Butterscotch"
		
		var new_pig_sprite = new_pig.get_node("Guinea_Pig").get_node("Pig_Sprite")
		new_pig_sprite.texture = load("res://Sprites/Currently Used/Butterscotch-Left-Sheet.png")
		
		$Butterscotch_Label.text = "SOLD OUT"
		pig_purchased.emit()
		butterscotch_purchased.emit()
		
		Globals.butterscotch_purchased = true
		Globals.guinea_purchase_order.append("Butterscotch")



func _on_button_button_down() -> void:
	$Butterscotch_Label.position = Vector2(-144, 8)


func _on_button_button_up() -> void:
	$Butterscotch_Label.position = Vector2(-144, 0)



func _on_timer_timeout() -> void:
	if face_left:
		$Sprite2D.texture = load("res://Sprites/Currently Used/Butterscotch-Right-Sheet.png")
		$Sprite2D.flip_h = true
		face_left = false
	else:
		$Sprite2D.texture = load("res://Sprites/Currently Used/Butterscotch-Left-Sheet.png")
		$Sprite2D.flip_h = false
		face_left = true
