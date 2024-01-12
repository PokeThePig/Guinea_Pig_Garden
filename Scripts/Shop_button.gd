extends Node2D

signal open_shop

func _on_shop_menu_button_pressed():
	open_shop.emit()
	pass
