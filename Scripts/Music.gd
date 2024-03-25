extends Node2D

@onready var main_one = $main_song_one
@onready var main_two = $main_song_two
@onready var main_three = $main_song_three
@onready var gold_song = $gold_poop_song


var gold_started = false
var song_state = null
var current_song = null
var pauseposition = null

func _ready():
	song_state = floor(randf_range(0,3))
	if song_state == 0:
		main_one.play()
		current_song = main_one
	elif song_state == 1:
		main_two.play()
		current_song = main_two
	elif song_state == 2:
		main_three.play()
		current_song = main_three

func _process(_delta):
	if (Globals.golden_poop_active == true) and (gold_started == false):
		current_song.stop()
		gold_song.play()
		gold_started = true

func _song_randomizer():
	song_state = floor(randf_range(0,3))
	if song_state == 0:
		main_one.play()
		current_song = main_one
	elif song_state == 1:
		main_two.play()
		current_song = main_two
	elif song_state == 2:
		main_three.play()
		current_song = main_three

func _on_gold_poop_song_finished():
	current_song.play()
	gold_started = false

func _on_main_song_one_finished():
	_song_randomizer()

func _on_main_song_two_finished():
	_song_randomizer()

func _on_main_song_three_finished():
	_song_randomizer()
