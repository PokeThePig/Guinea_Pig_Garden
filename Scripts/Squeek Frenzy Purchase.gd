extends Node2D

signal upgrade_purchased

var upgrades_left = 5
var description_text = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	upgrade_purchased.connect(get_tree().get_root().get_node("Main_Tree").get_node("Shop_Scene")._item_purchased.bind())
	description_text = $Squeek_frenzy_description.text.left(144)

func _on_upgrade_button_pressed():
	if (Globals.squeek_frenzy_purchased == false) and (Globals.poop_amount >= 10000) and (upgrades_left == 5):
		Globals.squeek_frenzy_purchased = true
		Globals.squeek_frenzy_duration = 5
		Globals.poop_amount -= 10000
		upgrades_left -= 1
		$upgrade_button.text = "Squeek Frenzy\n20000 Poop"
		$Squeek_frenzy_count.text = "1/5"
		$Squeek_frenzy_description.text = (description_text + "[5s > 10s]")
		upgrade_purchased.emit()
	elif (Globals.squeek_frenzy_purchased == true) and (Globals.poop_amount >= 20000) and (upgrades_left == 4):
		Globals.squeek_frenzy_duration = 10
		Globals.poop_amount -= 20000
		upgrades_left -= 1
		$upgrade_button.text = "Squeek Frenzy\n30000 Poop"
		$Squeek_frenzy_count.text = "2/5"
		$Squeek_frenzy_description.text = (description_text + "[10s > 15s]")
		upgrade_purchased.emit()
	elif (Globals.squeek_frenzy_purchased == true) and (Globals.poop_amount >= 30000) and (upgrades_left == 3):
		Globals.squeek_frenzy_duration = 15
		Globals.poop_amount -= 30000
		upgrades_left -= 1
		$upgrade_button.text = "Squeek Frenzy\n40000 Poop"
		$Squeek_frenzy_count.text = "3/5"
		$Squeek_frenzy_description.text = (description_text + "[15s > 20s]")
		upgrade_purchased.emit()
	elif (Globals.squeek_frenzy_purchased == true) and (Globals.poop_amount >= 40000) and (upgrades_left == 2):
		Globals.squeek_frenzy_duration = 20
		Globals.poop_amount -= 40000
		upgrades_left -= 1
		$upgrade_button.text = "Squeek Frenzy\n50000 Poop"
		$Squeek_frenzy_count.text = "4/5"
		$Squeek_frenzy_description.text = (description_text + "[20s > 30s]")
		upgrade_purchased.emit()
	elif (Globals.squeek_frenzy_purchased == true) and (Globals.poop_amount >= 50000) and (upgrades_left == 1):
		Globals.squeek_frenzy_duration = 30
		Globals.poop_amount -= 50000
		upgrades_left -= 1
		$upgrade_button.text = "MAXED"
		$Squeek_frenzy_count.text = "5/5"
		$Squeek_frenzy_description.text = (description_text + "[30s]")
		upgrade_purchased.emit()

func _on_upgrade_button_mouse_entered():
	$Squeek_frenzy_description.visible = true


func _on_upgrade_button_mouse_exited():
	$Squeek_frenzy_description.visible = false
