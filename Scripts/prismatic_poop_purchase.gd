extends Node2D

signal prismatic_purchased

func _ready():
	prismatic_purchased.connect(get_parent().get_parent().get_node("Shop_Scene")._item_purchased.bind())

func _on_button_pressed():
	if (Globals.poop_amount >= 15) and (Globals.prismatic_poop_purchased == false):
		Globals.prismatic_poop_purchased = true
		Globals.poop_amount -= 15
		prismatic_purchased.emit()
		$Button.text = "SOLD OUT"
		pass
