extends Node2D

@onready var guinea_pig_assets = load("res://Scenes/Garden/Guinea_Pig.tscn")

signal shop_opened
signal achievements_opened
signal update_buttons
signal restore_upgrades
signal update_poop_upgrades_shop
signal update_bella

var pig_count = 1
var pig_name = "Bella"
var new_pig = null
var current_pig = null
var new_pig_sprite = null

func _ready():
	shop_opened.connect(get_parent().get_node("Shop_Scene").get_node("main_shop_camera")._switch_to_shop_cam.bind())
	achievements_opened.connect(get_parent().get_node("Achievements_Screen").get_node("achievements_cam")._switch_to_achievements_cam.bind())
	update_buttons.connect(get_parent().get_node("Poop_Types_Shop")._update_buttons.bind())
	update_buttons.connect(get_parent().get_node("guinea_pigs_shop")._update_buttons.bind())
	update_poop_upgrades_shop.connect(get_parent().get_node("Poop_Upgrades_Shop")._load_poop_upgrades.bind())
	update_bella.connect(get_parent().get_node("Poop_Upgrades_Shop").get_node("ScrollContainer").get_node("VBoxContainer").get_node("ScrollContainer").get_node("HBoxContainer").get_node("Poop_Speed_Purchase")._update_bella.bind())
	update_bella.connect(get_parent().get_node("Poop_Upgrades_Shop").get_node("ScrollContainer").get_node("VBoxContainer").get_node("ScrollContainer").get_node("HBoxContainer").get_node("Double_poop_drop_purchase")._update_bella.bind())
	update_bella.connect(get_parent().get_node("Poop_Upgrades_Shop").get_node("ScrollContainer").get_node("VBoxContainer").get_node("ScrollContainer").get_node("HBoxContainer").get_node("giant_poop_upgrade")._update_bella.bind())
	await get_tree().create_timer(.05).timeout
	update_bella.connect(instance_from_id(Globals.upgrade_dictionary["Bella"][0]).get_node("HBoxContainer").get_node("Squeek_Frenzy_Purchase")._update_bella.bind())
	
	_spawn_pig(pig_name)
	new_pig_sprite.texture = load("res://Sprites/Currently Used/Bella2.0-Sheet.png")

func _on_hud_open_shop():
	shop_opened.emit()
	$Day_Night_Cycle.visible = false

func _switch_to_achievements_cam():
	achievements_opened.emit()
	$Day_Night_Cycle.visible = false
	

func _on_save_pressed() -> void:
	#poop counts
	SaveLoad.contents_to_save.regular_poop_amount = Globals.poop_amount
	SaveLoad.contents_to_save.diamond_poop_amount = Globals.diamond_poop_amount
	SaveLoad.contents_to_save.prismatic_poop_amount = Globals.prismatic_poop_amount
	#guinea pigs bought
	SaveLoad.contents_to_save.gizmo_unlocked = Globals.guinea_two_purchased
	SaveLoad.contents_to_save.pennybags_unlocked = Globals.rich_guinea_purchased
	SaveLoad.contents_to_save.chroma_unlocked = Globals.rainbow_guinea_purchased
	SaveLoad.contents_to_save.calix_unlocked = Globals.king_calix_purchased
	#poop types
	SaveLoad.contents_to_save.giant_poop_unlocked = Globals.giant_poop_purchased
	SaveLoad.contents_to_save.diamond_poop_unlocked = Globals.diamond_poop_purchased
	SaveLoad.contents_to_save.prismatic_poop_unlocked = Globals.prismatic_poop_purchased
	#poop speed upgrades
	SaveLoad.contents_to_save.bella_poop_speed = instance_from_id(Globals.guinea_dictionary["Bella"]).poop_speed
	SaveLoad.contents_to_save.bella_double_unlocked = instance_from_id(Globals.guinea_dictionary["Bella"]).double_poop_unlocked
	SaveLoad.contents_to_save.bella_double_chance = instance_from_id(Globals.guinea_dictionary["Bella"]).double_poop_chance
	SaveLoad.contents_to_save.bella_giant_min = instance_from_id(Globals.guinea_dictionary["Bella"]).giant_poop_minimum
	SaveLoad.contents_to_save.bella_giant_max = instance_from_id(Globals.guinea_dictionary["Bella"]).giant_poop_maximum
	if Globals.guinea_two_purchased == true:
		SaveLoad.contents_to_save.gizmo_poop_speed = instance_from_id(Globals.guinea_dictionary["Gizmo"]).poop_speed
		SaveLoad.contents_to_save.gizmo_double_unlocked = instance_from_id(Globals.guinea_dictionary["Gizmo"]).double_poop_unlocked
		SaveLoad.contents_to_save.gizmo_double_chance = instance_from_id(Globals.guinea_dictionary["Gizmo"]).double_poop_chance
		SaveLoad.contents_to_save.gizmo_giant_min = instance_from_id(Globals.guinea_dictionary["Gizmo"]).giant_poop_minimum
		SaveLoad.contents_to_save.gizmo_giant_max = instance_from_id(Globals.guinea_dictionary["Gizmo"]).giant_poop_maximum
	if Globals.rich_guinea_purchased == true:
		SaveLoad.contents_to_save.pennybags_poop_speed = instance_from_id(Globals.guinea_dictionary["Pennybags"]).poop_speed
		SaveLoad.contents_to_save.pennybags_double_unlocked = instance_from_id(Globals.guinea_dictionary["Pennybags"]).double_poop_unlocked
		SaveLoad.contents_to_save.pennybags_double_chance = instance_from_id(Globals.guinea_dictionary["Pennybags"]).double_poop_chance
		SaveLoad.contents_to_save.pennybags_giant_min = instance_from_id(Globals.guinea_dictionary["Pennybags"]).giant_poop_minimum
		SaveLoad.contents_to_save.pennybags_giant_max = instance_from_id(Globals.guinea_dictionary["Pennybags"]).giant_poop_maximum
	if Globals.rainbow_guinea_purchased == true:
		SaveLoad.contents_to_save.chroma_poop_speed = instance_from_id(Globals.guinea_dictionary["Chroma"]).poop_speed
		SaveLoad.contents_to_save.chroma_double_unlocked = instance_from_id(Globals.guinea_dictionary["Chroma"]).double_poop_unlocked
		SaveLoad.contents_to_save.chroma_double_chance = instance_from_id(Globals.guinea_dictionary["Chroma"]).double_poop_chance
		SaveLoad.contents_to_save.chroma_giant_min = instance_from_id(Globals.guinea_dictionary["Chroma"]).giant_poop_minimum
		SaveLoad.contents_to_save.chroma_giant_max = instance_from_id(Globals.guinea_dictionary["Chroma"]).giant_poop_maximum
	if Globals.king_calix_purchased == true:
		SaveLoad.contents_to_save.calix_poop_speed = instance_from_id(Globals.guinea_dictionary["Calix"]).poop_speed
		SaveLoad.contents_to_save.calix_double_unlocked = instance_from_id(Globals.guinea_dictionary["Calix"]).double_poop_unlocked
		SaveLoad.contents_to_save.calix_double_chance = instance_from_id(Globals.guinea_dictionary["Calix"]).double_poop_chance
		SaveLoad.contents_to_save.calix_giant_min = instance_from_id(Globals.guinea_dictionary["Calix"]).giant_poop_minimum
		SaveLoad.contents_to_save.calix_giant_max = instance_from_id(Globals.guinea_dictionary["Calix"]).giant_poop_maximum
	#unique upgrades
	SaveLoad.contents_to_save.squeek_frenzy_unlocked = Globals.squeek_frenzy_purchased
	SaveLoad.contents_to_save.squeek_frenzy_duration = Globals.squeek_frenzy_duration
	SaveLoad.contents_to_save.hibernation_unlocked = Globals.hibernation_purchased
	SaveLoad.contents_to_save.hibernation_sleep_duration = Globals.hibernation_sleep_time
	SaveLoad.contents_to_save.hibernation_effect_duration = Globals.hibernation_effect_time
	SaveLoad.contents_to_save.copper_poop_unlocked = Globals.copper_poop_purchased
	SaveLoad.contents_to_save.copper_poop_worth = Globals.copper_poop_value
	SaveLoad.contents_to_save.rain_or_shine_unlocked = Globals.rain_or_shine_purchased
	SaveLoad.contents_to_save.chroma_prismatic_chance = Globals.chroma_prismatic_odds
	SaveLoad.contents_to_save.king_poop_unlocked = Globals.kings_coronation_purchased
	
	SaveLoad.contents_to_save.guinea_order = Globals.guinea_purchase_order
	SaveLoad.contents_to_save.upgrades_left_dictionary = Globals.upgrade_dictionary
	
	print(Globals.upgrade_dictionary)
	
	SaveLoad._save()


func _on_load_pressed() -> void:
	SaveLoad._load()
	Globals.poop_amount = SaveLoad.contents_to_save.regular_poop_amount
	Globals.diamond_poop_amount = SaveLoad.contents_to_save.diamond_poop_amount
	Globals.prismatic_poop_amount = SaveLoad.contents_to_save.prismatic_poop_amount
	Globals.guinea_two_purchased = SaveLoad.contents_to_save.gizmo_unlocked
	Globals.rich_guinea_purchased = SaveLoad.contents_to_save.pennybags_unlocked
	Globals.rainbow_guinea_purchased = SaveLoad.contents_to_save.chroma_unlocked
	Globals.king_calix_purchased = SaveLoad.contents_to_save.calix_unlocked
	Globals.giant_poop_purchased = SaveLoad.contents_to_save.giant_poop_unlocked
	Globals.diamond_poop_purchased = SaveLoad.contents_to_save.diamond_poop_unlocked
	Globals.prismatic_poop_purchased = SaveLoad.contents_to_save.prismatic_poop_unlocked
	_guinea_spawning()
	
	instance_from_id(Globals.guinea_dictionary["Bella"]).poop_speed = SaveLoad.contents_to_save.bella_poop_speed
	instance_from_id(Globals.guinea_dictionary["Bella"]).double_poop_unlocked = SaveLoad.contents_to_save.bella_double_unlocked
	instance_from_id(Globals.guinea_dictionary["Bella"]).double_poop_chance = SaveLoad.contents_to_save.bella_double_chance
	instance_from_id(Globals.guinea_dictionary["Bella"]).giant_poop_minimum = SaveLoad.contents_to_save.bella_giant_min
	instance_from_id(Globals.guinea_dictionary["Bella"]).giant_poop_maximum = SaveLoad.contents_to_save.bella_giant_max
	if Globals.guinea_two_purchased == true:
		instance_from_id(Globals.guinea_dictionary["Gizmo"]).poop_speed = SaveLoad.contents_to_save.gizmo_poop_speed
		instance_from_id(Globals.guinea_dictionary["Gizmo"]).double_poop_unlocked = SaveLoad.contents_to_save.gizmo_double_unlocked
		instance_from_id(Globals.guinea_dictionary["Gizmo"]).double_poop_chance = SaveLoad.contents_to_save.gizmo_double_chance
		instance_from_id(Globals.guinea_dictionary["Gizmo"]).giant_poop_minimum = SaveLoad.contents_to_save.gizmo_giant_min
		instance_from_id(Globals.guinea_dictionary["Gizmo"]).giant_poop_maximum = SaveLoad.contents_to_save.gizmo_giant_max
	if Globals.rich_guinea_purchased == true:
		instance_from_id(Globals.guinea_dictionary["Pennybags"]).poop_speed = SaveLoad.contents_to_save.pennybags_poop_speed
		instance_from_id(Globals.guinea_dictionary["Pennybags"]).double_poop_unlocked = SaveLoad.contents_to_save.pennybags_double_unlocked
		instance_from_id(Globals.guinea_dictionary["Pennybags"]).double_poop_chance = SaveLoad.contents_to_save.pennybags_double_chance
		instance_from_id(Globals.guinea_dictionary["Pennybags"]).giant_poop_minimum = SaveLoad.contents_to_save.pennybags_giant_min
		instance_from_id(Globals.guinea_dictionary["Pennybags"]).giant_poop_maximum = SaveLoad.contents_to_save.pennybags_giant_max
	if Globals.rainbow_guinea_purchased == true:
		instance_from_id(Globals.guinea_dictionary["Chroma"]).poop_speed = SaveLoad.contents_to_save.chroma_poop_speed
		instance_from_id(Globals.guinea_dictionary["Chroma"]).double_poop_unlocked = SaveLoad.contents_to_save.chroma_double_unlocked
		instance_from_id(Globals.guinea_dictionary["Chroma"]).double_poop_chance = SaveLoad.contents_to_save.chroma_double_chance
		instance_from_id(Globals.guinea_dictionary["Chroma"]).giant_poop_minimum = SaveLoad.contents_to_save.chroma_giant_min
		instance_from_id(Globals.guinea_dictionary["Chroma"]).giant_poop_maximum = SaveLoad.contents_to_save.chroma_giant_max
	if Globals.king_calix_purchased == true:
		instance_from_id(Globals.guinea_dictionary["Calix"]).poop_speed = SaveLoad.contents_to_save.calix_poop_speed
		instance_from_id(Globals.guinea_dictionary["Calix"]).double_poop_unlocked = SaveLoad.contents_to_save.calix_double_unlocked
		instance_from_id(Globals.guinea_dictionary["Calix"]).double_poop_chance = SaveLoad.contents_to_save.calix_double_chance
		instance_from_id(Globals.guinea_dictionary["Calix"]).giant_poop_minimum = SaveLoad.contents_to_save.calix_giant_min
		instance_from_id(Globals.guinea_dictionary["Calix"]).giant_poop_maximum = SaveLoad.contents_to_save.calix_giant_max
	Globals.squeek_frenzy_purchased = SaveLoad.contents_to_save.squeek_frenzy_unlocked
	Globals.squeek_frenzy_duration = SaveLoad.contents_to_save.squeek_frenzy_duration
	Globals.hibernation_purchased = SaveLoad.contents_to_save.hibernation_unlocked
	Globals.hibernation_sleep_time = SaveLoad.contents_to_save.hibernation_sleep_duration
	Globals.hibernation_effect_time = SaveLoad.contents_to_save.hibernation_effect_duration
	Globals.copper_poop_purchased = SaveLoad.contents_to_save.copper_poop_unlocked
	Globals.copper_poop_value = SaveLoad.contents_to_save.copper_poop_worth
	Globals.rain_or_shine_purchased = SaveLoad.contents_to_save.rain_or_shine_unlocked
	Globals.chroma_prismatic_odds = SaveLoad.contents_to_save.chroma_prismatic_chance
	Globals.kings_coronation_purchased = SaveLoad.contents_to_save.king_poop_unlocked
	Globals.guinea_purchase_order = SaveLoad.contents_to_save.guinea_order
	Globals.upgrade_dictionary = SaveLoad.contents_to_save.upgrades_left_dictionary
	
	
	for pig in get_tree().get_nodes_in_group("Pig"):
		restore_upgrades.connect(pig._update_poop_speed.bind())
		restore_upgrades.connect(pig._update_double_poop.bind())
		restore_upgrades.emit()
	update_buttons.emit()
	update_poop_upgrades_shop.emit()
	update_bella.emit()



func _guinea_spawning():
	#Gizmo
	if ("Gizmo" in Globals.guinea_dictionary) and (Globals.guinea_two_purchased == false):
		instance_from_id(Globals.guinea_dictionary["Gizmo"]).queue_free()
		Globals.guinea_dictionary.erase("Gizmo")
	if Globals.guinea_two_purchased == true:
		if "Gizmo" not in Globals.guinea_dictionary:
			pig_name = "Gizmo"
			_spawn_pig(pig_name)
			new_pig_sprite.texture = load("res://Sprites/Currently Used/Gizmo2.0-Sheet.png")
			new_pig_sprite.set_scale(Vector2(33, 32))
	#Pennybags
	if ("Pennybags" in Globals.guinea_dictionary) and (Globals.rich_guinea_purchased == false):
		instance_from_id(Globals.guinea_dictionary["Pennybags"]).queue_free()
		Globals.guinea_dictionary.erase("Pennybags")
	if Globals.rich_guinea_purchased == true:
		if "Pennybags" not in Globals.guinea_dictionary:
			pig_name = "Pennybags"
			_spawn_pig(pig_name)
			new_pig_sprite.texture = load("res://Sprites/Currently Used/Pennybags2.0-Sheet.png")
			new_pig_sprite.set_scale(Vector2(37, 36))
			new_pig_sprite.get_parent().get_node("Shadow_Sprite").set_scale(Vector2(36, 36))
	#Chroma
	if ("Chroma" in Globals.guinea_dictionary) and (Globals.rainbow_guinea_purchased == false):
		instance_from_id(Globals.guinea_dictionary["Chroma"]).queue_free()
		Globals.guinea_dictionary.erase("Chroma")
	if Globals.rainbow_guinea_purchased == true:
		if "Chroma" not in Globals.guinea_dictionary:
			pig_name = "Chroma"
			_spawn_pig(pig_name)
			new_pig_sprite.texture = load("res://Sprites/Currently Used/Chroma2.0-Sheet.png")
			new_pig_sprite.set_scale(Vector2(33, 32))
	#Calix
	if ("Calix" in Globals.guinea_dictionary) and (Globals.king_calix_purchased == false):
		instance_from_id(Globals.guinea_dictionary["Calix"]).queue_free()
		Globals.guinea_dictionary.erase("Calix")
	if Globals.king_calix_purchased == true:
		if "Calix" not in Globals.guinea_dictionary:
			pig_name = "Calix"
			_spawn_pig(pig_name)
			new_pig_sprite.texture = load("res://Sprites/Currently Used/KingCalix2.0-Sheet.png")
			new_pig_sprite.set_scale(Vector2(33, 32))
	

func _spawn_pig(guinea_pig_name):
	new_pig = guinea_pig_assets.instantiate()
	add_child(new_pig)
	new_pig.global_position = Vector2(randf_range(-4300, 3700), randf_range(-2000, 2000))
		
	current_pig = get_tree().get_nodes_in_group("Pig")[-1]
	Globals.guinea_dictionary[guinea_pig_name] = current_pig.get_instance_id()
	Globals.new_pig = guinea_pig_name
		
	new_pig_sprite = new_pig.get_node("Guinea_Pig").get_node("Pig_Sprite")
