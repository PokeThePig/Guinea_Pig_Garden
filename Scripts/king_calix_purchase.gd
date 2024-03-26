extends Node2D

@onready var guinea_pig_assets = load("res://Scenes/Garden/Guinea_Pig.tscn")

signal pig_purchased

func _ready():
	pig_purchased.connect(get_parent().get_parent().get_node("Shop_Scene")._item_purchased.bind())

func _on_button_pressed():
	if (Globals.poop_amount >= 10) and (Globals.prismatic_poop_amount >= 5) and (Globals.diamond_poop_amount >= 3) and (Globals.king_calix_purchased == false):
		Globals.poop_amount -= 10
		Globals.prismatic_poop_amount -= 5
		Globals.diamond_poop_amount -= 3

		var new_pig = guinea_pig_assets.instantiate()
		get_parent().get_parent().get_node("Garden").add_child(new_pig)
		new_pig.global_position = Vector2(0,0)
		
		var new_pig_sprite = new_pig.get_node("Guinea_Pig").get_node("Pig_Sprite")
		new_pig_sprite.texture = load("res://Sprites/Currently Used/King Calix-Sheet Final.png")
		
		var new_pig_assets = new_pig.get_node("Guinea_Pig")
		new_pig_assets.set_scale(Vector2(1, 1))
		new_pig_assets.get_node("CollisionShape2D").set_scale(Vector2(0.212, 0.3))
		new_pig_assets.get_node("CollisionShape2D").global_position = (Vector2(-40, 50))
		
		$Button.text = "SOLD OUT"
		pig_purchased.emit()
		
		Globals.king_calix_purchased = true
