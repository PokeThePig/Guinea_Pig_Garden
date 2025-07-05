extends Node2D

signal effect_end
signal music_start
signal max_speed_achievement_unlocked

# Called when the node enters the scene tree for the first time.
func _ready():
	effect_end.connect(get_parent().get_node("Guinea_Pig")._end_kings_coronation_effect.bind())
	music_start.connect(get_parent().get_parent().get_node("Music")._start_king_song.bind())
	max_speed_achievement_unlocked.connect(get_parent().get_parent().get_parent().get_node("Achievements_Screen")._max_speed_achievement_unlocked.bind())
	get_parent().get_node("Guinea_Pig").movespeed = randf_range(10,15)
	music_start.emit()
	if (Globals.golden_poop_active == true) and (instance_from_id(Globals.guinea_dictionary["Calix"]) == Globals.gold_poop_pig) and (Globals.squeek_frenzy_effect_active == true) and (Globals.poop_frenzy_achievement_completed == false):
		max_speed_achievement_unlocked.emit()
		print("WORKED IN KINGS EFFECT")
		Globals.poop_frenzy_achievement_completed = true
	
func _on_effect_duration_timeout():
	effect_end.emit()
	Globals.kings_coronation_active = false
	Globals.king_poop_dropped = false
	queue_free()
