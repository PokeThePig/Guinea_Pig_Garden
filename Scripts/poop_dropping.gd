extends CharacterBody2D

func _on_mouse_entered():
	Globals.poop_amount += 1
	print(Globals.poop_amount)
	queue_free()
