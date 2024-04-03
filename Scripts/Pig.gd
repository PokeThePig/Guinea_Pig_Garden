extends Node2D

signal speed_change

func _on_garden_scene_speed_change():
	speed_change.emit()
