extends Node2D

var mouse_in_area = false
var clicks_left = 3
var max_size_poop = false
var giant_poop_size = 0
var giant_poop_collision = 0

var giant_poop_min = 1
var giant_poop_max = 1.5

signal giant_poop_crushed
signal giant_poop_achievement_unlocked

func _ready():
	_update_giant_poop()
	self.giant_poop_crushed.connect(get_parent().get_parent().get_node("Guinea_Pig")._on_giant_poop_crushed.bind())
	giant_poop_achievement_unlocked.connect(get_parent().get_parent().get_parent().get_parent().get_node("Achievements_Screen")._giant_poop_achievement_unlocked.bind())
	
	giant_poop_size = randf_range(giant_poop_min, giant_poop_max)
	giant_poop_collision = float(giant_poop_size) / 2
	print(giant_poop_size, " ", giant_poop_collision)
	
	get_node("giant_poop_sprite").set_scale(Vector2(giant_poop_size, giant_poop_size))
	get_node("giant_poop_collision").set_scale(Vector2(giant_poop_collision, giant_poop_collision))
	
	#Setting giant poop health
	if (giant_poop_size >= 1.25) && (giant_poop_size <= 1.5):
		clicks_left = 4
	elif (giant_poop_size > 1.5) && (giant_poop_size <= 1.75):
		clicks_left = 5
	elif (giant_poop_size > 1.75) && (giant_poop_size <= 2):
		clicks_left = 6
	elif (giant_poop_size > 2) && (giant_poop_size <= 2.25):
		clicks_left = 7
	elif (giant_poop_size > 2.25) && (giant_poop_size <= 2.5):
		clicks_left = 8
	elif (giant_poop_size > 2.5) && (giant_poop_size <= 2.75):
		clicks_left = 9
	elif (giant_poop_size > 2.75):
		clicks_left = 10
		max_size_poop = true

func crunch_randomizer():
	var sound_effect_num = floor(randf_range(0,2))
	if sound_effect_num == 0:
		return $crush_1
	elif sound_effect_num == 1:
		return $crush_2

func _on_mouse_entered():
	mouse_in_area = true
	
func _on_mouse_exited():
	mouse_in_area = false

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed == true:
			if mouse_in_area == true:
				clicks_left -= 1
				if clicks_left > 0:
					crunch_randomizer().play()
					print("Giant poop health: ", clicks_left)
					giant_poop_size = get_node("giant_poop_sprite").get_scale()
					print("Giant poop size ", giant_poop_size.x)
				else:
					print("Giant poop popped")
					giant_poop_crushed.emit()
					var giant_poop_amount = snappedf(pow(giant_poop_size.x, 2), 0.01) * 100
					Globals.poop_amount += giant_poop_amount
					if (max_size_poop == true) and (Globals.colossal_crusher_achievement_completed == false):
						giant_poop_achievement_unlocked.emit()
						Globals.colossal_crusher_achievement_completed = true
						print("MAX POOP POPPED")
						pass
					queue_free()


func _on_decay_timer_timeout():
	queue_free()
	
'''Updating Giant Poop Sizes'''
func _update_giant_poop():
	giant_poop_min = get_parent().get_parent().get_node("Guinea_Pig").giant_poop_minimum
	giant_poop_max = get_parent().get_parent().get_node("Guinea_Pig").giant_poop_maximum
