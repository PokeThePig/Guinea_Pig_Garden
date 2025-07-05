extends Node2D

signal prismatic_purchased

func _ready():
	prismatic_purchased.connect(get_parent().get_parent().get_node("Shop_Scene")._item_purchased.bind())

func _on_button_pressed():
	if (Globals.poop_amount >= 1500) and (Globals.prismatic_poop_purchased == false):
		Globals.prismatic_poop_purchased = true
		Globals.poop_amount -= 1500
		prismatic_purchased.emit()
		$Prismatic_Poop_Label.text = "SOLD OUT"
		pass


func _on_button_mouse_entered():
	$prismatic_poop_description.visible = true


func _on_button_mouse_exited():
	$prismatic_poop_description.visible = false


func _on_button_button_down() -> void:
	$Prismatic_Poop_Label.position = Vector2(-144, 76)


func _on_button_button_up() -> void:
	$Prismatic_Poop_Label.position = Vector2(-144, 68)
