extends Node2D

@onready var guinea_pig_assets = load("res://Scenes/Garden/Guinea_Pig.tscn")

signal pig_purchased
signal king_calix_purchased

func _ready():
	pig_purchased.connect(get_parent().get_parent().get_node("Shop_Scene")._item_purchased.bind())
	king_calix_purchased.connect(get_parent().get_parent().get_node("Poop_Upgrades_Shop").get_node("ScrollContainer").get_node("VBoxContainer").get_node("ScrollContainer").get_node("HBoxContainer").get_node("Poop_Speed_Purchase")._new_pig_purchased.bind())
	king_calix_purchased.connect(get_parent().get_parent().get_node("Poop_Upgrades_Shop")._update_poop_upgrades.bind())

func _on_button_pressed():
	if (Globals.poop_amount >= 50000) and (Globals.prismatic_poop_amount >= 500) and (Globals.diamond_poop_amount >= 5) and (Globals.king_calix_purchased == false):
		Globals.poop_amount -= 50000
		Globals.prismatic_poop_amount -= 500
		Globals.diamond_poop_amount -= 5
		Globals.guinea_pigs_purchased += 1

		var new_pig = guinea_pig_assets.instantiate()
		get_parent().get_parent().get_node("Garden").add_child(new_pig)
		new_pig.global_position = Vector2(0,0)
		
		var current_pig = get_tree().get_nodes_in_group("Pig")[-1]
		Globals.guinea_dictionary["Calix"] = current_pig.get_instance_id()
		Globals.new_pig = "Calix"
		
		var new_pig_sprite = new_pig.get_node("Guinea_Pig").get_node("Pig_Sprite")
		new_pig_sprite.texture = load("res://Sprites/Currently Used/King Calix-Sheet Final.png")
		
		var new_pig_assets = new_pig.get_node("Guinea_Pig")
		new_pig_assets.set_scale(Vector2(1, 1))
		new_pig_assets.get_node("CollisionShape2D").set_scale(Vector2(0.212, 0.3))
		new_pig_assets.get_node("CollisionShape2D").global_position = (Vector2(-40, 50))
		
		$Button.text = "SOLD OUT"
		pig_purchased.emit()
		king_calix_purchased.emit()
		
		Globals.king_calix_purchased = true
