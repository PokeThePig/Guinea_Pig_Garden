extends Node2D

signal leave_settings
signal pause

func _ready() -> void:
	leave_settings.connect(get_parent().get_node("Garden").get_node("garden_camera")._leave_settings.bind())
	pause.connect(get_parent().get_node("Garden").get_node("Music")._pause_music.bind())

func _on_reset_button_pressed() -> void:
	
	get_tree().reload_current_scene()

func _on_back_button_pressed() -> void:
	Globals.past_scene.make_current()
	if Globals.past_scene == get_parent().get_node("Garden").get_node("garden_camera"):
		pause.emit()

func _on_reset_button_button_down() -> void:
	$Reset_Button/Reset_Label.position = Vector2(0,0)

func _on_reset_button_button_up() -> void:
	$Reset_Button/Reset_Label.position = Vector2(0,-2)
