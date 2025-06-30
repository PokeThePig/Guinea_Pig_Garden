extends Node2D

@onready var main_one = $main_song_one
@onready var main_two = $main_song_two
@onready var main_three = $main_song_three
@onready var main_four = $main_song_four
@onready var main_five = $main_song_five
@onready var gold_song = $gold_poop_song
@onready var king_song = $king_poop_song

var song_state = null
var current_song = null
var effect_pause_position = null
var king_pause_position = null
var pause_position = null

var gold_started = false
var king_started = false

func _ready():
	_song_randomizer()

		
func _start_gold_song():
	if Globals.kings_coronation_active == true:
		king_song.stop()
	if current_song != null:
		effect_pause_position = current_song.get_playback_position()
	current_song.stop()
	gold_song.play()
	gold_started = true
	
func _start_king_song():
	if Globals.golden_poop_active == true:
		gold_song.stop()
	if current_song != null:
		effect_pause_position = current_song.get_playback_position()
	current_song.stop()
	king_song.play()
	king_started = true

func _song_randomizer():
	song_state = randi_range(0,4)
	match song_state:
		0:
			main_one.play()
			current_song = main_one
		1:
			main_two.play()
			current_song = main_two
		2:
			main_three.play()
			current_song = main_three
		3:
			main_four.play()
			current_song = main_four
		4:
			main_five.play()
			current_song = main_five

func _on_gold_poop_song_finished():
	if (Globals.kings_coronation_active != true):
		current_song.play(effect_pause_position)
	gold_started = false

func _on_king_poop_song_finished():
	if (Globals.golden_poop_active != true):
		current_song.play(effect_pause_position)
	king_started = false

func _on_main_song_one_finished():
	current_song = null
	_song_randomizer()

func _on_main_song_two_finished():
	current_song = null
	_song_randomizer()

func _on_main_song_three_finished():
	current_song = null
	_song_randomizer()

func _on_main_song_four_finished():
	current_song = null
	_song_randomizer()

func _on_main_song_five_finished():
	current_song = null
	_song_randomizer()


func _pause_music():
	if gold_started == true:
		pause_position = gold_song.get_playback_position()
		gold_song.stop()
	if king_started == true:
		pause_position = king_song.get_playback_position()
		king_song.stop()
	else:
		if current_song != null:
			pause_position = current_song.get_playback_position()
			current_song.stop()
	
func _unpause_music():
	if gold_started == true:
		gold_song.play(pause_position)
	if king_started == true:
		king_song.play(pause_position)
	elif pause_position != null:
		current_song.play(pause_position)
