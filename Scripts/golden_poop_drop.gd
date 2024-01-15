extends CharacterBody2D

@onready var gold_poop_effect = load("res://Scenes/Garden/golden_poop_effect.tscn")
@onready var poop_animation = $AnimationPlayer

signal effect_start

func _ready():
	effect_start.connect(get_parent().get_node("Guinea_Pig")._start_golden_poop_effect.bind());

func _process(_delta):
	poop_animation.play("gold_poop_sparkle")

func _on_mouse_entered():
	effect_start.emit()
	get_parent().add_child(gold_poop_effect.instantiate())
	Globals.poop_amount += 1
	Globals.golden_poop_active = true
	print(Globals.poop_amount)
	queue_free()
