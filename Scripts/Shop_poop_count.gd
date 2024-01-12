extends Label

#Updates shop poop counter
func _process(_delta):
	self.text = "Poop Count: %s" %Globals.poop_amount
