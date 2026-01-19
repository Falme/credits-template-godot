class_name CT_Image
extends TextureRect

func initialize(image : Dictionary) -> void:
	if(not image.has("path")):
		print("Credits Template : Image requires a field 'path'!")
		return

	if(not image.has("height")):
		print("Credits Template : Image requires a field 'height'!")
		return

	_set_texture(image.path)
	_set_height(image.height)

func _set_texture(path: String) -> void:
	var loaded_file : Texture2D = load(path)

	if loaded_file == null:
		return

	self.texture = loaded_file

func _set_height(height: float) -> void:
	if(height < 0):
		height = 0

	self.custom_minimum_size.y = height
