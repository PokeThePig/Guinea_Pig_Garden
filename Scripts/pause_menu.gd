extends Control

signal pause
signal unpause

# Called when the node enters the scene tree for the first time.
func _ready():
	pause.connect(get_parent().get_node("Music")._pause_music.bind())
	unpause.connect(get_parent().get_node("Music")._unpause_music.bind())
	hide()


func _on_unpause_button_pressed():
	hide()
	unpause.emit()
	get_parent().get_node("Day_Night_Cycle").visible = true
	get_tree().paused = false
	pass


func _on_hud_open_settings():
	show()
	pause.emit()
	get_parent().get_node("Day_Night_Cycle").visible = false
	get_tree().paused = true
	pass


func _on_quit_button_pressed():
	get_tree().quit()
