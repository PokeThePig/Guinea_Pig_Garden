extends Node2D

func _on_mouse_entered():
	Globals.poop_amount += 50
	queue_free()
