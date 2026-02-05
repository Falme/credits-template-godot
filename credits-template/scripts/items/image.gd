class_name CT_Image
extends TextureRect

func initialize(item : Dictionary) -> void:
	if(not item.has("path")):
		printerr("Credits Template : item requires a field 'path'!")
		return

	if(not item.has("height")):
		printerr("Credits Template : item requires a field 'height'!")
		return

	_set_texture(item.path)
	_set_height(item.height)

func _set_texture(path: String) -> void:
	var loaded_file : Texture2D = load(path)

	if loaded_file == null:
		return

	self.texture = loaded_file

func _set_height(height: float) -> void:
	height = max(0, height)
	self.custom_minimum_size.y = height
