extends Node2D

var upgrades_left = 3
signal upgrade_purchased

func _ready():
	upgrade_purchased.connect(get_parent().get_parent().get_node("Shop_Scene")._item_purchased.bind())
	
func _on_upgrade_giant_poop_button_pressed():
	if (upgrades_left == 3) and (Globals.poop_amount >= 500):
		Globals.poop_amount -= 500
		upgrades_left = 2
		Globals.giant_poop_min = 1.25
		Globals.giant_poop_max = 2
		$upgrade_giant_poop_button.text = "Upgrade Giant Poop\n1000 Poop"
		$giant_poop_upgrade_count.text = "1/3"
		upgrade_purchased.emit()
	elif (upgrades_left == 2) and (Globals.poop_amount >= 1000):
		Globals.poop_amount -= 1000
		upgrades_left = 1
		Globals.giant_poop_min = 1.75
		Globals.giant_poop_max = 2.5
		$upgrade_giant_poop_button.text = "Upgrade Giant Poop\n2500 Poop"
		$giant_poop_upgrade_count.text = "2/3"
		upgrade_purchased.emit()
	elif (upgrades_left == 1) and (Globals.poop_amount >= 2500):
		Globals.poop_amount -= 2500
		upgrades_left = 0
		Globals.giant_poop_min = 2
		Globals.giant_poop_max = 3
		$upgrade_giant_poop_button.text = "MAXED"
		$giant_poop_upgrade_count.text = "3/3"
		upgrade_purchased.emit()
