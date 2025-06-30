extends Control

signal pause
signal unpause
signal main_menu
signal settings

# Called when the node enters the scene tree for the first time.
func _ready():
	pause.connect(get_parent().get_node("Music")._pause_music.bind())
	unpause.connect(get_parent().get_node("Music")._unpause_music.bind())
	main_menu.connect(get_parent().get_parent().get_node("Main_Menu").get_node("Main_Menu_Cam")._switch_main_menu_cam.bind())
	settings.connect(get_parent().get_parent().get_node("Settings").get_node("Settings_Cam")._switch_settings_cam.bind())
	hide()


func _on_unpause_button_pressed():
	hide()
	unpause.emit()
	get_tree().paused = false
	pass


func _on_hud_open_settings():
	show()
	pause.emit()
	get_tree().paused = true
	pass


func _on_quit_button_pressed():
	get_tree().quit()


func _on_main_menu_button_pressed() -> void:
	hide()
	unpause.emit()
	main_menu.emit()
	pass


func _on_settings_button_pressed() -> void:
	Globals.past_scene = get_parent().get_node("garden_camera")
	unpause.emit()
	settings.emit()
	pass
