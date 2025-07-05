extends HSlider

@export
var bus_name: String

var bus_index: int

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	value_changed.connect(_on_value_changed)
	
func _on_value_changed(sound_value: float) -> void:
	AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(sound_value)
	)
	_save_sound_volumes(sound_value)


func _save_sound_volumes(volume):
	if self == get_parent().get_node("master_volume"):
		Globals.master_volume = volume
	elif self == get_parent().get_node("music_volume"):
		Globals.music_volume = volume
	elif self == get_parent().get_node("sfx_volume"):
		Globals.sound_effects_volume = volume

func _restore_volume():
	if self == get_parent().get_node("master_volume"):
		self.value = Globals.master_volume
		AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(Globals.master_volume)
	)
	elif self == get_parent().get_node("music_volume"):
		self.value = Globals.music_volume
		AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(Globals.music_volume)
	)
	elif self == get_parent().get_node("sfx_volume"):
		self.value = Globals.sound_effects_volume
		AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(Globals.sound_effects_volume)
	)
