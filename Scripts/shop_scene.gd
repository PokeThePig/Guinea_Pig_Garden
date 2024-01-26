extends Node2D

signal garden_cam
signal poop_up_cam
signal poop_types_cam

func _ready():
	poop_up_cam.connect(get_parent().get_node("Poop_Upgrades_Shop").get_node("poop_upgrades_camera")._switch_to_poop_up_cam.bind())
	garden_cam.connect(get_parent().get_node("Garden").get_node("garden_camera")._switch_to_garden_cam.bind())
	poop_types_cam.connect(get_parent().get_node("Poop_Types_Shop").get_node("poop_types_camera")._switch_to_poop_types_cam.bind())

func _on_diamond_poop_purchase_diamond_purchased():
	$Shop_diamond_count.visible = true


func _on_back_to_garden_pressed():
	garden_cam.emit()

func _on_go_poop_upgrades_pressed():
	poop_up_cam.emit()

func _on_go_poop_types_pressed():
	poop_types_cam.emit()
