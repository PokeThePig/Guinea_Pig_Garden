extends Node2D

var achievement_unlocked = false

signal garden_cam
signal poop_up_cam
signal poop_types_cam
signal guinea_pigs_cam
signal cleanup_cam
signal all_guinea_pigs_purchased

func _ready():
	poop_up_cam.connect(get_parent().get_node("Poop_Upgrades_Shop").get_node("poop_upgrades_camera")._switch_to_poop_up_cam.bind())
	garden_cam.connect(get_parent().get_node("Garden").get_node("garden_camera")._switch_to_garden_cam.bind())
	poop_types_cam.connect(get_parent().get_node("Poop_Types_Shop").get_node("poop_types_camera")._switch_to_poop_types_cam.bind())
	guinea_pigs_cam.connect(get_parent().get_node("guinea_pigs_shop").get_node("guinea_pigs_shop_cam")._switch_to_guinea_shop_cam.bind())
	cleanup_cam.connect(get_parent().get_node("cleanup_upgrades_shop").get_node("cleanup_camera")._switch_to_cleanup_cam.bind())
	all_guinea_pigs_purchased.connect(get_parent().get_node("Achievements_Screen")._all_pigs_achievement_unlocked.bind())

func _on_back_to_garden_pressed():
	garden_cam.emit()

func _on_go_poop_upgrades_pressed():
	poop_up_cam.emit()

func _on_go_poop_types_pressed():
	poop_types_cam.emit()

func _on_go_guinea_shop_pressed():
	guinea_pigs_cam.emit()

func _on_go_cleanup_upgrades_pressed() -> void:
	cleanup_cam.emit()
	

func _item_purchased():
	$Purchase_sound_effect.play()
	if (len(Globals.guinea_dictionary) == 6) and (achievement_unlocked == false):
		Globals.full_house_achievement_completed = true
		all_guinea_pigs_purchased.emit()
		achievement_unlocked = true


func _on_back_to_garden_button_down() -> void:
	$Back_Label.position = Vector2(64,776)

func _on_back_to_garden_button_up() -> void:
	$Back_Label.position = Vector2(64,768)


func _on_go_poop_upgrades_button_down() -> void:
	$Poop_Upgrades_Label.position = Vector2(864, 472)

func _on_go_poop_upgrades_button_up() -> void:
	$Poop_Upgrades_Label.position = Vector2(864, 464)


func _on_go_poop_types_button_down() -> void:
	$Poop_Types_Label.position = Vector2(496, 472)

func _on_go_poop_types_button_up() -> void:
	$Poop_Types_Label.position = Vector2(496, 464)


func _on_go_guinea_shop_button_down() -> void:
	$Guinea_Pigs_Label.position = Vector2(128, 472)

func _on_go_guinea_shop_button_up() -> void:
	$Guinea_Pigs_Label.position = Vector2(128, 464)


func _on_go_cleanup_upgrades_button_down() -> void:
	$Cleanup_Upgrade_Label.position = Vector2(1232, 472)


func _on_go_cleanup_upgrades_button_up() -> void:
	$Cleanup_Upgrade_Label.position = Vector2(1232, 464)
