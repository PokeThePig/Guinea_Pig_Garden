extends Node2D

@onready var gizmo_sprite = get_parent().get_node("Pig_Sprite")
@onready var sleep_animation = $AnimationPlayer

var effect_time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	gizmo_sprite.visible = false
	if (get_parent().face_left != true):
		$sleep_sprite.flip_h = true
	$sleep_timer.wait_time = Globals.hibernation_sleep_time
	$sleep_timer.start()
	
func sleep_time_left():
	var time_left = $sleep_timer.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	return [minute, second]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	sleep_animation.play("sleep_animation")
	if (Globals.hiberation_sleep_active == true):
		$Sleep_countdown.text = "%2d:%02d" % sleep_time_left()


func _on_increment_effect_timer_timeout():
	effect_time += 1
	print(effect_time)


func _on_sleep_timer_timeout():
	Globals.hiberation_sleep_active = false
	gizmo_sprite.texture = load("res://Sprites/Currently Used/Pixel Guinea Pig 2-Sheet.png")
	gizmo_sprite.visible = true
	$sleep_sprite.visible = false
	$Sleep_countdown.text = ""
	if effect_time != 0:
		$hibernation_effect_timer.wait_time = effect_time
		Globals.hiberation_effect_active = true
		$hibernation_effect_timer.start()
	else:
		_on_hibernation_effect_timer_timeout()
	


func _on_hibernation_effect_timer_timeout():
	Globals.hiberation_effect_active = false
	get_parent().get_node("hibernation_activation").wait_time = randf_range(260,340)
	get_parent().get_node("hibernation_activation").start()
	queue_free()


func _sleep_box_entered():
	$Sleep_countdown.visible = true


func _sleep_box_exited():
	$Sleep_countdown.visible = false
	
	
#Ending early
func _input(event):
	if event is InputEventMouseButton:
		if event.pressed == true:
			if get_parent().mouse_in_area == true:
				$sleep_timer.stop()
				_on_sleep_timer_timeout()
