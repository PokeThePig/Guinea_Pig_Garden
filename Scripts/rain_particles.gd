extends CPUParticles2D

var rain_check = 0;

func _on_rain_start_check_timeout():
	rain_check = randi_range(1,4)
	if ((rain_check == 4) && (!Globals.currently_raining)):
		self.emitting = true
		Globals.currently_raining = true
		$rain_duration.start()
		$rain_start_check.stop()
		print("Rain started")
	else:
		print("No rain started")
		$rain_start_check.stop()
		$rain_start_check.wait_time = randi_range(240, 360)
		$rain_start_check.start()
		pass


func _on_rain_duration_timeout():
	self.emitting = false
	Globals.currently_raining = false
	print("Rain stopped")
	$rain_start_check.wait_time = randi_range(240, 360)
	$rain_start_check.start()
	$rain_duration.wait_time = randi_range(180, 480)
	
