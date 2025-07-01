extends Node2D

var upgrades_left = 3
var guinea_id = null
signal upgrade_purchased

func _ready():
	await get_tree().create_timer(.5).timeout
	upgrade_purchased.connect(get_tree().get_root().get_node("Main_Tree").get_node("Shop_Scene")._item_purchased.bind())
	for pig in get_tree().get_nodes_in_group("Pig"):
		upgrade_purchased.connect(pig._update_double_poop.bind())
	await get_tree().create_timer(.5).timeout
	for key in Globals.upgrade_dictionary:
		if Globals.upgrade_dictionary[key][0] == get_parent().get_parent().get_instance_id():
			for pig in Globals.guinea_dictionary:
				if pig == key:
					guinea_id = instance_from_id(Globals.guinea_dictionary[pig])
					upgrades_left = Globals.upgrade_dictionary[key][2]
		_update_upgrade_information()

func _on_upgrade_button_pressed():
	for key in Globals.upgrade_dictionary:
		if Globals.upgrade_dictionary[key][0] == get_parent().get_parent().get_instance_id():
			for pig in Globals.guinea_dictionary:
				if pig == key:
					guinea_id = instance_from_id(Globals.guinea_dictionary[pig])
	if (Globals.poop_amount >= 25) and (Globals.double_poop_purchased == false) and (upgrades_left == 3):
		Globals.poop_amount -= 25
		Globals.upgrade_guinea_id = guinea_id
		Globals.double_poop_upgrade_amount = 10
		upgrade_purchased.emit()
		upgrades_left -= 1
		_update_upgrade_information()
		_update_upgrade_dictionary()
	elif (Globals.poop_amount >= 75) and (upgrades_left == 2):
		Globals.poop_amount -= 75
		Globals.double_poop_upgrade_amount = 5
		Globals.upgrade_guinea_id = guinea_id
		upgrade_purchased.emit()
		upgrades_left -= 1
		_update_upgrade_information()
		_update_upgrade_dictionary()
	elif (Globals.poop_amount >= 300) and (upgrades_left == 1):
		Globals.poop_amount -= 300
		Globals.double_poop_upgrade_amount = 3
		Globals.upgrade_guinea_id = guinea_id
		upgrade_purchased.emit()
		upgrades_left -= 1
		_update_upgrade_information()
		_update_upgrade_dictionary()

func _update_bella():
	await get_tree().create_timer(.3).timeout
	if guinea_id == instance_from_id(Globals.guinea_dictionary["Bella"]):
			upgrades_left = Globals.upgrade_dictionary["Bella"][2]
			_update_upgrade_information()

func _update_upgrade_information():
	if upgrades_left == 2:
		$upgrade_button.text = "Double Poop Upgrade\n75 Poop"
		$Double_poop_description.text = "Increases chance of two poops being dropped. \n [10% > 20%]"
		$Double_poop_count.text = "1/3"
	elif upgrades_left == 1:
		$upgrade_button.text = "Double Poop Upgrade\n300 Poop"
		$Double_poop_count.text = "2/3"
		$Double_poop_description.text = "Increases chance of two poops being dropped. \n [20% > 33%]"
	elif upgrades_left == 0:
		$upgrade_button.text = "MAXED"
		$Double_poop_count.text = "3/3"
		$Double_poop_description.text = "Increases chance of two poops being dropped. \n [33%]"

func _update_upgrade_dictionary():
	for guinea_key in Globals.guinea_dictionary:
				if (Globals.guinea_dictionary[guinea_key] == guinea_id.get_instance_id()):
					for upgrade_key in Globals.upgrade_dictionary.keys():
						if guinea_key == upgrade_key:
							Globals.upgrade_dictionary[guinea_key][2] = upgrades_left
							print(Globals.upgrade_dictionary)


func _on_upgrade_button_mouse_entered():
	$Double_poop_description.visible = true


func _on_upgrade_button_mouse_exited():
	$Double_poop_description.visible = false
