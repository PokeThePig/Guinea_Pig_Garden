extends Node2D

signal diamond_purchased

func _ready():
	diamond_purchased.connect(get_parent().get_parent().get_node("Shop_Scene")._item_purchased.bind())

func _on_button_pressed():
	if (Globals.poop_amount >= 10) and (Globals.diamond_poop_purchased == false):
		Globals.poop_amount -= 10
		
		diamond_purchased.emit()
		Globals.diamond_poop_purchased = true
		
		$Button.text = "SOLD OUT"
