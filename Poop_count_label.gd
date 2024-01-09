extends Label

#Updates poop counter
func _process(delta):
	self.text = "Poop Count: %s" %Globals.poop_amount
