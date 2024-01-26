extends Node2D

signal shop_cam_from_poop_up

func _ready():
	shop_cam_from_poop_up.connect(get_parent().get_node("Shop_Scene").get_node("main_shop_camera")._switch_to_shop_cam_from_poop_up.bind())

func _on_poop_up_to_shop_pressed():
	shop_cam_from_poop_up.emit()
