extends Node2D

signal upgrade_purchased

var upgrades_left = 5
var description_text = "Increases chance of Chroma dropping prismatic poop without rain."

# Called when the node enters the scene tree for the first time.
func _ready():
	upgrade_purchased.connect(get_tree().get_root().get_node("Main_Tree").get_node("Shop_Scene")._item_purchased.bind())
	await get_tree().create_timer(.5).timeout
	upgrades_left = Globals.upgrade_dictionary["Chroma"][4]
	_update_upgrade_information()


func _on_upgrade_button_pressed():
	if (Globals.rain_or_shine_purchased == false) and (Globals.prismatic_poop_amount >= 100) and (upgrades_left == 5):
		Globals.rain_or_shine_purchased = true
		Globals.prismatic_poop_amount -= 100
		upgrades_left -= 1
		Globals.chroma_prismatic_odds = 100
		_update_upgrade_information()
		upgrade_purchased.emit()
		Globals.upgrade_dictionary["Chroma"][4] = upgrades_left
	elif ((Globals.rain_or_shine_purchased == true) and (Globals.prismatic_poop_amount >= 150) and (upgrades_left == 4)):
		Globals.prismatic_poop_amount -= 150
		upgrades_left -= 1
		Globals.chroma_prismatic_odds = 50
		_update_upgrade_information()
		upgrade_purchased.emit()
		Globals.upgrade_dictionary["Chroma"][4] = upgrades_left
	elif ((Globals.rain_or_shine_purchased == true) and (Globals.prismatic_poop_amount >= 250) and (Globals.diamond_poop_amount >= 1) and (upgrades_left == 3)):
		Globals.prismatic_poop_amount -= 250
		Globals.diamond_poop_amount -= 1
		upgrades_left -= 1
		Globals.chroma_prismatic_odds = 20
		_update_upgrade_information()
		upgrade_purchased.emit()
		Globals.upgrade_dictionary["Chroma"][4] = upgrades_left
	elif ((Globals.rain_or_shine_purchased == true) and (Globals.prismatic_poop_amount >= 300) and (Globals.diamond_poop_amount >= 3) and (upgrades_left == 2)):
		Globals.prismatic_poop_amount -= 300
		Globals.diamond_poop_amount -= 3
		upgrades_left -= 1
		Globals.chroma_prismatic_odds = 10
		_update_upgrade_information()
		upgrade_purchased.emit()
		Globals.upgrade_dictionary["Chroma"][4] = upgrades_left
	elif ((Globals.rain_or_shine_purchased == true) and (Globals.prismatic_poop_amount >= 500) and (Globals.diamond_poop_amount >= 5) and (upgrades_left == 1)):
		Globals.giant_prismatic_purchased = true
		Globals.prismatic_poop_amount -= 500
		Globals.diamond_poop_amount -= 5
		upgrades_left -= 1
		Globals.chroma_prismatic_odds = 4
		_update_upgrade_information()
		upgrade_purchased.emit()
		Globals.upgrade_dictionary["Chroma"][4] = upgrades_left

func _update_upgrade_information():
	if upgrades_left == 4:
		$Rain_or_Shine_Label.text = "Rain or Shine\n150 Prismatic Poop"
		$rain_or_shine_count.text = "1/5"
		$Rain_or_shine_description.text = (description_text + "\n[1% > 2%]")
	elif upgrades_left == 3:
		$Rain_or_Shine_Label.text = "Rain or Shine\n250 Prismatic Poop\n1 Diamond Poop"
		$rain_or_shine_count.text = "2/5"
		$Rain_or_shine_description.text = (description_text + "\n[2% > 5%]")
	elif upgrades_left == 2:
		$Rain_or_Shine_Label.text = "Rain or Shine\n300 Prismatic Poop\n3 Diamond Poop"
		$rain_or_shine_count.text = "3/5"
		$Rain_or_shine_description.text = (description_text + "\n[5% > 10%]")
	elif upgrades_left == 1:
		$Rain_or_Shine_Label.text = "Rain or Shine\n500 Prismatic Poop\n5 Diamond Poop"
		$rain_or_shine_count.text = "4/5"
		$Rain_or_shine_description.text = (description_text + "\n[10% > 25%]")
	elif upgrades_left == 0:
		$Rain_or_Shine_Label.text = "MAXED"
		$Rain_or_Shine_Label.vertical_alignment = 1
		$rain_or_shine_count.text = "5/5"
		$Rain_or_shine_description.text = ("Increases chance of Chroma dropping prismatic poop without rain, along with a rare chance of a giant prismatic poop.\n[25%]")

func _on_upgrade_button_mouse_entered():
	$Rain_or_shine_description.visible = true


func _on_upgrade_button_mouse_exited():
	$Rain_or_shine_description.visible = false


func _on_upgrade_button_button_down() -> void:
	$Rain_or_Shine_Label.position = Vector2(-144, 0)

func _on_upgrade_button_button_up() -> void:
	$Rain_or_Shine_Label.position = Vector2(-144, -12)
