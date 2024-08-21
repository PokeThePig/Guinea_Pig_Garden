extends CharacterBody2D

var play_animation = false
var is_clickable = false

func _physics_process(_delta):
	if play_animation:
		$AnimationPlayer.play("piggy bank")
	

func _on_mouse_entered():
	play_animation = true
	is_clickable = true


func _on_mouse_exited():
	play_animation = false
	is_clickable = false
	
func _input(event):
	if event is InputEventMouseButton:
		if event.pressed == true:
			if is_clickable == true:
				%Coming_soon_label.visible = true
				await get_tree().create_timer(3).timeout
				%Coming_soon_label.visible = false
				
