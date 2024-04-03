extends Node2D

var achievements_complete = 0

signal garden_cam_from_achievements
signal all_achievements_complete

# Called when the node enters the scene tree for the first time.
func _ready():
	garden_cam_from_achievements.connect(get_parent().get_node("Garden").get_node("garden_camera")._switch_to_garden_cam_from_achievements.bind())
	all_achievements_complete.connect(get_node("Achievement_Ace")._all_achievements_complete.bind())
	get_node("Gold Rush").get_node("Sprite2D").modulate = Color(0, 0, 0)
	get_node("Diamond Digger").get_node("Sprite2D").modulate = Color(0, 0, 0)
	get_node("Taste the Rainbow").get_node("Sprite2D").modulate = Color(0, 0, 0)
	get_node("Colossal Crusher").get_node("Sprite2D").modulate = Color(0, 0, 0)
	get_node("Poop Frenzy").get_node("Sprite2D").modulate = Color(0, 0, 0)
	get_node("Full House").get_node("Sprite2D").modulate = Color(0, 0, 0)
	get_node("Disco Party").get_node("Sprite2D").modulate = Color(0, 0, 0)
	get_node("Manure Millionare").get_node("Sprite2D").modulate = Color(0, 0, 0)
	get_node("Petting Profeshional").get_node("Sprite2D").modulate = Color(0, 0, 0)
	get_node("Achievement_Ace").get_node("Sprite2D").modulate = Color(0, 0, 0)


func _on_back_to_garden_pressed():
	garden_cam_from_achievements.emit()
	get_parent().get_node("Garden").get_node("Day_Night_Cycle").visible = true


#Revealing golden guinea pigs
func _golden_poop_achievement_unlocked():
	get_node("Gold Rush").get_node("Sprite2D").modulate = Color(1, 1, 1)
	achievements_complete += 1
	check_if_all_complete()

func _diamond_poop_achievement_unlocked():
	get_node("Diamond Digger").get_node("Sprite2D").modulate = Color(1, 1, 1)
	achievements_complete += 1
	check_if_all_complete()

func _prismatic_poop_achievement_unlocked():
	get_node("Taste the Rainbow").get_node("Sprite2D").modulate = Color(1, 1, 1)
	achievements_complete += 1
	check_if_all_complete()

func _giant_poop_achievement_unlocked():
	get_node("Colossal Crusher").get_node("Sprite2D").modulate = Color(1, 1, 1)
	achievements_complete += 1
	check_if_all_complete()

func _max_speed_achievement_unlocked():
	get_node("Poop Frenzy").get_node("Sprite2D").modulate = Color(1, 1, 1)
	achievements_complete += 1
	check_if_all_complete()

func _all_pigs_achievement_unlocked():
	get_node("Full House").get_node("Sprite2D").modulate = Color(1, 1, 1)
	achievements_complete += 1
	check_if_all_complete()

func _disco_achievement_unlocked():
	get_node("Disco Party").get_node("Sprite2D").modulate = Color(1, 1, 1)
	achievements_complete += 1
	check_if_all_complete()

func _one_million_achievement_unlocked():
	get_node("Manure Millionare").get_node("Sprite2D").modulate = Color(1, 1, 1)
	achievements_complete += 1
	check_if_all_complete()

func _thousand_pets_achievement_unlocked():
	get_node("Petting Profeshional").get_node("Sprite2D").modulate = Color(1, 1, 1)
	achievements_complete += 1
	check_if_all_complete()
	
func _achievement_ace_unlocked():
	get_node("Achievement_Ace").get_node("Sprite2D").modulate = Color(1, 1, 1)
	achievements_complete += 1
	check_if_all_complete()
	
func check_if_all_complete():
	print(achievements_complete)
	if achievements_complete == 9:
		all_achievements_complete.emit()
