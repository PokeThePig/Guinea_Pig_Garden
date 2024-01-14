extends Node2D

@onready var poop_animation = $AnimationPlayer

func _process(_delta):
	poop_animation.play("poop_sparkle")

func _on_mouse_entered():
	Globals.diamond_poop_amount += 1
	print(Globals.diamond_poop_amount)
	queue_free()
