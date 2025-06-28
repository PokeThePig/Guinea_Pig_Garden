extends CharacterBody2D

@onready var guinea_pig_assets = load("res://Scenes/Garden/Guinea_Pig.tscn")

var mouse_in_area = false
var achievement_unlocked = false

func _on_mouse_entered():
	mouse_in_area = true
	if (achievement_unlocked == true):
		$Sprite2D.frame = 1

func _on_mouse_exited():
	mouse_in_area = false
	if (achievement_unlocked == true):
		$Sprite2D.frame = 0

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed == true:
			if mouse_in_area == true:
				if achievement_unlocked == true:
					var new_pig = guinea_pig_assets.instantiate()
					get_parent().get_parent().get_node("Garden").add_child(new_pig)
					new_pig.global_position = Vector2(0,0)
					
					var new_pig_sprite = new_pig.get_node("Guinea_Pig").get_node("Pig_Sprite")
					new_pig_sprite.texture = load("res://Sprites/Currently Used/Gold_Pig-Sheet.png")
					
					var new_pig_assets = new_pig.get_node("Guinea_Pig")
					new_pig_assets.set_scale(Vector2(1.2, 1.2))
					
func _all_achievements_complete():
	achievement_unlocked = true
	get_node("Sprite2D").modulate = Color(1, 1, 1)
	
