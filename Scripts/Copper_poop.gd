extends Node2D

signal copper_poop_collected

var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	self.copper_poop_collected.connect(get_parent().get_parent().get_node("Guinea_Pig")._on_copper_poop_collected.bind())

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var direction = (mouse_pos - self.global_position).normalized()
	
	if ((Globals.magnetic_cursor_unlocked == true) && (self.global_position.distance_to(mouse_pos) < Globals.magnetic_cursor_size)):
		self.global_position += direction * delta * Globals.magnetic_cursor_speed


func _on_mouse_entered():
	Globals.poop_amount += Globals.copper_poop_value
	copper_poop_collected.emit()
	queue_free()


func _on_decay_timer_timeout():
	queue_free()
