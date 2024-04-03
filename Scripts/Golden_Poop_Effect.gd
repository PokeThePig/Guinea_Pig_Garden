extends Node2D

signal effect_end
signal max_speed_achievement_unlocked

# Called when the node enters the scene tree for the first time.
func _ready():
	effect_end.connect(get_parent().get_node("Guinea_Pig")._end_golden_poop_effect.bind());
	max_speed_achievement_unlocked.connect(get_parent().get_parent().get_parent().get_node("Achievements_Screen")._max_speed_achievement_unlocked.bind())
	Globals.movespeed = randf_range(5,10)
	print("start")
	
func _process(_delta):
	if (Globals.max_speed_upgrade == true) && (Globals.poop_frenzy_achievement_completed == false):
		max_speed_achievement_unlocked.emit()
		Globals.poop_frenzy_achievement_completed = true
	
func _on_effect_duration_timeout():
	effect_end.emit()
	Globals.movespeed = randf_range(1,3)
	Globals.golden_poop_active = false
	Globals.golden_poop_dropped = false
	print("stop")
	queue_free()
