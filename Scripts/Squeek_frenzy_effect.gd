extends Node2D

signal effect_end
signal max_speed_achievement_unlocked

# Called when the node enters the scene tree for the first time.
func _ready():
	max_speed_achievement_unlocked.connect(get_parent().get_parent().get_parent().get_node("Achievements_Screen")._max_speed_achievement_unlocked.bind())
	$effect_duration.stop()
	$effect_duration.wait_time = Globals.squeek_frenzy_duration
	$effect_duration.start()
	for pig in get_tree().get_nodes_in_group("Pig"):
		effect_end.connect(pig._end_squeek_frenzy_effect.bind())
	#max speed achievement bind
	Globals.movespeed = randf_range(7, 12)
	if (Globals.golden_poop_active == true) and (Globals.kings_coronation_active == true) and (instance_from_id(Globals.guinea_dictionary["Calix"]) == Globals.gold_poop_pig):
		max_speed_achievement_unlocked.emit()
		Globals.poop_frenzy_achievement_completed = true
	
	while (Globals.squeek_frenzy_effect_active):
		await get_tree().create_timer(.75).timeout
		get_parent().get_node("Guinea_Pig").squeek_randomizer().play()
	print("Frenzy started")


func _on_effect_duration_timeout():
	effect_end.emit()
	Globals.movespeed = randf_range(1,3)
	print("Frenzy ended")
	queue_free()
