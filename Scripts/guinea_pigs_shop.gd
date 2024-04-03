extends Node2D

signal shop_cam_from_guinea_shop

func _ready():
	shop_cam_from_guinea_shop.connect(get_parent().get_node("Shop_Scene").get_node("main_shop_camera")._switch_to_shop_cam_from_guinea_shop.bind())

func _on_guinea_shop_to_shop_pressed():
	shop_cam_from_guinea_shop.emit()
