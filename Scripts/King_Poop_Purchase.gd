extends Node2D


signal upgrade_purchased

# Called when the node enters the scene tree for the first time.
func _ready():
	upgrade_purchased.connect(get_tree().get_root().get_node("Main_Tree").get_node("Shop_Scene")._item_purchased.bind())
	await get_tree().create_timer(.5).timeout
	_update_upgrade_information()


func _on_upgrade_button_pressed():
	if (Globals.kings_coronation_purchased == false) and (Globals.poop_amount >= 50000) and (Globals.prismatic_poop_amount >= 1000) and (Globals.diamond_poop_amount >= 5):
		Globals.kings_coronation_purchased = true
		Globals.poop_amount -= 50000
		Globals.prismatic_poop_amount -= 1000
		Globals.diamond_poop_amount -= 5
		_update_upgrade_information()
		upgrade_purchased.emit()
		Globals.upgrade_dictionary["Calix"][4] = true

func _update_upgrade_information():
	if Globals.kings_coronation_purchased == true:
		$Kings_Coronation_Label.text = "MAXED"
		$Kings_Coronation_Label.vertical_alignment = 1
		$coronation_count.text = "1/1"

func _on_upgrade_button_mouse_entered():
	$coronation_description.visible = true


func _on_upgrade_button_mouse_exited():
	$coronation_description.visible = false


func _on_upgrade_button_button_down() -> void:
	$Kings_Coronation_Label.position = Vector2(-144, -12)


func _on_upgrade_button_button_up() -> void:
	$Kings_Coronation_Label.position = Vector2(-144, -20)
