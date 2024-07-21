extends Node2D

signal effect_end
signal max_speed_acheivement_unlocked

# Called when the node enters the scene tree for the first time.
func _ready():
	$effect_duration.stop()
	$effect_duration.wait_time = Globals.squeek_frenzy_duration
	$effect_duration.start()
	for pig in get_tree().get_nodes_in_group("Pig"):
		effect_end.connect(pig._end_squeek_frenzy_effect.bind())
	#max speed achievement bind
	Globals.movespeed = randf_range(7, 12)
	
	while (Globals.squeek_frenzy_effect_active):
		await get_tree().create_timer(.75).timeout
		get_parent().get_node("Guinea_Pig").squeek_randomizer().play()
	print("Frenzy started")


func _on_effect_duration_timeout():
	effect_end.emit()
	Globals.movespeed = randf_range(1,3)
	print("Frenzy ended")
	queue_free()
