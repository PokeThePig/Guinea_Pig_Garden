extends Label

#Updates shop poop counter
func _process(_delta):
	self.text = "Diamond Poop Count: %s" %Globals.diamond_poop_amount
