extends Node2D

signal upgrade_purchased

var upgrades_left = 5
var description_text = "Increases chance of Chroma dropping prismatic poop without rain."

# Called when the node enters the scene tree for the first time.
func _ready():
	upgrade_purchased.connect(get_tree().get_root().get_node("Main_Tree").get_node("Shop_Scene")._item_purchased.bind())


func _on_upgrade_button_pressed():
	if (Globals.rain_or_shine_purchased == false) and (Globals.prismatic_poop_amount >= 100) and (upgrades_left == 5):
		Globals.rain_or_shine_purchased = true
		Globals.prismatic_poop_amount -= 100
		upgrades_left -= 1
		Globals.chroma_prismatic_odds = 100
		$upgrade_button.text = "Rain or Shine\n150 Prismatic Poop"
		$rain_or_shine_count.text = "1/5"
		$Rain_or_shine_description.text = (description_text + "\n[1% > 2%]")
		upgrade_purchased.emit()
	elif ((Globals.rain_or_shine_purchased == true) and (Globals.prismatic_poop_amount >= 150) and (upgrades_left == 4)):
		Globals.prismatic_poop_amount -= 150
		upgrades_left -= 1
		Globals.chroma_prismatic_odds = 50
		$upgrade_button.text = "Rain or Shine\n250 Prismatic Poop\n1 Diamond Poop"
		$rain_or_shine_count.text = "2/5"
		$Rain_or_shine_description.text = (description_text + "\n[2% > 5%]")
		upgrade_purchased.emit()
	elif ((Globals.rain_or_shine_purchased == true) and (Globals.prismatic_poop_amount >= 250) and (Globals.diamond_poop_amount >= 1) and (upgrades_left == 3)):
		Globals.prismatic_poop_amount -= 250
		Globals.diamond_poop_amount -= 1
		upgrades_left -= 1
		Globals.chroma_prismatic_odds = 20
		$upgrade_button.text = "Rain or Shine\n300 Prismatic Poop\n3 Diamond Poop"
		$rain_or_shine_count.text = "3/5"
		$Rain_or_shine_description.text = (description_text + "\n[5% > 10%]")
		upgrade_purchased.emit()
	elif ((Globals.rain_or_shine_purchased == true) and (Globals.prismatic_poop_amount >= 300) and (Globals.diamond_poop_amount >= 3) and (upgrades_left == 2)):
		Globals.prismatic_poop_amount -= 300
		Globals.diamond_poop_amount -= 3
		upgrades_left -= 1
		Globals.chroma_prismatic_odds = 10
		$upgrade_button.text = "Rain or Shine\n500 Prismatic Poop\n5 Diamond Poop"
		$rain_or_shine_count.text = "4/5"
		$Rain_or_shine_description.text = (description_text + "\n[10% > 25%]")
		upgrade_purchased.emit()
	elif ((Globals.rain_or_shine_purchased == true) and (Globals.prismatic_poop_amount >= 500) and (Globals.diamond_poop_amount >= 5) and (upgrades_left == 1)):
		Globals.giant_prismatic_purchased = true
		Globals.prismatic_poop_amount -= 500
		Globals.diamond_poop_amount -= 5
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
