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
	await get_tree().create_timer(1).timeout
	print(achievements_complete)
	if Globals.gold_rush_achievement_completed and Globals.diamond_digger_achievement_completed and Globals.taste_rainbow_achievement_completed and Globals.colossal_crusher_achievement_completed and Globals.poop_frenzy_achievement_completed and Globals.full_house_achievement_completed and Globals.disco_party_achievement_completed and Globals.manure_millionare_achievement_completed and Globals.petting_professional_achievement_completed:
		all_achievements_complete.emit()
		
func _load_achievements():
	if Globals.gold_rush_achievement_completed:
		_golden_poop_achievement_unlocked()
	if Globals.diamond_digger_achievement_completed:
		_diamond_poop_achievement_unlocked()
	if Globals.taste_rainbow_achievement_completed:
		_prismatic_poop_achievement_unlocked()
	if Globals.colossal_crusher_achievement_completed:
		_giant_poop_achievement_unlocked()
	if Globals.poop_frenzy_achievement_completed:
		_max_speed_achievement_unlocked()
	if Globals.full_house_achievement_completed:
		_all_pigs_achievement_unlocked()
	if Globals.disco_party_achievement_completed:
		_disco_achievement_unlocked()
	if Globals.manure_millionare_achievement_completed:
		_one_million_achievement_unlocked()
	if Globals.petting_professional_achievement_completed:
		_thousand_pets_achievement_unlocked()
	check_if_all_complete()
