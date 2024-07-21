extends CharacterBody2D

@onready var gold_poop_effect = load("res://Scenes/Garden/golden_poop_effect.tscn")
@onready var poop_animation = $AnimationPlayer

signal effect_start
signal gold_poop_achievement_unlocked

func _ready():
	effect_start.connect(get_parent().get_node("Guinea_Pig")._start_golden_poop_effect.bind())
	gold_poop_achievement_unlocked.connect(get_parent().get_parent().get_parent().get_node("Achievements_Screen")._golden_poop_achievement_unlocked.bind())
	Globals.gold_poop_pig = get_parent().get_node("Guinea_Pig")

func _process(_delta):
	poop_animation.play("gold_poop_sparkle")

func _on_mouse_entered():
	effect_start.emit()
	get_parent().add_child(gold_poop_effect.instantiate())
	Globals.golden_poop_active = true
	print(Globals.poop_amount)
	if Globals.gold_rush_achievement_completed == false:
		gold_poop_achievement_unlocked.emit()
		Globals.gold_rush_achievement_completed = true
	queue_free()


func _on_decay_timer_timeout():
	if Globals.golden_poop_active == false:
		Globals.golden_poop_dropped = false
		queue_free()
