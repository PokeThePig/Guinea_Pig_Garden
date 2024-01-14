extends Control

signal unpause

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


func _on_unpause_button_pressed():
	hide()
	get_tree().paused = false
	pass


func _on_hud_open_settings():
	show()
	get_tree().paused = true
	pass


func _on_quit_button_pressed():
	get_tree().quit()
