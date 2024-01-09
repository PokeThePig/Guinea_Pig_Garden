extends CharacterBody2D

'''
@onready var gold_animation = $AnimationPlayer

func _ready():
	Guinea_Pig.golden_drop.connect(_play_animation())

func _play_animation():
	gold_animation.play("poop_sparkle")
'''


func _on_mouse_entered():
	if mouse_entered:
		Globals.poop_amount += 100
		print(Globals.poop_amount)
		queue_free()

