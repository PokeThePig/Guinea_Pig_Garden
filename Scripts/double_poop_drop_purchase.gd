extends Node2D

var double_poop_tier = 0

func _on_upgrade_button_pressed():
	if (Globals.poop_amount >= 50) and (Globals.double_poop_purchased == false) and (double_poop_tier == 0):
		Globals.poop_amount -= 50
		Globals.double_poop_purchased = true
		$upgrade_button.text = "Buy Double Poop Upgrade\n150 Poop"
		$Double_poop_count.text = "1/3"
		double_poop_tier = 1
	elif (Globals.poop_amount >= 150) and (double_poop_tier == 1):
		Globals.poop_amount -= 150
		Globals.double_poop_chance = 5
		$upgrade_button.text = "Buy Double Poop Upgrade\n300 Poop"
		$Double_poop_count.text = "2/3"
		double_poop_tier = 2
	elif (Globals.poop_amount >= 300) and (double_poop_tier == 2):
		Globals.poop_amount -= 300
		Globals.double_poop_chance = 3
		$upgrade_button.text = "MAXED"
		$Double_poop_count.text = "3/3"
		double_poop_tier = 3
		
	
