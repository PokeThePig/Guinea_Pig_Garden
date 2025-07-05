extends Node2D

signal upgrade_purchased

var upgrades_left = 3
var description_text = "Increases value of copper poop."

# Called when the node enters the scene tree for the first time.
func _ready():
	upgrade_purchased.connect(get_tree().get_root().get_node("Main_Tree").get_node("Shop_Scene")._item_purchased.bind())
	await get_tree().create_timer(.5).timeout
	upgrades_left = Globals.upgrade_dictionary["Pennybags"][4]
	_update_upgrade_information()


func _on_upgrade_button_pressed():
	if (Globals.copper_poop_purchased == false) and (Globals.poop_amount >= 10000) and (upgrades_left == 3):
		Globals.copper_poop_purchased = true
		Globals.poop_amount -= 10000
		upgrades_left -= 1
		Globals.copper_poop_value = 2
		_update_upgrade_information()
		upgrade_purchased.emit()
		Globals.upgrade_dictionary["Pennybags"][4] = upgrades_left
	elif ((Globals.copper_poop_purchased == true) and (Globals.poop_amount >= 30000) and (Globals.prismatic_poop_amount >= 300) and (upgrades_left == 2)):
		Globals.poop_amount -= 30000
		Globals.prismatic_poop_amount -= 300
		upgrades_left -= 1
		Globals.copper_poop_value = 3
		_update_upgrade_information()
		upgrade_purchased.emit()
		Globals.upgrade_dictionary["Pennybags"][4] = upgrades_left
	elif ((Globals.copper_poop_purchased == true) and (Globals.poop_amount >= 50000) and (Globals.prismatic_poop_amount >= 500) and (Globals.diamond_poop_amount >= 3) and (upgrades_left == 1)):
		Globals.poop_amount -= 50000
		Globals.prismatic_poop_amount -= 500
		Globals.diamond_poop_amount -= 3
		upgrades_left -= 1
		Globals.copper_poop_value = 5
		_update_upgrade_information()
		upgrade_purchased.emit()
		Globals.upgrade_dictionary["Pennybags"][4] = upgrades_left

func _update_upgrade_information():
	if upgrades_left == 2:
		$Copper_Poop_Label.text = "Copper Poop\n30000 Poop\n300 Prismatic Poop"
		$copper_poop_count.text = "1/3"
		$copper_poop_description.text = (description_text + "\n[2 > 3]")
	elif upgrades_left == 1:
		$Copper_Poop_Label.text = "Copper Poop\n50000 Poop\n300 Prismatic Poop\n3 Diamond Poop"
		$copper_poop_count.text = "2/3"
		$copper_poop_description.text = (description_text + "\n[3 > 5]")
	elif upgrades_left == 0:
		$Copper_Poop_Label.text = "MAXED"
		$Copper_Poop_Label.vertical_alignment = 1
		$copper_poop_count.text = "3/3"
		$copper_poop_description.text = (description_text + "\n[5]")


func _on_upgrade_button_mouse_entered():
	$copper_poop_description.visible = true


func _on_upgrade_button_mouse_exited():
	$copper_poop_description.visible = false


func _on_upgrade_button_button_down() -> void:
	$Copper_Poop_Label.position = Vector2(-144, -12)


func _on_upgrade_button_button_up() -> void:
	$Copper_Poop_Label.position = Vector2(-144, -20)
