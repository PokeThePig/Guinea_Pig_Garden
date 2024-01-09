extends Timer

@export var pickup_type : PackedScene

@onready var level_parent = get_parent()

func _on_spawn_timer_timeout():
	spawn_poop()
	
func spawn_poop():
	var pickup_instance : Pickup = pickup_type.instantiate() as Pickup
	level_parent.add_child(pickup_instance)
