extends Node2D


func swap_level():
	Globals.switch_scene("res://Scenes/Shop/shop_scene.tscn")

func _on_hud_open_shop():
	swap_level()
