extends Node2D

signal open_shop
signal open_settings

func _on_shop_menu_button_pressed():
	open_shop.emit()
	pass


func _on_texture_button_pressed():
	open_settings.emit()
	pass
