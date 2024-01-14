extends Node2D

signal effect_end

# Called when the node enters the scene tree for the first time.
func _ready():
	effect_end.connect(get_parent().get_node("Guinea_Pig")._end_golden_poop_effect.bind());
	Globals.movespeed = randf_range(5,10)
	print("start")
	
func _on_effect_duration_timeout():
	effect_end.emit()
	Globals.golden_poop_active = false
	Globals.golden_poop_dropped = false
	print("stop")
	queue_free()
