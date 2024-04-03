extends Node2D

@onready var poop_animation = $AnimationPlayer

signal diamond_poop_collected
signal diamond_poop_achievement_unlocked

func _ready():
	self.diamond_poop_collected.connect(get_parent().get_parent().get_node("Guinea_Pig")._on_diamond_poop_collected.bind())
	diamond_poop_achievement_unlocked.connect(get_parent().get_parent().get_parent().get_parent().get_node("Achievements_Screen")._diamond_poop_achievement_unlocked.bind())

func _process(_delta):
	poop_animation.play("diamond_poop_sparkle")
	
func _on_mouse_entered():
	Globals.diamond_poop_amount += 1
	diamond_poop_collected.emit()
	print(Globals.diamond_poop_amount)
	if Globals.diamond_digger_achievement_completed == false:
		diamond_poop_achievement_unlocked.emit()
		Globals.diamond_digger_achievement_completed = true
	queue_free()

func _on_decay_timer_timeout():
	queue_free()
