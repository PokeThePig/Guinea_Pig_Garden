extends Node2D


signal upgrade_purchased

var upgrades_left = 5
var description_text = "Increases the amount of time hibernation can last, and in turn increases the amount time only giant poops will drop after awakening.\n(Click to awake early but with a shorter effect)"

# Called when the node enters the scene tree for the first time.
func _ready():
	upgrade_purchased.connect(get_tree().get_root().get_node("Main_Tree").get_node("Shop_Scene")._item_purchased.bind())
	await get_tree().create_timer(.5).timeout
	upgrades_left = Globals.upgrade_dictionary["Gizmo"][4]
	_update_upgrade_information()

func _on_upgrade_button_pressed():
	if (Globals.hibernation_purchased == false) and (Globals.poop_amount >= 30000) and (upgrades_left == 5):
		Globals.hibernation_purchased = true
		Globals.poop_amount -= 30000
		upgrades_left -= 1
		Globals.hibernation_sleep_time = 30
		Globals.hibernation_effect_time = 3
		_update_upgrade_information()
		upgrade_purchased.emit()
		Globals.upgrade_dictionary["Gizmo"][4] = upgrades_left
	elif ((Globals.hibernation_purchased == true) and (Globals.poop_amount >= 10000) and (Globals.prismatic_poop_amount >= 100) and (upgrades_left == 4)):
		Globals.poop_amount -= 10000
		Globals.prismatic_poop_amount -= 100
		upgrades_left -= 1
		Globals.hibernation_sleep_time = 40
		Globals.hibernation_effect_time = 4
		_update_upgrade_information()
		upgrade_purchased.emit()
		Globals.upgrade_dictionary["Gizmo"][4] = upgrades_left
	elif ((Globals.hibernation_purchased == true) and (Globals.poop_amount >= 15000) and (Globals.prismatic_poop_amount >= 250) and (upgrades_left == 3)):
		Globals.poop_amount -= 15000
		Globals.prismatic_poop_amount -= 250
		upgrades_left -= 1
		Globals.hibernation_sleep_time = 60
		Globals.hibernation_effect_time = 6
		_update_upgrade_information()
		upgrade_purchased.emit()
		Globals.upgrade_dictionary["Gizmo"][4] = upgrades_left
	elif ((Globals.hibernation_purchased == true) and (Globals.poop_amount >= 20000) and (Globals.prismatic_poop_amount >= 500) and (upgrades_left == 2)):
		Globals.poop_amount -= 20000
		Globals.prismatic_poop_amount -= 500
		upgrades_left -= 1
		Globals.hibernation_sleep_time = 80
		Globals.hibernation_effect_time = 8
		_update_upgrade_information()
		upgrade_purchased.emit()
		Globals.upgrade_dictionary["Gizmo"][4] = upgrades_left
	elif ((Globals.hibernation_purchased == true) and (Globals.poop_amount >= 30000) and (Globals.prismatic_poop_amount >= 1000) and (upgrades_left == 1)):
		Globals.poop_amount -= 30000
		Globals.prismatic_poop_amount -= 1000
		upgrades_left -= 1
		Globals.hibernation_sleep_time = 100
		Globals.hibernation_effect_time = 10
		_update_upgrade_information()
		upgrade_purchased.emit()
		Globals.upgrade_dictionary["Gizmo"][4] = upgrades_left

func _update_upgrade_information():
	if upgrades_left == 4:
		$Hibernation_Label.text = "Hibernation\n10000 Poop\n100 Prismatic Poop"
		$hibernation_count.text = "1/5"
		$hibernation_description.text = (description_text + "\n[Sleep duration: 30s > 40s]\n[Effect duration: 3s > 4s]")
	elif upgrades_left == 3:
		$Hibernation_Label.text = "Hibernation\n15000 Poop\n250 Prismatic Poop"
		$hibernation_count.text = "2/5"
		$hibernation_description.text = (description_text + "\n[Sleep duration: 40s > 60s]\n[Effect duration: 4s > 6s]")
	elif upgrades_left == 2:
		$Hibernation_Label.text = "Hibernation\n20000 Poop\n500 Prismatic Poop"
		$hibernation_count.text = "3/5"
		$hibernation_description.text = (description_text + "\n[Sleep duration: 60s > 80s]\n[Effect duration: 6s > 8s]")
	elif upgrades_left == 1:
		$Hibernation_Label.text = "Hibernation\n30000 Poop\n1000 Prismatic Poop"
		$hibernation_count.text = "4/5"
		$hibernation_description.text = (description_text + "\n[Sleep duration: 80s > 100s]\n[Effect duration: 8s > 10s]")
	elif upgrades_left == 0:
		$Hibernation_Label.text = "MAXED"
		$Hibernation_Label.vertical_alignment = 1
		$hibernation_count.text = "5/5"
		$hibernation_description.text = ("Can enter a state of hibernation where no poop is dropped, but when waking up will only drop giant poops for a small amount of time.\n(Click to awake early but with a shorter effect)\n[Sleep duration: 100s]\n[Effect duration: 10s]")

func _on_upgrade_button_mouse_entered():
	$hibernation_description.visible = true


func _on_upgrade_button_mouse_exited():
	$hibernation_description.visible = false


func _on_upgrade_button_button_down() -> void:
	$Hibernation_Label.position = Vector2(-144, 0)


func _on_upgrade_button_button_up() -> void:
	$Hibernation_Label.position = Vector2(-144, -12)
