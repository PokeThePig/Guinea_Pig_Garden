extends Node2D

signal save_game
signal load_game
signal switch_garden_cam
signal unpause_music
signal open_settings

func _ready() -> void:
	save_game.connect(get_parent().get_node("Garden")._save_game.bind())
	load_game.connect(get_parent().get_node("Garden")._load_game.bind())
	switch_garden_cam.connect(get_parent().get_node("Garden").get_node("garden_camera")._switch_to_garden_cam.bind())
	unpause_music.connect(get_parent().get_node("Garden").get_node("Music")._unpause_music.bind())
	open_settings.connect(get_parent().get_node("Settings").get_node("Settings_Cam")._open_settings.bind())
	
	await get_tree().create_timer(.5).timeout
	if FileAccess.file_exists("user://SaveFile.json"):
		if Globals.game_loaded == false:
			load_game.emit()
			Globals.game_loaded = true
	else:
		get_parent().get_node("Garden").get_node("Auto_Save").autostart = true
		get_parent().get_node("Garden").get_node("Auto_Save").start()
	get_tree().paused = true

func _on_start_button_button_down() -> void:
	%Start_Text.position = Vector2(0, 5.2)

func _on_start_button_button_up() -> void:
	%Start_Text.position = Vector2(0, 3)

func _on_settings_button_button_down() -> void:
	%Settings_Text.position = Vector2(1.6, 5.2)

func _on_settings_button_button_up() -> void:
	%Settings_Text.position = Vector2(1.6, 3)


func _on_quit_button_button_down() -> void:
	%Quit_Text.position = Vector2(0, 5.2)


func _on_quit_button_button_up() -> void:
	%Quit_Text.position = Vector2(0, 3)


func _on_start_button_pressed() -> void:
	get_tree().paused = false
	switch_garden_cam.emit()
	
	
func _on_quit_button_pressed() -> void:
	save_game.emit()
	get_tree().quit()


func _on_settings_button_pressed() -> void:
	Globals.past_scene = get_node("Main_Menu_Cam")
	open_settings.emit()
