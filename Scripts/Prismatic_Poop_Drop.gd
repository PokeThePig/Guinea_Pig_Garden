extends CharacterBody2D

@onready var poop_animation = $AnimationPlayer

signal prismatic_poop_collected
signal prismatic_poop_achievement_unlocked

var speed = 200

func _ready():
	self.prismatic_poop_collected.connect(get_parent().get_parent().get_node("Guinea_Pig")._on_prismatic_poop_collected.bind())
	prismatic_poop_achievement_unlocked.connect(get_parent().get_parent().get_parent().get_parent().get_node("Achievements_Screen")._prismatic_poop_achievement_unlocked.bind())

func _process(delta):
	poop_animation.play("prismatic_poop_animation")
	
	var mouse_pos = get_global_mouse_position()
	var direction = (mouse_pos - self.global_position).normalized()
	
	if ((Globals.magnetic_cursor_unlocked == true) && (self.global_position.distance_to(mouse_pos) < Globals.magnetic_cursor_size)):
		self.global_position += direction * delta * Globals.magnetic_cursor_speed
	
func _on_mouse_entered():
	Globals.prismatic_poop_amount += 1;
	prismatic_poop_collected.emit()
	print("Prismatic: ", Globals.prismatic_poop_amount)
	if Globals.taste_rainbow_achievement_completed == false:
		prismatic_poop_achievement_unlocked.emit()
		Globals.taste_rainbow_achievement_completed = true
	queue_free()


func _on_decay_timer_timeout():
	queue_free()
