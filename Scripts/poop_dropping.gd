extends CharacterBody2D

signal poop_collected
signal one_million_achievement_unlocked

var speed = 100

func _ready():
	self.poop_collected.connect(get_parent().get_node("Guinea_Pig")._on_poop_collected.bind())
	one_million_achievement_unlocked.connect(get_parent().get_parent().get_parent().get_node("Achievements_Screen")._one_million_achievement_unlocked.bind())

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var direction = (mouse_pos - self.global_position).normalized()
	
	if ((Globals.magnetic_cursor_unlocked == true) && (self.global_position.distance_to(mouse_pos) < Globals.magnetic_cursor_size)):
		self.global_position += direction * delta * Globals.magnetic_cursor_speed

func _on_mouse_entered():
	poop_collected.emit()
	if (Globals.poop_amount >= 1000000) and (Globals.manure_millionare_achievement_completed == false):
		one_million_achievement_unlocked.emit()
		Globals.manure_millionare_achievement_completed = true
	queue_free()


func _on_decay_timer_timeout():
	queue_free()
