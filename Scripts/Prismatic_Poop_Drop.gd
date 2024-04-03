extends CharacterBody2D

@onready var poop_animation = $AnimationPlayer

signal prismatic_poop_collected

func _ready():
	self.prismatic_poop_collected.connect(get_parent().get_parent().get_node("Guinea_Pig")._on_prismatic_poop_collected.bind())

func _process(_delta):
	poop_animation.play("prismatic_poop_animation")
	
func _on_mouse_entered():
	Globals.prismatic_poop_amount += 1;
	prismatic_poop_collected.emit()
	print("Prismatic: ", Globals.prismatic_poop_amount)
	queue_free()
