extends Camera2D

func _switch_to_poop_up_cam():
	self.make_current()
	for scroll in get_tree().get_nodes_in_group("Scroll"):
		scroll.set_h_scroll(0)
		scroll.set_v_scroll(0)
