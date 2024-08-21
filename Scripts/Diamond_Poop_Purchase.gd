extends Node2D

signal diamond_purchased

func _ready():
	diamond_purchased.connect(get_parent().get_parent().get_node("Shop_Scene")._item_purchased.bind())

func _on_button_pressed():
	if (Globals.poop_amount >= 750) and (Globals.diamond_poop_purchased == false):
		Globals.poop_amount -= 750
		
		diamond_purchased.emit()
		Globals.diamond_poop_purchased = true
		
		$Button.text = "SOLD OUT"


func _on_diamond_poop_description_mouse_entered():
	pass # Replace with function body.


func _on_button_mouse_entered():
	$diamond_poop_description.visible = true


func _on_button_mouse_exited():
	$diamond_poop_description.visible = false
