extends Node2D

signal open_shop
signal open_settings
signal open_achievements

func _ready():
	open_achievements.connect(get_parent()._switch_to_achievements_cam.bind())

func _on_shop_menu_button_pressed():
	open_shop.emit()
	pass


func _on_texture_button_pressed():
	open_settings.emit()
	pass


func _on_achievement_menu_button_pressed():
	open_achievements.emit()
	pass
