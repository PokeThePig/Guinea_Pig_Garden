extends Node2D


signal upgrade_purchased

var upgrades_left = 5
var description_text = "Clicking Butterscotch causes a random guinea pig to squeek and poop after him, further chaining to other guinea pigs."

# Called when the node enters the scene tree for the first time.
func _ready():
	upgrade_purchased.connect(get_tree().get_root().get_node("Main_Tree").get_node("Shop_Scene")._item_purchased.bind())
	await get_tree().create_timer(.5).timeout
	upgrades_left = Globals.upgrade_dictionary["Butterscotch"][4]
	_update_upgrade_information()


# NEEDS WORK
func _on_upgrade_button_pressed():
	if (Globals.squeek_chain_purchased == false) and (Globals.poop_amount >= 30000) and (upgrades_left == 5):
		Globals.squeek_chain_purchased = true
		Globals.poop_amount -= 30000
		upgrades_left -= 1
		Globals.squeek_chain_value = 1
		_update_upgrade_information()
		upgrade_purchased.emit()
		Globals.upgrade_dictionary["Butterscotch"][4] = upgrades_left
	elif ((Globals.squeek_chain_purchased == true) and (Globals.poop_amount >= 10000) and (Globals.prismatic_poop_amount >= 100) and (upgrades_left == 4)):
		Globals.poop_amount -= 10000
		Globals.prismatic_poop_amount -= 100
		upgrades_left -= 1
		Globals.squeek_chain_value = 2
		_update_upgrade_information()
		upgrade_purchased.emit()
		Globals.upgrade_dictionary["Butterscotch"][4] = upgrades_left
	elif ((Globals.squeek_chain_purchased == true) and (Globals.poop_amount >= 15000) and (Globals.prismatic_poop_amount >= 250) and (upgrades_left == 3)):
		Globals.poop_amount -= 15000
		Globals.prismatic_poop_amount -= 250
		upgrades_left -= 1
		Globals.squeek_chain_value = 3
		_update_upgrade_information()
		upgrade_purchased.emit()
		Globals.upgrade_dictionary["Butterscotch"][4] = upgrades_left
	elif ((Globals.squeek_chain_purchased == true) and (Globals.poop_amount >= 20000) and (Globals.prismatic_poop_amount >= 500) and (upgrades_left == 2)):
		Globals.poop_amount -= 20000
		Globals.prismatic_poop_amount -= 500
		upgrades_left -= 1
		Globals.squeek_chain_value = 4
		_update_upgrade_information()
		upgrade_purchased.emit()
		Globals.upgrade_dictionary["Butterscotch"][4] = upgrades_left
	elif ((Globals.squeek_chain_purchased == true) and (Globals.poop_amount >= 30000) and (Globals.prismatic_poop_amount >= 1000) and (upgrades_left == 1)):
		Globals.poop_amount -= 30000
		Globals.prismatic_poop_amount -= 1000
		upgrades_left -= 1
		Globals.squeek_chain_value = 5
		_update_upgrade_information()
		upgrade_purchased.emit()
		Globals.upgrade_dictionary["Butterscotch"][4] = upgrades_left

func _update_upgrade_information():
	if upgrades_left == 4:
		$Squeek_Chain_Label.text = "Squeek Chain\n10000 Poop\n100 Prismatic Poop"
		$squeek_chain_count.text = "1/5"
		$squeek_chain_description.text = (description_text + "\n[1 > 2 Other Guinea Pigs]")
	elif upgrades_left == 3:
		$Squeek_Chain_Label.text = "Squeek Chain\n15000 Poop\n250 Prismatic Poop"
		$squeek_chain_count.text = "2/5"
		$squeek_chain_description.text = (description_text + "\n[2 > 3 Other Guinea Pigs]")
	elif upgrades_left == 2:
		$Squeek_Chain_Label.text = "Squeek Chain\n20000 Poop\n500 Prismatic Poop"
		$squeek_chain_count.text = "3/5"
		$squeek_chain_description.text = (description_text + "\n[3 > 4 Other Guinea Pigs]")
	elif upgrades_left == 1:
		$Squeek_Chain_Label.text = "Squeek Chain\n30000 Poop\n1000 Prismatic Poop"
		$squeek_chain_count.text = "4/5"
		$squeek_chain_description.text = (description_text + "\n[4 > 5 Other Guinea Pigs]")
	elif upgrades_left == 0:
		$Squeek_Chain_Label.text = "MAXED"
		$Squeek_Chain_Label.vertical_alignment = 1
		$squeek_chain_count.text = "5/5"
		$squeek_chain_description.text = ("Clicking Butterscotch causes a random guinea pig to squeek and poop after him, further chaining to other guinea pigs.\n[5 Other Guinea Pigs]")

func _on_upgrade_button_mouse_entered():
	$squeek_chain_description.visible = true


func _on_upgrade_button_mouse_exited():
	$squeek_chain_description.visible = false


func _on_upgrade_button_button_down() -> void:
	$Squeek_Chain_Label.position = Vector2(-144, 0)


func _on_upgrade_button_button_up() -> void:
	$Squeek_Chain_Label.position = Vector2(-144, -12)
