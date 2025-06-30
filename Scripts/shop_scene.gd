extends Node2D

var achievement_unlocked = false

signal garden_cam
signal poop_up_cam
signal poop_types_cam
signal guinea_pigs_cam
signal all_guinea_pigs_purchased

func _ready():
	poop_up_cam.connect(get_parent().get_node("Poop_Upgrades_Shop").get_node("poop_upgrades_camera")._switch_to_poop_up_cam.bind())
	garden_cam.connect(get_parent().get_node("Garden").get_node("garden_camera")._switch_to_garden_cam.bind())
	poop_types_cam.connect(get_parent().get_node("Poop_Types_Shop").get_node("poop_types_camera")._switch_to_poop_types_cam.bind())
	guinea_pigs_cam.connect(get_parent().get_node("guinea_pigs_shop").get_node("guinea_pigs_shop_cam")._switch_to_guinea_shop_cam.bind())
	all_guinea_pigs_purchased.connect(get_parent().get_node("Achievements_Screen")._all_pigs_achievement_unlocked.bind())

func _on_back_to_garden_pressed():
	garden_cam.emit()

func _on_go_poop_upgrades_pressed():
	poop_up_cam.emit()

func _on_go_poop_types_pressed():
	poop_types_cam.emit()

func _on_go_guinea_shop_pressed():
	guinea_pigs_cam.emit()

func _item_purchased():
	$Purchase_sound_effect.play()
	if (len(Globals.guinea_dictionary) == 5) and (achievement_unlocked == false):
		Globals.full_house_achievement_completed = true
		all_guinea_pigs_purchased.emit()
		achievement_unlocked = true
