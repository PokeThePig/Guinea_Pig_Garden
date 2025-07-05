extends Node2D

signal leave_settings
signal pause
signal save
signal restore_volume

func _ready() -> void:
	leave_settings.connect(get_parent().get_node("Garden").get_node("garden_camera")._leave_settings.bind())
	pause.connect(get_parent().get_node("Garden").get_node("Music")._pause_music.bind())
	save.connect(get_parent().get_node("Garden")._save_game.bind())
	restore_volume.connect(get_node("master_volume")._restore_volume.bind())
	restore_volume.connect(get_node("music_volume")._restore_volume.bind())
	restore_volume.connect(get_node("sfx_volume")._restore_volume.bind())

func _on_reset_button_pressed() -> void:
	$Reset_Confirmation.visible = true

func _on_back_button_pressed() -> void:
	Globals.past_scene.make_current()
	if Globals.past_scene == get_parent().get_node("Garden").get_node("garden_camera"):
		pause.emit()

func _on_back_button_button_down() -> void:
	$Back_Button/Back_Label.position = Vector2(0,2)

func _on_back_button_button_up() -> void:
	$Back_Button/Back_Label.position = Vector2(0,0)

func _on_reset_button_button_down() -> void:
	$Reset_Button/Reset_Label.position = Vector2(0,0)

func _on_reset_button_button_up() -> void:
	$Reset_Button/Reset_Label.position = Vector2(0,-2)


func _on_confirm_button_button_up() -> void:
	$Reset_Confirmation/Confirm_Label.position = Vector2(632, 688)

func _on_confirm_button_button_down() -> void:
	$Reset_Confirmation/Confirm_Label.position = Vector2(632, 694)

func _on_confirm_button_pressed() -> void:
	_reset_all_values()
	restore_volume.emit()
	get_tree().reload_current_scene()


func _on_cancel_button_button_down() -> void:
	$Reset_Confirmation/Cancel_Label.position = Vector2(824, 694)

func _on_cancel_button_button_up() -> void:
	$Reset_Confirmation/Cancel_Label.position = Vector2(824, 688)

func _on_cancel_button_pressed() -> void:
	$Reset_Confirmation.visible = false


func _reset_all_values():
	#Guinea pigs
	Globals.guinea_dictionary = {}
	Globals.guinea_purchase_order = []

	Globals.new_pig = null
	Globals.upgrade_guinea_id = null
	Globals.poop_speed_upgrade_amount = 0.0
	Globals.double_poop_upgrade_amount = 0
	Globals.giant_poop_upgrade_minimum = 0
	Globals.giant_poop_upgrade_maximum = 0

	Globals.upgrade_dictionary = {"Bella": []}

	#Unique upgrades
	Globals.squeek_frenzy_purchased = false
	Globals.squeek_frenzy_effect_active = false
	Globals.squeek_frenzy_duration = 0

	Globals.hibernation_purchased = false
	Globals.hiberation_sleep_active = false
	Globals.hiberation_effect_active = false
	Globals.hibernation_sleep_time = 0
	Globals.hibernation_effect_time = 0

	Globals.rain_or_shine_purchased = false
	Globals.giant_prismatic_purchased = false
	Globals.chroma_prismatic_odds = 1

	Globals.copper_poop_purchased = false
	Globals.copper_poop_value = 1

	Globals.kings_coronation_purchased = false
	Globals.king_poop_dropped = false
	Globals.kings_coronation_active = false

	#Poop counts
	Globals.poop_amount = 0
	Globals.diamond_poop_amount = 0
	Globals.prismatic_poop_amount = 0

	Globals.currently_raining = false
	Globals.past_scene = null

	#Shop purchases
	Globals.guinea_two_purchased = false
	Globals.rich_guinea_purchased = false
	Globals.rainbow_guinea_purchased = false
	Globals.king_calix_purchased = false

	Globals.guinea_pigs_purchased = 0
	Globals.pet_count = 0

	#Achievements
	Globals.gold_rush_achievement_completed = false
	Globals.diamond_digger_achievement_completed = false
	Globals.taste_rainbow_achievement_completed = false
	Globals.colossal_crusher_achievement_completed = false
	Globals.poop_frenzy_achievement_completed = false
	Globals.full_house_achievement_completed = false
	Globals.disco_party_achievement_completed = false
	Globals.manure_millionare_achievement_completed = false
	Globals.petting_professional_achievement_completed = false

	#Poop type purchases
	Globals.diamond_poop_purchased = false
	Globals.giant_poop_purchased = false
	Globals.prismatic_poop_purchased = false

	Globals.double_poop_purchased = false

	#Poop drops variables
	Globals.state = 0
	Globals.movespeed = 0
	Globals.poop_drop_speed = 0
	Globals.golden_poop_active = false
	Globals.gold_poop_pig = null
	Globals.golden_poop_dropped = false
	Globals.poop_speed_multiplier = 1
	Globals.max_speed_upgrade = false
	Globals.giant_poop_min = 1
	Globals.giant_poop_max = 1.5

	#settings
	Globals.master_volume = 0.75
	Globals.music_volume = 0.75
	Globals.sound_effects_volume = 0.75
	Globals.auto_save = true

func _on_check_box_toggled(toggled_on: bool) -> void:
	Globals.auto_save = toggled_on
