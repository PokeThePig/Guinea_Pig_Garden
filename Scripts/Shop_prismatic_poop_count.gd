extends Label

#Updates shop poop counter
func _process(_delta):
	self.text = "Prismatic Poop Count: %s" %Globals.prismatic_poop_amount
