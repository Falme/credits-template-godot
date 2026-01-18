class_name CT_Image
extends TextureRect

func initialize(image : Dictionary) -> void:
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
