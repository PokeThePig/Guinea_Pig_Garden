extends CharacterBody2D

@onready var animation = $AnimationPlayer

var movespeed = randf_range(1, 2)
var state = 0
#0 no movement, 1 move right, 2 move left, 3 move up, 4 move down

func _physics_process(delta):
	
	if state == 0:
		velocity.x = 0
		velocity.y = 0
	elif state == 1:
		velocity.x = 100 * movespeed
		$Sprite.flip_h = true
		animation.play("walk")
	elif state == 2:
		velocity.x = -100 * movespeed
		$Sprite.flip_h = false
		animation.play("walk")
	elif state == 3:
		velocity.y = 100 * movespeed
		animation.play("walk")
	elif state == 4:
		velocity.y = -100 * movespeed
		animation.play("walk")
	
	move_and_slide()

func _on_timer_timeout():
	state = floor(randf_range(0,5))
	movespeed = randf_range(1, 3)
	pass
