extends Node2D


signal upgrade_purchased

# Called when the node enters the scene tree for the first time.
func _ready():
	upgrade_purchased.connect(get_tree().get_root().get_node("Main_Tree").get_node("Shop_Scene")._item_purchased.bind())


func _on_upgrade_button_pressed():
	if (Globals.kings_coronation_purchased == false) and (Globals.poop_amount >= 50000) and (Globals.prismatic_poop_amount >= 1000) and (Globals.diamond_poop_amount >= 5):
		Globals.kings_coronation_purchased = true
		Globals.poop_amount -= 50000
		Globals.prismatic_poop_amount -= 1000
		Globals.diamond_poop_amount -= 5
		$upgrade_button.text = "MAXED"
		$coronation_count.text = "1/1"
		upgrade_purchased.emit()



func _on_upgrade_button_mouse_entered():
	$coronation_description.visible = true


func _on_upgrade_button_mouse_exited():
	$coronation_description.visible = false
