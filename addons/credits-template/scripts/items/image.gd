class_name CT_Image
extends CT_Item


func initialize(item : Dictionary) -> void:
	if has_errors(item):
		return

	_set_texture(item.path)
	_set_height(item.height)


func _set_texture(path: String) -> void:
	var loaded_file : Texture2D = load(path)

	if loaded_file == null:
		printerr("Credits Template : Image file cannot be found!")
		return

	$Sprite.texture = loaded_file


func _set_height(height: float) -> void:
	$Sprite.custom_minimum_size.y = max(0, height)


func has_errors(item: Dictionary) -> bool:
	if not item.has("path"):
		printerr("Credits Template : item requires a field 'path'!")
		return true

	if not item.has("height"):
		printerr("Credits Template : item requires a field 'height'!")
		return true

	return false
