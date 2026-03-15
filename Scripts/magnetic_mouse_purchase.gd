extends Node2D

signal upgrade_purchased

var upgrades_left = 3

func _ready():
	await get_tree().create_timer(.5).timeout
	upgrade_purchased.connect(get_tree().get_root().get_node("Main_Tree").get_node("Shop_Scene")._item_purchased.bind())
	upgrades_left = Globals.cleanup_upgrades[0]
	_update_upgrade_information()

func _on_upgrade_button_pressed() -> void:
	if (upgrades_left == 3) and (Globals.poop_amount >= 1000):
		Globals.poop_amount -= 1000
		Globals.magnetic_cursor_unlocked = true
		Globals.magnetic_cursor_size = 50
		Globals.magnetic_cursor_speed = 100
		upgrades_left -= 1
		Globals.cleanup_upgrades[0] = 2
		upgrade_purchased.emit()
		_update_upgrade_information()
	elif (upgrades_left == 2) and (Globals.poop_amount >= 2000):
		Globals.poop_amount -= 2000
		Globals.magnetic_cursor_size = 100
		Globals.magnetic_cursor_speed = 200
		upgrades_left -= 1
		Globals.cleanup_upgrades[0] = 1
		upgrade_purchased.emit()
		_update_upgrade_information()
	elif (upgrades_left == 1) and (Globals.poop_amount >= 3000):
		Globals.poop_amount -= 3000
		Globals.magnetic_cursor_size = 150
		Globals.magnetic_cursor_speed = 300
		upgrades_left -= 1
		Globals.cleanup_upgrades[0] = 0
		upgrade_purchased.emit()
		_update_upgrade_information()
		
		
func _update_upgrade_information():
	if upgrades_left == 2:
		%magnetic_label.text = "Magnetic Cursor\n2000 Poop"
		%magnetic_count.text = "1/3"
		$magnetic_description.text = "Increases range and speed cursor pulls in poop from a distance\n(Excludes gold and king poops)\n[50px>100px]\n[100px/s>200/pxs]"
	elif upgrades_left == 1:
		%magnetic_label.text = "Magnetic Cursor\n3000 Poop"
		%magnetic_count.text = "2/3"
		$magnetic_description.text = "Increases range and speed cursor pulls in poop from a distance\n(Excludes gold and king poops)\n[100px>150px]\n[200px/s>300/pxs]"
	elif upgrades_left == 0:
		%magnetic_label.text = "MAXED"
		%magnetic_count.text = "3/3"
		$magnetic_description.text = "Increases range and speed cursor pulls in poop from a distance\n(Excludes gold and king poops)\n[150px]\n[300px/s]"

func _on_upgrade_button_mouse_entered():
	$magnetic_description.visible = true


func _on_upgrade_button_mouse_exited():
	$magnetic_description.visible = false


func _on_upgrade_button_button_down() -> void:
	$magnetic_label.position = Vector2(-128, 8)


func _on_upgrade_button_button_up() -> void:
	$magnetic_label.position = Vector2(-128, 0)
