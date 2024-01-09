'''extends CharacterBody2D

@onready var poop_total = get_tree().get_first_node_in_group("poop_count")
@onready var poop_item = preload("res://poop_drop.tscn")

const MAX_SPEED = 200.0
const ACCELERATION = 1

var speed = 0.0
var is_being_picked_up = false
var poop_money = 0

func _physics_process(delta):
	if is_being_picked_up:
		speed = lerp(speed, MAX_SPEED, ACCELERATION * delta)
		velocity = global_position.direction_to(poop_total.global_position) * speed
	
	var collision = move_and_collide(velocity)
	
	if collision:
		_handle_picked_up()
		
func _handle_picked_up():
	queue_free()
	poop_money += 1

func _on_mouse_entered():
	#is_being_picked_up = true
	queue_free()
	
func _on_spawn_timer_timeout():
	spawn_poop()

func spawn_poop():
	var new_poop = poop_item.instantiate()
	new_poop.position = Globals.pig_position
	add_child(new_poop)
'''
