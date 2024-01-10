extends Timer


func _gold_poop_effect():
	Globals.movespeed = randf_range(5,10)
	$effect_duration.start()
	print("start")


func _on_effect_duration_timeout():
	Globals.golden_poop_active = false
	print("over")
	
