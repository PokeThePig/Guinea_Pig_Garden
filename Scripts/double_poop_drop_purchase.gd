extends Node2D

var double_poop_tier = 0
var guinea_id = ""
signal upgrade_purchased

func _ready():
	upgrade_purchased.connect(get_parent().get_parent().get_parent().get_parent().get_node("Shop_Scene")._item_purchased.bind())
	for pig in get_tree().get_nodes_in_group("Pig"):
		upgrade_purchased.connect(pig._update_double_poop.bind())
	
	guinea_id = instance_from_id(Globals.guinea_dictionary["Guinea" + str(Globals.guinea_pigs_purchased + 1)])

func _on_upgrade_button_pressed():
	if (Globals.poop_amount >= 25) and (Globals.double_poop_purchased == false) and (double_poop_tier == 0):
		Globals.poop_amount -= 25
		Globals.upgrade_guinea_id = guinea_id
		Globals.double_poop_upgrade_amount = 10
		$upgrade_button.text = "Buy Double Poop Upgrade\n75 Poop"
		$Double_poop_count.text = "1/3"
		upgrade_purchased.emit()
		double_poop_tier = 1
	elif (Globals.poop_amount >= 75) and (double_poop_tier == 1):
		Globals.poop_amount -= 75
		Globals.double_poop_upgrade_amount = 5
		Globals.upgrade_guinea_id = guinea_id
		$upgrade_button.text = "Buy Double Poop Upgrade\n300 Poop"
		$Double_poop_count.text = "2/3"
		upgrade_purchased.emit()
		double_poop_tier = 2
	elif (Globals.poop_amount >= 300) and (double_poop_tier == 2):
		Globals.poop_amount -= 300
		Globals.double_poop_upgrade_amount = 3
		Globals.upgrade_guinea_id = guinea_id
		$upgrade_button.text = "MAXED"
		$Double_poop_count.text = "3/3"
		upgrade_purchased.emit()
		double_poop_tier = 3
		
	
