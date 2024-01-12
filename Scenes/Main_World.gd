extends Node2D
'''
var save_nodes = get_tree().get_nodes_in_group("Persist")


func save():
	var save_dict = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x, # Vector2 is not supported by JSON
		"pos_y" : position.y,
	}
	return save_dict
'''



func swap_level():
	Globals.switch_scene("res://Scenes/shop_scene.tscn")

func _on_hud_open_shop():
	swap_level()
