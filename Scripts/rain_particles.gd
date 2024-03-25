extends CPUParticles2D

var rain_check = 0;

func _on_rain_start_check_timeout():
	rain_check = randi_range(1,4)
	if ((rain_check == 4) && (!Globals.currently_raining)):
		self.emitting = true
		Globals.currently_raining = true
		$rain_duration.start()
		print("Rain started")
	else:
		print("No rain started")
		pass


func _on_rain_duration_timeout():
	self.emitting = false
	Globals.currently_raining = false
	print("Rain stopped")
