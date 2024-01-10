extends CharacterBody2D

@onready var poop_item = load("res://Scenes/poop_dropping.tscn")
@onready var golden_poop = load("res://Scenes/golden_poop_drop.tscn")
@onready var pig_sprite = $Pig_Sprite
@onready var pig_animation = $Pig_AnimationPlayer
@onready var movement_change = %wander_timer
@onready var poop_drop_speed = %poop_spawner


var poop_count = 0
var movespeed = randf_range(1, 3)
var state = 0
var face_left = true

#0 no movement, 1 move right, 2 move left, 3 move up, 4 move down


func _physics_process(_delta):
	
	Globals.pig_position = position

#Randomized movement

	if state == 0:
		velocity.x = 0
		velocity.y = 0
	elif state == 1:
		velocity.x = 100 * Globals.movespeed
		pig_sprite.flip_h = true
		pig_animation.play("walk")
		face_left = false
	elif state == 2:
		velocity.x = -100 * Globals.movespeed
		pig_sprite.flip_h = false
		pig_animation.play("walk")
		face_left = true
	elif state == 3:
		velocity.y = 100 * Globals.movespeed
		pig_animation.play("walk")
	elif state == 4:
		velocity.y = -100 * Globals.movespeed
		pig_animation.play("walk")
	
	move_and_slide()
	
	#Adjusting poop drop speed
	




func _on_wander_timer_timeout():
	if Globals.golden_poop_active == false:
		state = floor(randf_range(0,5))
		Globals.movespeed = randf_range(1, 3)
		print("Speed: ", Globals.movespeed)
		movement_change.wait_time = 3.5
	else:
		state = floor(randf_range(1,5))
		Globals.movespeed = randf_range(8,10)
		movement_change.wait_time = 0.25
		



#Spawning poop

func _on_poop_spawner_timeout():
	print("DROPPED!")
		
#1 in 100 chance for golden poop
	var golden_poop_check = randi() % 100 + 1
		
		
#Golden poop drop
	if (golden_poop_check == 100) and (Globals.golden_poop_dropped == false):
		var dropped_gold_poop = golden_poop.instantiate()
		get_parent().add_child(dropped_gold_poop)
		
		Globals.golden_poop_dropped = true
		
		if face_left == true:
			dropped_gold_poop.global_position.x = randf_range(Globals.pig_position.x + 450, Globals.pig_position.x + 550)
			dropped_gold_poop.global_position.y = randf_range(Globals.pig_position.y + 250, Globals.pig_position.y + 350)
		else:
			dropped_gold_poop.global_position.x = randf_range(Globals.pig_position.x + 450, Globals.pig_position.x + 550)
			dropped_gold_poop.global_position.y = randf_range(Globals.pig_position.y + 250, Globals.pig_position.y + 350)

#Regular poop drop
	else:
		var dropped_poop = poop_item.instantiate()
		get_parent().add_child(dropped_poop)
		if face_left == true:
			dropped_poop.global_position.x = randf_range(Globals.pig_position.x + 450, Globals.pig_position.x + 550)
			dropped_poop.global_position.y = randf_range(Globals.pig_position.y + 250, Globals.pig_position.y + 350)
		else:
			dropped_poop.global_position.x = randf_range(Globals.pig_position.x - 450, Globals.pig_position.x - 550)
			dropped_poop.global_position.y = randf_range(Globals.pig_position.y + 250, Globals.pig_position.y + 350)
	pass


func _on_event_checker_timeout():
	if Globals.golden_poop_active == true:
		
		poop_drop_speed.stop()
		poop_drop_speed.wait_time = 0.1
		poop_drop_speed.start()
		
		movement_change.stop()
		movement_change.wait_time = 0.25
		Globals.movespeed = randf_range(8,10)
		state = floor(randf_range(1,5))
		movement_change.start()
		
	elif Globals.golden_poop_active == false:
		poop_drop_speed.wait_time = 2.5
		movement_change.wait_time = 3.5
		
		
