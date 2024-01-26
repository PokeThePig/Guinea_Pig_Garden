extends Node2D


func _on_button_pressed():
	if (Globals.poop_amount >= 5) and (Globals.giant_poop_purchased == false):
		Globals.giant_poop_purchased = true
		Globals.poop_amount -= 5
		$Button.text = "SOLD OUT"
		pass
