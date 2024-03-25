extends Node2D

signal poop_speed_purchased
signal upgrade_purchased

var upgrades_left = 5

func _ready():
	poop_speed_purchased.connect(get_parent().get_parent().get_node("Garden").get_node("Pig").get_node("Guinea_Pig")._update_poop_speed.bind())
	upgrade_purchased.connect(get_parent().get_parent().get_node("Shop_Scene")._item_purchased.bind())
	
	
func _on_upgrade_button_pressed():
	if (upgrades_left == 5) and (Globals.poop_amount >= 10):
		upgrades_left = 4
		Globals.poop_amount -= 10
		Globals.poop_speed_multiplier -= 0.2
		%upgrade_button.text = "Upgrade Poop Speed \n 25 Poop"
		%Poop_speed_count.text = "1/5"
		poop_speed_purchased.emit()
		upgrade_purchased.emit()
	elif (upgrades_left == 4) and (Globals.poop_amount >= 25):
		upgrades_left = 3
		Globals.poop_amount -= 25
		Globals.poop_speed_multiplier -= 0.2
		%upgrade_button.text = "Upgrade Poop Speed \n 50 Poop"
		%Poop_speed_count.text = "2/5"
		poop_speed_purchased.emit()
		upgrade_purchased.emit()
	elif (upgrades_left == 3) and (Globals.poop_amount >= 50):
		upgrades_left = 2
		Globals.poop_amount -= 50
		Globals.poop_speed_multiplier -= 0.2
		%upgrade_button.text = "Upgrade Poop Speed \n 100 Poop"
		%Poop_speed_count.text = "3/5"
		poop_speed_purchased.emit()
		upgrade_purchased.emit()
	elif (upgrades_left == 2) and (Globals.poop_amount >= 100):
		upgrades_left = 1
		Globals.poop_amount -= 100
		Globals.poop_speed_multiplier -= 0.2
		%upgrade_button.text = "Upgrade Poop Speed \n 200 Poop"
		%Poop_speed_count.text = "4/5"
		poop_speed_purchased.emit()
		upgrade_purchased.emit()
	elif (upgrades_left == 1) and (Globals.poop_amount >= 200):
		upgrades_left = 0
		Globals.poop_amount -= 200
		Globals.poop_speed_multiplier -= 0.1
		%upgrade_button.text = "MAXED"
		%Poop_speed_count.text = "5/5"
		poop_speed_purchased.emit()
		upgrade_purchased.emit()


