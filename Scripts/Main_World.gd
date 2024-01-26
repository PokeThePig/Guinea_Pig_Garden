extends Node2D

signal shop_opened

func _ready():
	print(get_parent())
	shop_opened.connect(get_parent().get_node("Shop_Scene").get_node("main_shop_camera")._switch_to_shop_cam.bind())

func _on_hud_open_shop():
	shop_opened.emit()
