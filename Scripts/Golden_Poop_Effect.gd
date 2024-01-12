extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.movespeed = randf_range(5,10)
	print("start")
func _on_effect_duration_timeout():
	Globals.golden_poop_active = false
	Globals.golden_poop_dropped = false
	print("stop")
	queue_free()
