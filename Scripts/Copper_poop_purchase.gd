extends Node2D

signal upgrade_purchased

var upgrades_left = 3
var description_text = "Increases value of copper poop."

# Called when the node enters the scene tree for the first time.
func _ready():
	upgrade_purchased.connect(get_tree().get_root().get_node("Main_Tree").get_node("Shop_Scene")._item_purchased.bind())


func _on_upgrade_button_pressed():
	if (Globals.copper_poop_purchased == false) and (Globals.poop_amount >= 10000) and (upgrades_left == 3):
		Globals.copper_poop_purchased = true
		Globals.poop_amount -= 10000
		upgrades_left -= 1
		Globals.copper_poop_value = 2
		$upgrade_button.text = "Copper Poop\n20000 Poop"
		$copper_poop_count.text = "1/3"
		$copper_poop_description.text = (description_text + "\n[2 > 3]")
		upgrade_purchased.emit()
	elif ((Globals.copper_poop_purchased == true) and (Globals.poop_amount >= 20000) and (upgrades_left == 2)):
		Globals.poop_amount -= 20000
		upgrades_left -= 1
		Globals.copper_poop_value = 3
		$upgrade_button.text = "Copper Poop\n50000 Poop"
		$copper_poop_count.text = "2/3"
		$copper_poop_description.text = (description_text + "\n[3 > 5]")
		upgrade_purchased.emit()
	elif ((Globals.copper_poop_purchased == true) and (Globals.poop_amount >= 50000) and (upgrades_left == 1)):
		Globals.poop_amount -= 50000
		upgrades_left -= 1
		Globals.copper_poop_value = 5
		$upgrade_button.text = "MAXED"
		$copper_poop_count.text = "3/3"
		$copper_poop_description.text = (description_text + "\n[5]")
		upgrade_purchased.emit()


func _on_upgrade_button_mouse_entered():
	$copper_poop_description.visible = true


func _on_upgrade_button_mouse_exited():
	$copper_poop_description.visible = false
