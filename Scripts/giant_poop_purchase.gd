extends Node2D

signal giant_purchased

func _ready():
	giant_purchased.connect(get_parent().get_parent().get_node("Shop_Scene")._item_purchased.bind())

func _on_button_pressed():
	if (Globals.poop_amount >= 5) and (Globals.giant_poop_purchased == false):
		Globals.giant_poop_purchased = true
		Globals.poop_amount -= 5
		giant_purchased.emit()
		$Button.text = "SOLD OUT"
		pass
