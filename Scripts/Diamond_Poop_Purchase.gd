extends Node2D

signal diamond_purchased

func _on_button_pressed():
	if (Globals.poop_amount >= 10) and (Globals.diamond_poop_purchased == false):
		print("enough")
		Globals.poop_amount -= 10
		
		Globals.diamond_poop_purchased = true
		
		$Button.text = "SOLD OUT"
