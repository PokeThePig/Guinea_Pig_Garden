extends Node2D

signal shop_cam_from_guinea_shop

func _ready():
	shop_cam_from_guinea_shop.connect(get_parent().get_node("Shop_Scene").get_node("main_shop_camera")._switch_to_shop_cam_from_guinea_shop.bind())

func _on_guinea_shop_to_shop_pressed():
	shop_cam_from_guinea_shop.emit()

func _update_buttons():
	if Globals.guinea_two_purchased:
		get_node("Guinea_Pig_Two_Purchase").get_node("Button").text = "SOLD OUT"
	if Globals.rich_guinea_purchased:
		get_node("Rich_Guinea_Pig_Purchase").get_node("Button").text = "SOLD OUT"
	if Globals.rainbow_guinea_purchased:
		get_node("Rainbow_Guinea_Pig_Purchase").get_node("Button").text = "SOLD OUT"
	if Globals.king_calix_purchased:
		get_node("king_calix_purchase").get_node("Button").text = "SOLD OUT"
