extends Node2D

signal effect_end
signal music_start
signal max_speed_achievement_unlocked

# Called when the node enters the scene tree for the first time.
func _ready():
	effect_end.connect(get_parent().get_node("Guinea_Pig")._end_golden_poop_effect.bind());
	music_start.connect(get_parent().get_parent().get_node("Music")._start_gold_song.bind())
	max_speed_achievement_unlocked.connect(get_parent().get_parent().get_parent().get_node("Achievements_Screen")._max_speed_achievement_unlocked.bind())
	get_parent().get_node("Guinea_Pig").movespeed = randf_range(5,10)
	music_start.emit()
	if (Globals.kings_coronation_active == true) and (self == instance_from_id(Globals.guinea_dictionary["Calix"])) and (Globals.squeek_frenzy_effect_active == true) and (Globals.poop_frenzy_achievement_completed == false):
		max_speed_achievement_unlocked.emit()
		Globals.poop_frenzy_achievement_completed = true
	print("start gold effect")
	
func _on_effect_duration_timeout():
	effect_end.emit()
	Globals.movespeed = randf_range(1,3)
	Globals.golden_poop_active = false
	Globals.golden_poop_dropped = false
	Globals.gold_poop_pig = null
	print("stop gold effect")
	queue_free()
