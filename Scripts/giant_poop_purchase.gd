extends Node2D

signal giant_purchased

func _ready():
	giant_purchased.connect(get_parent().get_parent().get_node("Shop_Scene")._item_purchased.bind())

func _on_button_pressed():
	if (Globals.poop_amount >= 500) and (Globals.giant_poop_purchased == false):
		Globals.giant_poop_purchased = true
		Globals.poop_amount -= 500
		giant_purchased.emit()
		$Giant_Poop_Label.text = "SOLD OUT"
		pass


func _on_button_mouse_entered():
	$giant_poop_description.visible = true


func _on_button_mouse_exited():
	$giant_poop_description.visible = false


func _on_button_button_down() -> void:
	$Giant_Poop_Label.position = Vector2(-145, 8)


func _on_button_button_up() -> void:
	$Giant_Poop_Label.position = Vector2(-145, 0)
