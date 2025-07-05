extends Node2D

signal diamond_purchased

func _ready():
	diamond_purchased.connect(get_parent().get_parent().get_node("Shop_Scene")._item_purchased.bind())

func _on_button_pressed():
	if (Globals.poop_amount >= 750) and (Globals.diamond_poop_purchased == false):
		Globals.poop_amount -= 750
		
		diamond_purchased.emit()
		Globals.diamond_poop_purchased = true
		
		$Diamond_Poop_Label.text = "SOLD OUT"


func _on_button_mouse_entered():
	$diamond_poop_description.visible = true


func _on_button_mouse_exited():
	$diamond_poop_description.visible = false


func _on_button_button_down() -> void:
	$Diamond_Poop_Label.position = Vector2(-144, 8)


func _on_button_button_up() -> void:
	$Diamond_Poop_Label.position = Vector2(-144, 0)
