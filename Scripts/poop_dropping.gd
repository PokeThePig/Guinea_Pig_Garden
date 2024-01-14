extends CharacterBody2D

signal poop_collected

func _ready():
	self.poop_collected.connect(get_parent().get_node("Guinea_Pig")._on_poop_colleced.bind());

func _on_mouse_entered():
	poop_collected.emit()
	queue_free()
