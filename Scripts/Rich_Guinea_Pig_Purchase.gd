extends Node2D

@onready var guinea_pig_assets = load("res://Scenes/Garden/Guinea_Pig.tscn")

signal pig_purchased
signal rich_pig_purchased

func _ready():
	pig_purchased.connect(get_parent().get_parent().get_node("Shop_Scene")._item_purchased.bind())
	rich_pig_purchased.connect(get_parent().get_parent().get_node("Poop_Upgrades_Shop").get_node("ScrollContainer").get_node("VBoxContainer").get_node("Poop_Speed_Purchase")._new_pig_purchased.bind())
	rich_pig_purchased.connect(get_parent().get_parent().get_node("Garden")._update_guinea_dictionary.bind())
	rich_pig_purchased.connect(get_parent().get_parent().get_node("Poop_Upgrades_Shop")._update_poop_upgrades.bind())

func _on_button_pressed():
	if (Globals.diamond_poop_amount >= 1) and (Globals.rich_guinea_purchased == false):
		Globals.diamond_poop_amount -= 1
		Globals.guinea_pigs_purchased += 1

		var new_pig = guinea_pig_assets.instantiate()
		get_parent().get_parent().get_node("Garden").add_child(new_pig)
		new_pig.global_position = Vector2(0,0)
		
		var new_pig_sprite = new_pig.get_node("Guinea_Pig").get_node("Pig_Sprite")
		new_pig_sprite.texture = load("res://Sprites/Currently Used/Fancy Pig Sheet.png")
		
		var new_pig_assets = new_pig.get_node("Guinea_Pig")
		new_pig_assets.set_scale(Vector2(1.2, 1.2))
		
		$Button.text = "SOLD OUT"
		pig_purchased.emit()
		rich_pig_purchased.emit()
		
		Globals.rich_guinea_purchased = true
