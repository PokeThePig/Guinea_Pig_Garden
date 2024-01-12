extends Node2D

func swap_level():
	Globals.switch_scene("res://Scenes/Main_World.tscn")

func _on_back_to_garden_pressed():
	swap_level()


func _on_diamond_poop_purchase_diamond_purchased():
	$Shop_diamond_count.visible = true
