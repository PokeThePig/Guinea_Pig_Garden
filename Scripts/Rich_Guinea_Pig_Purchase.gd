extends Node2D

@onready var guinea_pig_assets = load("res://Scenes/Garden/Guinea_Pig.tscn")

signal pig_purchased

func _ready():
	pig_purchased.connect(get_parent().get_parent().get_node("Shop_Scene")._item_purchased.bind())

func _on_button_pressed():
	if (Globals.diamond_poop_amount >= 1) and (Globals.rich_guinea_purchased == false):
		Globals.diamond_poop_amount -= 1

		var new_pig = guinea_pig_assets.instantiate()
		get_parent().add_child(new_pig)
		new_pig.global_position = Vector2(0,0)
		
		var new_pig_sprite = new_pig.get_node("Guinea_Pig").get_node("Pig_Sprite")
		new_pig_sprite.texture = load("res://Sprites/Currently Used/Fancy Pig Sheet.png")
		
		var new_pig_assets = new_pig.get_node("Guinea_Pig")
		new_pig_assets.set_scale(Vector2(1.2, 1.2))
		
		$Button.text = "SOLD OUT"
		pig_purchased.emit()
		
		Globals.rich_guinea_purchased = true
