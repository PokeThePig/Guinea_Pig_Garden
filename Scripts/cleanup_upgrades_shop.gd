extends Node2D

signal shop_cam_from_cleanup

func _ready():
	shop_cam_from_cleanup.connect(get_parent().get_node("Shop_Scene").get_node("main_shop_camera")._switch_to_shop_cam_from_cleanup.bind())

func _on_cleanup_to_shop_pressed():
	shop_cam_from_cleanup.emit()

func _on_cleanup_to_shop_button_down() -> void:
	$Back_Label.position = Vector2(64, 776)


func _on_cleanup_to_shop_button_up() -> void:
	$Back_Label.position = Vector2(64, 768)
