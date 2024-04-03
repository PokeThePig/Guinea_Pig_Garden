extends Node2D

signal shop_opened
signal achievements_opened

func _ready():
	shop_opened.connect(get_parent().get_node("Shop_Scene").get_node("main_shop_camera")._switch_to_shop_cam.bind())
	achievements_opened.connect(get_parent().get_node("Achievements_Screen").get_node("achievements_cam")._switch_to_achievements_cam.bind())

func _on_hud_open_shop():
	shop_opened.emit()
	$Day_Night_Cycle.visible = false

func _switch_to_achievements_cam():
	achievements_opened.emit()
	$Day_Night_Cycle.visible = false

