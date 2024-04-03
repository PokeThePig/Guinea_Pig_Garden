extends Node2D

@onready var rainbow_sprite = get_parent().get_node("Pig_Sprite")
@onready var disco_animation = $AnimationPlayer

var face_left = true

signal disco_achievement_unlocked

# Called when the node enters the scene tree for the first time.
func _ready():
	rainbow_sprite.visible = false
	disco_achievement_unlocked.connect(get_parent().get_parent().get_parent().get_parent().get_node("Achievements_Screen")._disco_achievement_unlocked.bind())
	if (Globals.disco_party_achievement_completed == false):
		disco_achievement_unlocked.emit()
		Globals.disco_party_achievement_completed = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	disco_animation.play("disco_walk")

#Randomized movement
	if rainbow_sprite.flip_h == true:
		$disco_sprite.flip_h = true
	elif rainbow_sprite.flip_h == false:
		$disco_sprite.flip_h = false
	


func _on_effect_duration_timeout():
	rainbow_sprite.visible = true
	queue_free()
	
