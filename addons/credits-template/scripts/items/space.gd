class_name CT_Space
extends CT_Item


func initialize(item : Dictionary) -> void:
	if has_errors(item):
		return

	set_height(item.height, $Space)


func set_height(height: float, spacing: Control) -> void:
	spacing.custom_minimum_size.y = max(0, height)


func has_errors(item: Dictionary) -> bool:
	if not item.has("height"):
		printerr("Credits Template : item requires a field 'height'!")
		return true

	if (item.height is not float) and (item.height is not int):
		printerr("Credits Template : field 'height' must be a number!")
		return true

	return false
