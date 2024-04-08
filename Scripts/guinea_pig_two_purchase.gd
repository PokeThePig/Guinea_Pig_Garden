extends Node2D

@onready var guinea_pig_assets = load("res://Scenes/Garden/Guinea_Pig.tscn")

signal pig_purchased
signal pig_two_purchased

func _ready():
	pig_purchased.connect(get_parent().get_parent().get_node("Shop_Scene")._item_purchased.bind())
	pig_two_purchased.connect(get_parent().get_parent().get_node("Poop_Upgrades_Shop").get_node("Poop_Speed_Purchase")._new_pig_purchased.bind())

func _on_button_pressed():
	if (Globals.poop_amount >= 300) and (Globals.guinea_two_purchased == false):
		Globals.poop_amount -= 150
		Globals.guinea_pigs_purchased += 1

		var new_pig = guinea_pig_assets.instantiate()
		get_parent().get_parent().get_node("Garden").add_child(new_pig)
		new_pig.global_position = Vector2(0,0)
		
		var new_pig_sprite = new_pig.get_node("Guinea_Pig").get_node("Pig_Sprite")
		new_pig_sprite.texture = load("res://Sprites/Currently Used/Pixel Guinea Pig 2-Sheet.png")
		
		$Button.text = "SOLD OUT"
		pig_purchased.emit()
		pig_two_purchased.emit()
		
		Globals.guinea_two_purchased = true
