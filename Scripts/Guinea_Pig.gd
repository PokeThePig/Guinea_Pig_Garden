extends CharacterBody2D

#Poop drops
@onready var poop_item = load("res://Scenes/Garden/poop_dropping.tscn")
@onready var golden_poop = load("res://Scenes/Garden/golden_poop_drop.tscn")
@onready var diamond_poop = load("res://Scenes/Garden/diamond_poop_drop.tscn")

#Guinea Pig Assets
@onready var pig_sprite = $Pig_Sprite
@onready var pig_animation = $Pig_AnimationPlayer
@onready var movement_change = %wander_timer
@onready var poop_drop_speed = %poop_spawner

var poop_count = 0
var movespeed = randf_range(1, 3)
var state = 0
var face_left = true

#0 no movement, 1 move right, 2 move left, 3 move up, 4 move down

'''Movement of Guinea Pigs'''

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
	


'''Timer for moving Guinea Pigs'''

func _on_wander_timer_timeout():
	if Globals.golden_poop_active == false:
		state = randi_range(0,5)
		Globals.movespeed = randf_range(1, 3)
		print("Speed: ", Globals.movespeed)
		movement_change.wait_time = 3.5
	else:
		state = randi_range(1,5)
		Globals.movespeed = randf_range(8,10)
		movement_change.wait_time = 0.25


'''Spawning poop'''


func _on_poop_spawner_timeout():
	print("DROPPED!")
		
#Odds for rare poop drops
	var diamond_poop_check = randi() % 5000 + 1
	var golden_poop_check = randi() % 100 + 1
	
	var current_dropped_poop = null
	
#Diamond poop drop
	if (diamond_poop_check == 5000) and (Globals.diamond_poop_purchased == true):
		var dropped_diamond_poop = diamond_poop.instantiate()
		get_parent().add_child(dropped_diamond_poop)
		
		current_dropped_poop = dropped_diamond_poop

#Golden poop drop
	elif (golden_poop_check == 100) and (Globals.golden_poop_dropped == false):
		var dropped_gold_poop = golden_poop.instantiate()
		get_parent().add_child(dropped_gold_poop)
		
		current_dropped_poop = dropped_gold_poop
		
		Globals.golden_poop_dropped = true

#Regular poop drop
	else:
		var dropped_poop = poop_item.instantiate()
		get_parent().add_child(dropped_poop)
		
		current_dropped_poop = dropped_poop
		
	#Setting poop spawn point
	if face_left == true:
		current_dropped_poop.global_position.x = randf_range(Globals.pig_position.x + 400, Globals.pig_position.x + 450)
		current_dropped_poop.global_position.y = randf_range(Globals.pig_position.y + 200, Globals.pig_position.y + 250)
	else:
		current_dropped_poop.global_position.x = randf_range(Globals.pig_position.x - 450, Globals.pig_position.x - 550)
		current_dropped_poop.global_position.y = randf_range(Globals.pig_position.y + 250, Globals.pig_position.y + 350)
	pass


'''Gold Poop Effect'''

func _start_golden_poop_effect():
	poop_drop_speed.stop()
	poop_drop_speed.wait_time = 0.1
	poop_drop_speed.start()
	movement_change.stop()
	movement_change.wait_time = 0.25
	movement_change.start()
	
func _end_golden_poop_effect():
	poop_drop_speed.wait_time = 2.5
	movement_change.wait_time = 3.5



'''Playing pickup sound effects'''

func _on_poop_colleced():
	sound_effect_randomizer().play()
	Globals.poop_amount += 1
	print(Globals.poop_amount)
	
func sound_effect_randomizer():
	var sound_effect_num = floor(randf_range(0,3))
	print(sound_effect_num)
	if sound_effect_num == 0:
		return $pop_one
	elif sound_effect_num == 1:
		return $pop_two
	elif sound_effect_num == 2:
		return $pop_three
