extends CharacterBody2D

#Poop drops
@onready var poop_item = load("res://Scenes/Garden/poop_dropping.tscn")
@onready var golden_poop = load("res://Scenes/Garden/golden_poop_drop.tscn")
@onready var rainbow_gold_effect = load("res://Scenes/Garden/rainbow_pig_gold_effect.tscn")
@onready var diamond_poop = load("res://Scenes/Garden/diamond_poop_drop.tscn")
@onready var giant_poop = load("res://Scenes/Garden/giant_poop_drop.tscn")
@onready var prismatic_poop = load("res://Scenes/Garden/prismatic_poop_drop.tscn")

#Guinea Pig Assets
@onready var pig_sprite = $Pig_Sprite
@onready var main_pig_animation = $Pig_AnimationPlayer
@onready var movement_change = %wander_timer
@onready var poop_drop_speed = %poop_spawner

var poop_count = 0
var movespeed = randf_range(1, 3)
var state = 0
var face_left = true

var test_var = false

var pig_position = null
var mouse_in_area = false
var petting_achievement_unlocked = false

signal thousand_pets_achievement_unlocked

#0 no movement, 1 move right, 2 move left, 3 move up, 4 move down

func _ready():
	thousand_pets_achievement_unlocked.connect(get_parent().get_parent().get_parent().get_node("Achievements_Screen")._thousand_pets_achievement_unlocked.bind())
	poop_drop_speed.wait_time = 5 * Globals.poop_speed_multiplier

'''Movement of Guinea Pigs'''

func _physics_process(_delta):
	if (velocity.x != 0) || (velocity.y != 0):
		main_pig_animation.play("walk_animation")
	
	pig_position = position

#Randomized movement

	if state == 0:
		velocity.x = 0
		velocity.y = 0
	elif state == 1:
		velocity.x = 100 * Globals.movespeed
		pig_sprite.flip_h = true
		main_pig_animation.play("walk_animation")
		face_left = false
	elif state == 2:
		velocity.x = -100 * Globals.movespeed
		pig_sprite.flip_h = false
		main_pig_animation.play("walk_animation")
		face_left = true
	elif state == 3:
		velocity.y = 100 * Globals.movespeed
		main_pig_animation.play("walk_animation")
	elif state == 4:
		velocity.y = -100 * Globals.movespeed
		main_pig_animation.play("walk_animation")
	
	move_and_slide()



'''Timer for moving Guinea Pigs'''

func _on_wander_timer_timeout():
	if Globals.golden_poop_active == false:
		state = randi_range(0,5)
		Globals.movespeed = randf_range(1, 3)
		movement_change.wait_time = 3.5
	else:
		state = randi_range(1,5)
		Globals.movespeed = randf_range(8,10)
		movement_change.wait_time = 0.25


'''Spawning poop'''

func _on_poop_spawner_timeout():
	if Globals.double_poop_purchased == true:
		var double_poop_check = randi_range(1, Globals.double_poop_chance)
		if double_poop_check == Globals.double_poop_chance:
			_on_poop_spawner_timeout()
		
#Odds for rare poop drops
	var diamond_poop_check = randi() % 5000 + 1
	var golden_poop_check = randi() % 100 + 1
	var giant_poop_check = randi() % 500 + 1
	var prismatic_poop_check = randi() % 50 + 1

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

	elif (giant_poop_check == 500) and (Globals.giant_poop_purchased == true): 
		var dropped_giant_poop = giant_poop.instantiate()
		get_parent().add_child(dropped_giant_poop)

		if face_left == true:
			dropped_giant_poop.global_position.x = randf_range(pig_position.x + 2000, pig_position.x + 2000)
			dropped_giant_poop.global_position.y = randf_range(pig_position.y - 500, pig_position.y - 500)
		else:
			dropped_giant_poop.global_position.x = randf_range(pig_position.x, pig_position.x)
			dropped_giant_poop.global_position.y = randf_range(pig_position.y - 500, pig_position.y - 500)
			
			current_dropped_poop = null
			
	elif (prismatic_poop_check == 3) and (Globals.prismatic_poop_purchased == true) and (Globals.currently_raining == true):
		var dropped_prismatic_poop = prismatic_poop.instantiate()
		get_parent().add_child(dropped_prismatic_poop)
		
		current_dropped_poop = dropped_prismatic_poop
		
#Regular poop drop
	else:
		var dropped_poop = poop_item.instantiate()
		get_parent().add_child(dropped_poop)
		
		current_dropped_poop = dropped_poop
		
	#Setting poop spawn point
	if (face_left == true) and (current_dropped_poop != null):
		current_dropped_poop.global_position.x = randf_range(pig_position.x + 400, pig_position.x + 450)
		current_dropped_poop.global_position.y = randf_range(pig_position.y + 200, pig_position.y + 250)
	elif (current_dropped_poop != null):
		current_dropped_poop.global_position.x = randf_range(pig_position.x - 450, pig_position.x - 550)
		current_dropped_poop.global_position.y = randf_range(pig_position.y + 250, pig_position.y + 350)
	pass


'''Gold Poop Effect'''

func _start_golden_poop_effect():
	poop_drop_speed.stop()
	poop_drop_speed.wait_time = .1 * Globals.poop_speed_multiplier
	poop_drop_speed.start()
	movement_change.stop()
	movement_change.wait_time = 0.25
	movement_change.start()
	
	if (get_node("Pig_Sprite").texture == load("res://Sprites/Currently Used/Rainbow Pig-Sheet Two Frame.png")):
		add_child(rainbow_gold_effect.instantiate())
		
	
func _end_golden_poop_effect():
	for pig in get_tree().get_nodes_in_group("Pig"):
		pig.velocity.x = 0
		pig.velocity.y = 0
	poop_drop_speed.stop()
	poop_drop_speed.wait_time = 5 * Globals.poop_speed_multiplier
	poop_drop_speed.start()
	movement_change.stop()
	movement_change.wait_time = 3.5
	movement_change.start()
	state = randi_range(0,5)
	
	
	
'''Updating Poop Speed'''
func _update_poop_speed():
	if Globals.golden_poop_active == true:
		poop_drop_speed.stop()
		poop_drop_speed.wait_time = .1 * Globals.poop_speed_multiplier
		poop_drop_speed.start()
	else:
		poop_drop_speed.stop()
		poop_drop_speed.wait_time = 5 * Globals.poop_speed_multiplier
		poop_drop_speed.start()


'''Playing pickup sound effects'''

func _on_poop_collected():
	sound_effect_randomizer().play()
	Globals.poop_amount += 1
	print(Globals.poop_amount)
	
func _on_diamond_poop_collected():
	$diamond_sound.play()
	pass

func _on_prismatic_poop_collected():
	$prismatic_sound.play()
	pass

func _on_giant_poop_crushed():
	$final_crush.play()
	pass

func sound_effect_randomizer():
	var sound_effect_num = floor(randf_range(0,3))
	if sound_effect_num == 0:
		return $pop_one
	elif sound_effect_num == 1:
		return $pop_two
	elif sound_effect_num == 2:
		return $pop_three
		
func squeek_randomizer():
	var squeek_num = floor(randf_range(0,3))
	if squeek_num == 0:
		return $tiny_squeek_sound
	elif squeek_num == 1:
		return $small_squeek_sound
	elif squeek_num == 2:
		return $loud_squeek_sound


'''Clicking on Guinea Pig'''
func _on_mouse_entered():
	mouse_in_area = true

func _on_mouse_exited():
	mouse_in_area = false
	
func _input(event):
	if event is InputEventMouseButton:
		if event.pressed == true:
			if mouse_in_area == true:
				squeek_randomizer().play()
				Globals.pet_count += 1
				print(Globals.pet_count)
				if (get_node("Pig_Sprite").texture == load("res://Sprites/Currently Used/King Calix-Sheet Final.png")):
					$king_calix_trumpet.play()
				if (Globals.pet_count >= 1000) and (Globals.petting_professional_achievement_completed == false):
					thousand_pets_achievement_unlocked.emit()
					Globals.petting_professional_achievement_completed = true
