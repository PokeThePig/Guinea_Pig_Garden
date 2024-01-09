extends CharacterBody2D

@onready var pig_animation = $AnimationPlayer
@onready var poop_item = load("res://Scenes/poop_dropping.tscn")
@onready var golden_poop = load("res://Scenes/golden_poop_drop.tscn")

var poop_count = 0
var movespeed = randf_range(1, 2)
var state = 0
var face_left = true
#0 no movement, 1 move right, 2 move left, 3 move up, 4 move down

#signal golden_drop


func _physics_process(delta):
	
	Globals.pig_position = position
	
	if state == 0:
		velocity.x = 0
		velocity.y = 0
	elif state == 1:
		velocity.x = 100 * movespeed
		$Sprite.flip_h = true
		pig_animation.play("walk")
		face_left = false
	elif state == 2:
		velocity.x = -100 * movespeed
		$Sprite.flip_h = false
		pig_animation.play("walk")
		face_left = true
	elif state == 3:
		velocity.y = 100 * movespeed
		pig_animation.play("walk")
	elif state == 4:
		velocity.y = -100 * movespeed
		pig_animation.play("walk")
	
	move_and_slide()



func _on_timer_timeout():
	state = floor(randf_range(0,5))
	movespeed = randf_range(1, 5)
	pass



#Spawning poop

func _on_poop_spawner_timeout():
	print("DROPPED!")
	
#1 in 100 chance for golden poop
	var golden_poop_check = randi() % 2 + 1
	print("Golden Poop Change: ", golden_poop_check)

#Golden poop drop
	if golden_poop_check == 2:
		var dropped_gold_poop = golden_poop.instantiate()
		#emit_signal("golden_drop")
		get_parent().add_child(dropped_gold_poop)
		
		if face_left == true:
			dropped_gold_poop.global_position.x = Globals.pig_position.x + 500
			dropped_gold_poop.global_position.y = Globals.pig_position.y + 300
		else:
			dropped_gold_poop.global_position.x = Globals.pig_position.x - 500
			dropped_gold_poop.global_position.y = Globals.pig_position.y + 300

#Regular poop drop
	else:
		var dropped_poop = poop_item.instantiate()
		get_parent().add_child(dropped_poop)
		if face_left == true:
			dropped_poop.global_position.x = Globals.pig_position.x + 500
			dropped_poop.global_position.y = Globals.pig_position.y + 300
		else:
			dropped_poop.global_position.x = Globals.pig_position.x - 500
			dropped_poop.global_position.y = Globals.pig_position.y + 300
	pass
