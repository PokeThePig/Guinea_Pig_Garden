extends Node2D

signal shop_cam_from_poop_types

func _ready():
	shop_cam_from_poop_types.connect(get_parent().get_node("Shop_Scene").get_node("main_shop_camera")._switch_to_shop_cam_from_poop_types.bind())

func _on_poop_types_to_shop_pressed():
	shop_cam_from_poop_types.emit()

func _update_buttons():
	if Globals.giant_poop_purchased:
		get_node("giant_poop_purchase").get_node("Button").text = "SOLD OUT"
	if Globals.diamond_poop_purchased:
		get_node("Diamond_Poop_Purchase").get_node("Button").text = "SOLD OUT"
	if Globals.prismatic_poop_purchased:
		get_node("Prismatic_Poop_Purchase").get_node("Button").text = "SOLD OUT"
