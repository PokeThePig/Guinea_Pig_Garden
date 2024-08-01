extends Node2D

signal copper_poop_collected

# Called when the node enters the scene tree for the first time.
func _ready():
	self.copper_poop_collected.connect(get_parent().get_node("Guinea_Pig")._on_copper_poop_collected.bind())

func _on_mouse_entered():
	copper_poop_collected.emit()
	queue_free()


func _on_decay_timer_timeout():
	queue_free()
