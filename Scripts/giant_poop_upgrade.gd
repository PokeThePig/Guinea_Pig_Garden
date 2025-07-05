extends Node2D

var upgrades_left = 3
var guinea_id = null
signal upgrade_purchased

func _ready():
	await get_tree().create_timer(.5).timeout
	upgrade_purchased.connect(get_tree().get_root().get_node("Main_Tree").get_node("Shop_Scene")._item_purchased.bind())
	
	for pig in get_tree().get_nodes_in_group("Pig"):
		upgrade_purchased.connect(pig._update_giant_poop.bind())
	await get_tree().create_timer(.5).timeout
	for key in Globals.upgrade_dictionary:
		if Globals.upgrade_dictionary[key][0] == get_parent().get_parent().get_instance_id():
			for pig in Globals.guinea_dictionary:
				if pig == key:
					guinea_id = instance_from_id(Globals.guinea_dictionary[pig])
					upgrades_left = Globals.upgrade_dictionary[key][3]
		_update_upgrade_information()
	
func _on_upgrade_giant_poop_button_pressed():
	for key in Globals.upgrade_dictionary:
		if Globals.upgrade_dictionary[key][0] == get_parent().get_parent().get_instance_id():
			for pig in Globals.guinea_dictionary:
				if pig == key:
					guinea_id = instance_from_id(Globals.guinea_dictionary[pig])
	if (upgrades_left == 3) and (Globals.poop_amount >= 500):
		Globals.poop_amount -= 500
		upgrades_left = 2
		Globals.giant_poop_upgrade_minimum = 1.25
		Globals.giant_poop_upgrade_maximum = 2
		Globals.upgrade_guinea_id = guinea_id
		upgrade_purchased.emit()
		_update_upgrade_information()
		_update_upgrade_dictionary()
	elif (upgrades_left == 2) and (Globals.poop_amount >= 1000):
		Globals.poop_amount -= 1000
		upgrades_left = 1
		Globals.giant_poop_upgrade_minimum = 1.75
		Globals.giant_poop_upgrade_maximum = 2.5
		Globals.upgrade_guinea_id = guinea_id
		upgrade_purchased.emit()
		_update_upgrade_information()
		_update_upgrade_dictionary()
	elif (upgrades_left == 1) and (Globals.poop_amount >= 2500):
		Globals.poop_amount -= 2500
		upgrades_left = 0
		Globals.giant_poop_upgrade_minimum = 2.25
		Globals.giant_poop_upgrade_maximum = 3
		Globals.upgrade_guinea_id = guinea_id
		upgrade_purchased.emit()
		_update_upgrade_information()
		_update_upgrade_dictionary()

func _update_bella():
	await get_tree().create_timer(.3).timeout
	if guinea_id == instance_from_id(Globals.guinea_dictionary["Bella"]):
			upgrades_left = Globals.upgrade_dictionary["Bella"][3]
			_update_upgrade_information()

func _update_upgrade_information():
	if upgrades_left == 2:
		$Giant_Poop_Upgrade_Label.text = "Upgrade Giant Poop\n1000 Poop"
		$giant_poop_upgrade_count.text = "1/3"
		$Giant_poop_upgrade_description.text = "Increases minimum and maximum value of giant poop drops.\nMinimum: [150 > 300]\nMaximum: [400 > 625]"
	elif upgrades_left == 1:
		$Giant_Poop_Upgrade_Label.text = "Upgrade Giant Poop\n2500 Poop"
		$giant_poop_upgrade_count.text = "2/3"
		$Giant_poop_upgrade_description.text = "Increases minimum and maximum value of giant poop drops.\nMinimum: [300 > 500]\nMaximum: [625 > 900]"
	elif upgrades_left == 0:
		$Giant_Poop_Upgrade_Label.text = "MAXED"
		$giant_poop_upgrade_count.text = "3/3"
		$Giant_poop_upgrade_description.text = "Increases minimum and maximum value of giant poop drops.\nMinimum: [500]\nMaximum: [900]"
	

func _update_upgrade_dictionary():
	for guinea_key in Globals.guinea_dictionary:
				if (Globals.guinea_dictionary[guinea_key] == guinea_id.get_instance_id()):
					for upgrade_key in Globals.upgrade_dictionary.keys():
						if guinea_key == upgrade_key:
							Globals.upgrade_dictionary[guinea_key][3] = upgrades_left
							print(Globals.upgrade_dictionary)


func _on_upgrade_giant_poop_button_mouse_entered():
	$Giant_poop_upgrade_description.visible = true


func _on_upgrade_giant_poop_button_mouse_exited():
	$Giant_poop_upgrade_description.visible = false


func _on_upgrade_giant_poop_button_button_down() -> void:
	$Giant_Poop_Upgrade_Label.position = Vector2(-144, 8)


func _on_upgrade_giant_poop_button_button_up() -> void:
	$Giant_Poop_Upgrade_Label.position = Vector2(-144, 0)
