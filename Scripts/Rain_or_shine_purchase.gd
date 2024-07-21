extends Node2D

signal upgrade_purchased

var upgrades_left = 5
var description_text = "Increases chance of Chroma dropping prismatic poop without rain."

# Called when the node enters the scene tree for the first time.
func _ready():
	upgrade_purchased.connect(get_tree().get_root().get_node("Main_Tree").get_node("Shop_Scene")._item_purchased.bind())


func _on_upgrade_button_pressed():
	if (Globals.rain_or_shine_purchased == false) and (Globals.poop_amount >= 10000) and (upgrades_left == 5):
		Globals.rain_or_shine_purchased = true
		Globals.poop_amount -= 10000
		upgrades_left -= 1
		Globals.chroma_prismatic_odds = 100
		$upgrade_button.text = "Rain or Shine\n20000 Poop"
		$rain_or_shine_count.text = "1/5"
		$Rain_or_shine_description.text = (description_text + "\n[1% > 2%]")
		upgrade_purchased.emit()
	elif ((Globals.rain_or_shine_purchased == true) and (Globals.poop_amount >= 20000) and (upgrades_left == 4)):
		Globals.poop_amount -= 20000
		upgrades_left -= 1
		Globals.chroma_prismatic_odds = 50
		$upgrade_button.text = "Rain or Shine\n30000 Poop"
		$rain_or_shine_count.text = "2/5"
		$Rain_or_shine_description.text = (description_text + "\n[2% > 5%]")
		upgrade_purchased.emit()
	elif ((Globals.rain_or_shine_purchased == true) and (Globals.poop_amount >= 30000) and (upgrades_left == 3)):
		Globals.poop_amount -= 30000
		upgrades_left -= 1
		Globals.chroma_prismatic_odds = 20
		$upgrade_button.text = "Rain or Shine\n40000 Poop"
		$rain_or_shine_count.text = "3/5"
		$Rain_or_shine_description.text = (description_text + "\n[5% > 10%]")
		upgrade_purchased.emit()
	elif ((Globals.rain_or_shine_purchased == true) and (Globals.poop_amount >= 40000) and (upgrades_left == 2)):
		Globals.poop_amount -= 20000
		upgrades_left -= 1
		Globals.chroma_prismatic_odds = 10
		$upgrade_button.text = "Rain or Shine\n50000 Poop"
		$rain_or_shine_count.text = "4/5"
		$Rain_or_shine_description.text = (description_text + "\n[10% > 25%]")
		upgrade_purchased.emit()
	elif ((Globals.rain_or_shine_purchased == true) and (Globals.poop_amount >= 50000) and (upgrades_left == 1)):
		Globals.giant_prismatic_purchased = true
		Globals.poop_amount -= 50000
		upgrades_left -= 1
		Globals.chroma_prismatic_odds = 4
		$upgrade_button.text = "MAXED"
		$rain_or_shine_count.text = "5/5"
		$Rain_or_shine_description.text = ("Increases chance of Chroma dropping prismatic poop without rain, along with a rare chance of a giant prismatic poop.\n[25%]")
		upgrade_purchased.emit()


func _on_upgrade_button_mouse_entered():
	$Rain_or_shine_description.visible = true


func _on_upgrade_button_mouse_exited():
	$Rain_or_shine_description.visible = false
