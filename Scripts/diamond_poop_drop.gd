extends Node2D

@onready var poop_animation = $AnimationPlayer

signal diamond_poop_collected

func _ready():
	self.diamond_poop_collected.connect(get_parent().get_parent().get_node("Guinea_Pig")._on_diamond_poop_collected.bind())

func _process(_delta):
	poop_animation.play("diamond_poop_sparkle")
	
func _on_mouse_entered():
	Globals.diamond_poop_amount += 1
	diamond_poop_collected.emit()
	print(Globals.diamond_poop_amount)
	queue_free()
