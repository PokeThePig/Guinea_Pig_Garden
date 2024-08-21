extends CharacterBody2D

@onready var kings_coronation_effect = load("res://Scenes/Garden/kings_coronation_effect.tscn")
@onready var poop_animation = $AnimationPlayer

signal effect_start

func _ready():
	effect_start.connect(get_parent().get_parent().get_node("Guinea_Pig")._start_kings_coronation_effect.bind())

func _process(_delta):
	poop_animation.play("king_poop_shine")

func _on_mouse_entered():
	Globals.prismatic_poop_amount += 100
	Globals.diamond_poop_amount += 1
	effect_start.emit()
	get_parent().get_parent().add_child(kings_coronation_effect.instantiate())
	Globals.kings_coronation_active = true
	queue_free()


func _on_decay_timer_timeout():
	if Globals.kings_coronation_active == false:
		Globals.king_poop_dropped = false
		queue_free()
