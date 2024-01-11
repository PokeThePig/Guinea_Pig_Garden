extends CharacterBody2D

@onready var gold_poop_effect = load("res://Scenes/golden_poop_effect.tscn")
@onready var poop_animation = $AnimationPlayer

func _process(_delta):
	poop_animation.play("poop_sparkle")


func _on_mouse_entered():
	if mouse_entered:
		
		get_parent().add_child(gold_poop_effect.instantiate())
		
		Globals.poop_amount += 1
		Globals.golden_poop_active = true
		print(Globals.poop_amount)
		
		queue_free()



#When collected, start 10 second effect, no more gold poops, poop spawner time up, movespeed up

#global true false for gold poop spawner

