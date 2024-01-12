extends Node2D

signal diamond_purchased

func _on_button_pressed():
	if (Globals.poop_amount >= 5) and (Globals.diamond_poop_purchased == false):
		print("enough")
		Globals.poop_amount -= 5
		
		Globals.diamond_poop_purchased = true
		
		diamond_purchased.emit()
	
	elif Globals.diamond_poop_purchased == true:
		$diamond_purchased_label.visible = true
	
	else:
		print("not enough")
