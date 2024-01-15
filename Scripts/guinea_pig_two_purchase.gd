extends Node2D

@onready var guinea_pig_assets = load("res://Scenes/Garden/Guinea_Pig.tscn")

signal pig_two_purchased

func _on_button_pressed():
	if (Globals.poop_amount >= 10) and (Globals.guinea_two_purchased == false):
		print("enough")
		Globals.poop_amount -= 10
				
		#var new_pig = guinea_pig_assets.instantiate()
		#get_parent().add_child(new_pig)
		
		Globals.guinea_two_purchased = true
		#new_pig.get_child("Pig_sprite").texture = load("res://Sprites/Pixel_Patrick.aseprite")
	elif (Globals.guinea_two_purchased == true):
		$pig_two_purchased_label.visible = true
		
	else:
		print("not enough")
