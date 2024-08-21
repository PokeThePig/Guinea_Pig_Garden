extends Node2D

signal poop_speed_purchased
signal upgrade_purchased

var upgrades_left = 5
var guinea_id = null

func _ready():
	for pig in get_tree().get_nodes_in_group("Pig"):
		poop_speed_purchased.connect(pig._update_poop_speed.bind())
	upgrade_purchased.connect(get_tree().get_root().get_node("Main_Tree").get_node("Shop_Scene")._item_purchased.bind())
	
	guinea_id = instance_from_id(Globals.guinea_dictionary[Globals.new_pig])

func _new_pig_purchased():
	var current_pig = get_tree().get_nodes_in_group("Pig")[-1]
	poop_speed_purchased.connect(current_pig._update_poop_speed.bind())

func _on_upgrade_button_pressed():
	if (upgrades_left == 5) and (Globals.poop_amount >= 15):
		upgrades_left = 4
		Globals.poop_amount -= 15
		Globals.upgrade_guinea_id = guinea_id
		Globals.poop_speed_upgrade_amount = 0.2
		%upgrade_button.text = "Upgrade Poop Speed \n 50 Poop"
		%Poop_speed_count.text = "1/5"
		$Poop_speed_description.text = "Increases Poop Speed \n [4s > 3s]"
		poop_speed_purchased.emit()
		upgrade_purchased.emit()
	elif (upgrades_left == 4) and (Globals.poop_amount >= 50):
		upgrades_left = 3
		Globals.poop_amount -= 50
		Globals.upgrade_guinea_id = guinea_id
		Globals.poop_speed_upgrade_amount = 0.2
		%upgrade_button.text = "Upgrade Poop Speed \n 150 Poop"
		%Poop_speed_count.text = "2/5"
		$Poop_speed_description.text = "Increases Poop Speed \n [3s > 2s]"
		poop_speed_purchased.emit()
		upgrade_purchased.emit()
	elif (upgrades_left == 3) and (Globals.poop_amount >= 150):
		upgrades_left = 2
		Globals.poop_amount -= 150
		Globals.upgrade_guinea_id = guinea_id
		Globals.poop_speed_upgrade_amount = 0.2
		%upgrade_button.text = "Upgrade Poop Speed \n 500 Poop"
		%Poop_speed_count.text = "3/5"
		$Poop_speed_description.text = "Increases Poop Speed \n [2s > 1s]"
		poop_speed_purchased.emit()
		upgrade_purchased.emit()
	elif (upgrades_left == 2) and (Globals.poop_amount >= 500):
		upgrades_left = 1
		Globals.poop_amount -= 500
		Globals.upgrade_guinea_id = guinea_id
		Globals.poop_speed_upgrade_amount = 0.2
		%upgrade_button.text = "Upgrade Poop Speed \n 1500 Poop"
		%Poop_speed_count.text = "4/5"
		$Poop_speed_description.text = "Increases Poop Speed \n [1s > .5s]"
		poop_speed_purchased.emit()
		upgrade_purchased.emit()
	elif (upgrades_left == 1) and (Globals.poop_amount >= 1500):
		upgrades_left = 0
		Globals.poop_amount -= 1500
		Globals.upgrade_guinea_id = guinea_id
		Globals.poop_speed_upgrade_amount = 0.1
		%upgrade_button.text = "MAXED"
		%Poop_speed_count.text = "5/5"
		$Poop_speed_description.text = "Increases Poop Speed \n [.5s]"
		Globals.max_speed_upgrade = true
		poop_speed_purchased.emit()
		upgrade_purchased.emit()

func _on_upgrade_button_mouse_entered():
	$Poop_speed_description.visible = true


func _on_upgrade_button_mouse_exited():
	$Poop_speed_description.visible = false
