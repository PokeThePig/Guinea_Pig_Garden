extends Node2D

@onready var main_one = $main_song_one
@onready var main_two = $main_song_two
@onready var main_three = $main_song_three
@onready var main_four = $main_song_four
@onready var main_five = $main_song_five
@onready var gold_song = $gold_poop_song


var gold_started = false
var song_state = null
var current_song = null
var gold_pause_position = null
var pause_position = null

func _ready():
	_song_randomizer()

func _process(_delta):
	if (Globals.golden_poop_active == true) and (gold_started == false):
		if current_song != null:
			gold_pause_position = current_song.get_playback_position()
		current_song.stop()
		gold_song.play()
		gold_started = true

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
	current_song.play(gold_pause_position)
	gold_started = false

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
	else:
		if current_song != null:
			pause_position = current_song.get_playback_position()
			current_song.stop()
	
func _unpause_music():
	if gold_started == true:
		gold_song.play(pause_position)
	else:
		current_song.play(pause_position)
