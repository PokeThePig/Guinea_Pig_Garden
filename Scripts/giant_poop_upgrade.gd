extends Node2D

var upgrades_left = 3
var guinea_id = null
signal upgrade_purchased

func _ready():
	upgrade_purchased.connect(get_tree().get_root().get_node("Main_Tree").get_node("Shop_Scene")._item_purchased.bind())
	
	for pig in get_tree().get_nodes_in_group("Pig"):
		upgrade_purchased.connect(pig._update_giant_poop.bind())
		
	guinea_id = instance_from_id(Globals.guinea_dictionary[Globals.new_pig])
	
func _on_upgrade_giant_poop_button_pressed():
	if (upgrades_left == 3) and (Globals.poop_amount >= 500):
		Globals.poop_amount -= 500
		upgrades_left = 2
		Globals.giant_poop_upgrade_minimum = 1.25
		Globals.giant_poop_upgrade_maximum = 2
		Globals.upgrade_guinea_id = guinea_id
		$upgrade_giant_poop_button.text = "Upgrade Giant Poop\n1000 Poop"
		$giant_poop_upgrade_count.text = "1/3"
		$Giant_poop_upgrade_description.text = "Increases minimum and maximum value of giant poop drops.\nMinimum: [150 > 300]\nMaximum: [400 > 625]"
		upgrade_purchased.emit()
	elif (upgrades_left == 2) and (Globals.poop_amount >= 1000):
		Globals.poop_amount -= 1000
		upgrades_left = 1
		Globals.giant_poop_upgrade_minimum = 1.75
		Globals.giant_poop_upgrade_maximum = 2.5
		Globals.upgrade_guinea_id = guinea_id
		$upgrade_giant_poop_button.text = "Upgrade Giant Poop\n2500 Poop"
		$giant_poop_upgrade_count.text = "2/3"
		$Giant_poop_upgrade_description.text = "Increases minimum and maximum value of giant poop drops.\nMinimum: [300 > 500]\nMaximum: [625 > 900]"
		upgrade_purchased.emit()
	elif (upgrades_left == 1) and (Globals.poop_amount >= 2500):
		Globals.poop_amount -= 2500
		upgrades_left = 0
		Globals.giant_poop_upgrade_minimum = 2.25
		Globals.giant_poop_upgrade_maximum = 3
		Globals.upgrade_guinea_id = guinea_id
		$upgrade_giant_poop_button.text = "MAXED"
		$giant_poop_upgrade_count.text = "3/3"
		$Giant_poop_upgrade_description.text = "Increases minimum and maximum value of giant poop drops.\nMinimum: [500]\nMaximum: [900]"
		upgrade_purchased.emit()


func _on_upgrade_giant_poop_button_mouse_entered():
	$Giant_poop_upgrade_description.visible = true


func _on_upgrade_giant_poop_button_mouse_exited():
	$Giant_poop_upgrade_description.visible = false
