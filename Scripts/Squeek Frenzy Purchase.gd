extends Node2D

signal upgrade_purchased

var upgrades_left = 5
var description_text = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	upgrade_purchased.connect(get_tree().get_root().get_node("Main_Tree").get_node("Shop_Scene")._item_purchased.bind())
	description_text = $Squeek_frenzy_description.text.left(145)
	await get_tree().create_timer(.5).timeout
	upgrades_left = Globals.upgrade_dictionary["Bella"][4]
	_update_upgrade_information()

func _on_upgrade_button_pressed():
	if (Globals.squeek_frenzy_purchased == false) and (Globals.poop_amount >= 5000) and (upgrades_left == 5):
		Globals.squeek_frenzy_purchased = true
		Globals.squeek_frenzy_duration = 5
		Globals.poop_amount -= 5000
		upgrades_left -= 1
		_update_upgrade_information()
		upgrade_purchased.emit()
		Globals.upgrade_dictionary["Bella"][4] = upgrades_left
	elif (Globals.squeek_frenzy_purchased == true) and (Globals.poop_amount >= 10000) and (upgrades_left == 4):
		Globals.squeek_frenzy_duration = 10
		Globals.poop_amount -= 10000
		upgrades_left -= 1
		_update_upgrade_information()
		upgrade_purchased.emit()
	elif (Globals.squeek_frenzy_purchased == true) and (Globals.poop_amount >= 10000) and (Globals.prismatic_poop_amount >= 50) and (upgrades_left == 3):
		Globals.squeek_frenzy_duration = 15
		Globals.poop_amount -= 10000
		Globals.prismatic_poop_amount -= 50
		upgrades_left -= 1
		_update_upgrade_information()
		upgrade_purchased.emit()
		Globals.upgrade_dictionary["Bella"][4] = upgrades_left
	elif (Globals.squeek_frenzy_purchased == true) and (Globals.poop_amount >= 10000) and (Globals.prismatic_poop_amount >= 100) and (Globals.diamond_poop_amount >= 1) and (upgrades_left == 2):
		Globals.squeek_frenzy_duration = 20
		Globals.poop_amount -= 10000
		Globals.prismatic_poop_amount -= 100
		Globals.diamond_poop_amount -= 1
		upgrades_left -= 1
		_update_upgrade_information()
		upgrade_purchased.emit()
		Globals.upgrade_dictionary["Bella"][4] = upgrades_left
	elif (Globals.squeek_frenzy_purchased == true) and (Globals.poop_amount >= 30000) and (Globals.prismatic_poop_amount >= 250) and (Globals.diamond_poop_amount >= 3) and (upgrades_left == 1):
		Globals.squeek_frenzy_duration = 30
		Globals.poop_amount -= 30000
		Globals.prismatic_poop_amount -= 250
		Globals.diamond_poop_amount -= 3
		upgrades_left -= 1
		_update_upgrade_information()
		upgrade_purchased.emit()
		Globals.upgrade_dictionary["Bella"][4] = upgrades_left

func _update_bella():
	await get_tree().create_timer(.3).timeout
	upgrades_left = Globals.upgrade_dictionary["Bella"][4]
	_update_upgrade_information()

func _update_upgrade_information():
	if upgrades_left == 4:
		$Squeek_Frenzy_Label.text = "Squeek Frenzy\n10000 Poop"
		$Squeek_frenzy_count.text = "1/5"
		$Squeek_frenzy_description.text = (description_text + "[5s > 10s]")
	elif upgrades_left == 3:
		$Squeek_Frenzy_Label.text = "Squeek Frenzy\n10000 Poop\n50 Prismatic Poop"
		$Squeek_frenzy_count.text = "2/5"
		$Squeek_frenzy_description.text = (description_text + "[10s > 15s]")
	elif upgrades_left == 2:
		$Squeek_Frenzy_Label.text = "Squeek Frenzy\n10000 Poop\n100 Prismatic Poop\n1 Diamond Poop"
		$Squeek_frenzy_count.text = "3/5"
		$Squeek_frenzy_description.text = (description_text + "[15s > 20s]")
	elif upgrades_left == 1:
		$Squeek_Frenzy_Label.text = "Squeek Frenzy\n30000 Poop\n250 Prismatic Poop\n3 Diamond Poop"
		$Squeek_frenzy_count.text = "4/5"
		$Squeek_frenzy_description.text = (description_text + "[20s > 30s]")
	elif upgrades_left == 0:
		$Squeek_Frenzy_Label.text = "MAXED"
		$Squeek_Frenzy_Label.vertical_alignment = 1
		$Squeek_frenzy_count.text = "5/5"
		$Squeek_frenzy_description.text = (description_text + "[30s]")

func _on_upgrade_button_mouse_entered():
	$Squeek_frenzy_description.visible = true


func _on_upgrade_button_mouse_exited():
	$Squeek_frenzy_description.visible = false


func _on_upgrade_button_button_down() -> void:
	$Squeek_Frenzy_Label.position = Vector2(-144, -12)


func _on_upgrade_button_button_up() -> void:
	$Squeek_Frenzy_Label.position = Vector2(-144, -20)
