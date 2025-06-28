extends Node2D

var current_pig = 1
var pig_instance
var upgrade_sprite

@onready var upgrade_row_assets = load("res://Scenes/Shop/scroll_container.tscn")

#Unique upgrades
var unique_upgrade = null
@onready var squeek_frenzy_assets = load("res://Scenes/Shop/squeek_frenzy_purchase.tscn")
@onready var hibernation_assets = load("res://Scenes/Shop/hibernation_purchase.tscn")
@onready var copper_poop_assets = load("res://Scenes/Shop/copper_poop_purchase.tscn")
@onready var rain_or_shine_assets = load("res://Scenes/Shop/rain_or_shine_purchase.tscn")
@onready var kings_coronation_assets = load("res://Scenes/Shop/kings_coronation_purchase.tscn")
@onready var upgrade_row = get_node("ScrollContainer").get_node("VBoxContainer").get_node("ScrollContainer")

signal shop_cam_from_poop_up
signal update_bella

func _ready():
	shop_cam_from_poop_up.connect(get_parent().get_node("Shop_Scene").get_node("main_shop_camera")._switch_to_shop_cam_from_poop_up.bind())
	#update_bella.connect(get_node("ScrollContainer/VBoxContainer/ScrollContainer/HBoxContainer/Poop_Speed_Purchase")._update_upgrade_information.bind())
	#update_bella.connect(get_node("ScrollContainer/VBoxContainer/ScrollContainer/HBoxContainer/Double_poop_drop_purchase")._update_upgrade_information.bind())
	#update_bella.connect(get_node("ScrollContainer/VBoxContainer/ScrollContainer/HBoxContainer/giant_poop_upgrade")._update_upgrade_information.bind())
	upgrade_sprite = get_node("ScrollContainer/VBoxContainer/ScrollContainer/HBoxContainer/Pig_Sprite")
	upgrade_sprite.texture = load("res://Sprites/Currently Used/Bella2.0-Sheet.png")
	upgrade_sprite.get_node("Guinea_Pig_Name").text = "Bella"
	
	unique_upgrade = squeek_frenzy_assets.instantiate()
	get_node("ScrollContainer").get_node("VBoxContainer").get_node("ScrollContainer").get_node("HBoxContainer").add_child(unique_upgrade)
	unique_upgrade.global_position = $ScrollContainer/VBoxContainer/ScrollContainer/HBoxContainer/Unique_upgrade_placeholder.global_position
	Globals.upgrade_dictionary["Bella"] = [upgrade_row.get_instance_id(), upgrade_row.get_node("HBoxContainer").get_node("Poop_Speed_Purchase").upgrades_left, upgrade_row.get_node("HBoxContainer").get_node("Double_poop_drop_purchase").upgrades_left, upgrade_row.get_node("HBoxContainer").get_node("giant_poop_upgrade").upgrades_left, upgrade_row.get_node("HBoxContainer").get_node("Squeek_Frenzy_Purchase").upgrades_left]
	unique_upgrade = null
	current_pig += 1

func _on_poop_up_to_shop_pressed():
	shop_cam_from_poop_up.emit()
	
func _update_poop_upgrades():
	await get_tree().create_timer(.01).timeout
	var upgrade_row_location = $ScrollContainer/VBoxContainer/ScrollContainer.global_position.y
	pig_instance = instance_from_id(Globals.guinea_dictionary[Globals.new_pig])
	current_pig += 1
	
	#Adding row
	var new_upgrade_row = upgrade_row_assets.instantiate()
	get_node("ScrollContainer").get_node("VBoxContainer").add_child(new_upgrade_row)
	
	#Customizing row
	upgrade_sprite = pig_instance.get_parent().get_node("Guinea_Pig").get_node("Pig_Sprite")
	new_upgrade_row.get_node("HBoxContainer").get_node("Pig_Sprite").texture = upgrade_sprite.texture
	new_upgrade_row.global_position = Vector2(-9149, upgrade_row_location + (100 * (current_pig - 2)))

	
	if (Globals.guinea_two_purchased == true):
		if (pig_instance == instance_from_id(Globals.guinea_dictionary["Gizmo"])):
			new_upgrade_row.get_node("HBoxContainer").get_node("Pig_Sprite").get_node("Guinea_Pig_Name").text = "Gizmo"
			unique_upgrade = hibernation_assets.instantiate()
			new_upgrade_row.get_node("HBoxContainer").add_child(unique_upgrade)
			unique_upgrade.global_position = new_upgrade_row.get_node("HBoxContainer").get_node("Unique_upgrade_placeholder").global_position
			Globals.upgrade_dictionary["Gizmo"] = [new_upgrade_row.get_instance_id(), new_upgrade_row.get_node("HBoxContainer").get_node("Poop_Speed_Purchase").upgrades_left, new_upgrade_row.get_node("HBoxContainer").get_node("Double_poop_drop_purchase").upgrades_left, new_upgrade_row.get_node("HBoxContainer").get_node("giant_poop_upgrade").upgrades_left, new_upgrade_row.get_node("HBoxContainer").get_node("Hibernation_purchase").upgrades_left]
	
	if (Globals.rich_guinea_purchased == true):
		if (pig_instance == instance_from_id(Globals.guinea_dictionary["Pennybags"])):
			new_upgrade_row.get_node("HBoxContainer").get_node("Pig_Sprite").get_node("Guinea_Pig_Name").text = "Pennybags"
			unique_upgrade = copper_poop_assets.instantiate()
			new_upgrade_row.get_node("HBoxContainer").add_child(unique_upgrade)
			unique_upgrade.global_position = new_upgrade_row.get_node("HBoxContainer").get_node("Unique_upgrade_placeholder").global_position
			Globals.upgrade_dictionary["Pennybags"] = [new_upgrade_row.get_instance_id(), new_upgrade_row.get_node("HBoxContainer").get_node("Poop_Speed_Purchase").upgrades_left, new_upgrade_row.get_node("HBoxContainer").get_node("Double_poop_drop_purchase").upgrades_left, new_upgrade_row.get_node("HBoxContainer").get_node("giant_poop_upgrade").upgrades_left, new_upgrade_row.get_node("HBoxContainer").get_node("Copper_poop_purchase").upgrades_left]
	
	if (Globals.rainbow_guinea_purchased == true):
		if (pig_instance == instance_from_id(Globals.guinea_dictionary["Chroma"])):
			new_upgrade_row.get_node("HBoxContainer").get_node("Pig_Sprite").get_node("Guinea_Pig_Name").text = "Chroma"
			unique_upgrade = rain_or_shine_assets.instantiate()
			new_upgrade_row.get_node("HBoxContainer").add_child(unique_upgrade)
			unique_upgrade.global_position = new_upgrade_row.get_node("HBoxContainer").get_node("Unique_upgrade_placeholder").global_position
			Globals.upgrade_dictionary["Chroma"] = [new_upgrade_row.get_instance_id(), new_upgrade_row.get_node("HBoxContainer").get_node("Poop_Speed_Purchase").upgrades_left, new_upgrade_row.get_node("HBoxContainer").get_node("Double_poop_drop_purchase").upgrades_left, new_upgrade_row.get_node("HBoxContainer").get_node("giant_poop_upgrade").upgrades_left, new_upgrade_row.get_node("HBoxContainer").get_node("Rain_or_shine_purchase").upgrades_left]

	if (Globals.king_calix_purchased == true):
		if (pig_instance == instance_from_id(Globals.guinea_dictionary["Calix"])):
			new_upgrade_row.get_node("HBoxContainer").get_node("Pig_Sprite").get_node("Guinea_Pig_Name").text = "King Calix"
			unique_upgrade = kings_coronation_assets.instantiate()
			new_upgrade_row.get_node("HBoxContainer").add_child(unique_upgrade)
			unique_upgrade.global_position = new_upgrade_row.get_node("HBoxContainer").get_node("Unique_upgrade_placeholder").global_position
			Globals.upgrade_dictionary["Calix"] = [new_upgrade_row.get_instance_id(), new_upgrade_row.get_node("HBoxContainer").get_node("Poop_Speed_Purchase").upgrades_left, new_upgrade_row.get_node("HBoxContainer").get_node("Double_poop_drop_purchase").upgrades_left, new_upgrade_row.get_node("HBoxContainer").get_node("giant_poop_upgrade").upgrades_left, Globals.kings_coronation_purchased]
	
	
func _load_poop_upgrades():
	await get_tree().create_timer(.05).timeout
	Globals.upgrade_dictionary["Bella"] = [upgrade_row.get_instance_id(), Globals.upgrade_dictionary["Bella"][1], Globals.upgrade_dictionary["Bella"][2], Globals.upgrade_dictionary["Bella"][3], Globals.upgrade_dictionary["Bella"][4]]
	update_bella.emit()
	for guinea_pig_ordered in Globals.guinea_purchase_order:
		for guinea_pig_dict in Globals.guinea_dictionary:
			if guinea_pig_ordered == guinea_pig_dict:
				pig_instance = instance_from_id(Globals.guinea_dictionary[guinea_pig_dict])
				var loaded_upgrade_row_location = $ScrollContainer/VBoxContainer/ScrollContainer.global_position.y
				current_pig += 1
				var loaded_upgrade_row = upgrade_row_assets.instantiate()
				get_node("ScrollContainer").get_node("VBoxContainer").add_child(loaded_upgrade_row)
			
				#Customizing row
				upgrade_sprite = pig_instance.get_parent().get_node("Guinea_Pig").get_node("Pig_Sprite")
				loaded_upgrade_row.get_node("HBoxContainer").get_node("Pig_Sprite").texture = upgrade_sprite.texture
				loaded_upgrade_row.global_position = Vector2(-9149, loaded_upgrade_row_location + (100 * (current_pig - 2)))
				
				if guinea_pig_dict == "Gizmo":
					loaded_upgrade_row.get_node("HBoxContainer").get_node("Pig_Sprite").get_node("Guinea_Pig_Name").text = "Gizmo"
					unique_upgrade = hibernation_assets.instantiate()
					loaded_upgrade_row.get_node("HBoxContainer").add_child(unique_upgrade)
					unique_upgrade.global_position = loaded_upgrade_row.get_node("HBoxContainer").get_node("Unique_upgrade_placeholder").global_position
					Globals.upgrade_dictionary["Gizmo"][0] = loaded_upgrade_row.get_instance_id()
				if guinea_pig_dict == "Pennybags":
					loaded_upgrade_row.get_node("HBoxContainer").get_node("Pig_Sprite").get_node("Guinea_Pig_Name").text = "Pennybags"
					unique_upgrade = copper_poop_assets.instantiate()
					loaded_upgrade_row.get_node("HBoxContainer").add_child(unique_upgrade)
					unique_upgrade.global_position = loaded_upgrade_row.get_node("HBoxContainer").get_node("Unique_upgrade_placeholder").global_position
					Globals.upgrade_dictionary["Pennybags"][0] = loaded_upgrade_row.get_instance_id()
				if guinea_pig_dict == "Chroma":
					loaded_upgrade_row.get_node("HBoxContainer").get_node("Pig_Sprite").get_node("Guinea_Pig_Name").text = "Chroma"
					unique_upgrade = rain_or_shine_assets.instantiate()
					loaded_upgrade_row.get_node("HBoxContainer").add_child(unique_upgrade)
					unique_upgrade.global_position = loaded_upgrade_row.get_node("HBoxContainer").get_node("Unique_upgrade_placeholder").global_position
					Globals.upgrade_dictionary["Chroma"][0] = loaded_upgrade_row.get_instance_id()
				if guinea_pig_dict == "Calix":
					loaded_upgrade_row.get_node("HBoxContainer").get_node("Pig_Sprite").get_node("Guinea_Pig_Name").text = "King Calix"
					unique_upgrade = kings_coronation_assets.instantiate()
					loaded_upgrade_row.get_node("HBoxContainer").add_child(unique_upgrade)
					unique_upgrade.global_position = loaded_upgrade_row.get_node("HBoxContainer").get_node("Unique_upgrade_placeholder").global_position
					Globals.upgrade_dictionary["Calix"][0] = loaded_upgrade_row.get_instance_id()
