extends CharacterBody2D

@onready var poop_animation = $AnimationPlayer

signal prismatic_poop_collected
signal prismatic_poop_achievement_unlocked

func _ready():
	self.prismatic_poop_collected.connect(get_parent().get_parent().get_node("Guinea_Pig")._on_prismatic_poop_collected.bind())
	prismatic_poop_achievement_unlocked.connect(get_parent().get_parent().get_parent().get_parent().get_node("Achievements_Screen")._prismatic_poop_achievement_unlocked.bind())

func _process(_delta):
	poop_animation.play("prismatic_poop_animation")
	
func _on_mouse_entered():
	Globals.prismatic_poop_amount += 1;
	prismatic_poop_collected.emit()
	print("Prismatic: ", Globals.prismatic_poop_amount)
	if Globals.taste_rainbow_achievement_completed == false:
		prismatic_poop_achievement_unlocked.emit()
		Globals.taste_rainbow_achievement_completed = true
	queue_free()


func _on_decay_timer_timeout():
	queue_free()
