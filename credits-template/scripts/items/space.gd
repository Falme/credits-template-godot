class_name CT_Space
extends CT_Item


func initialize(item : Dictionary) -> void:
	if has_errors(item):
		return

	$Space.custom_minimum_size.y = item.height


func has_errors(item: Dictionary) -> bool:
	if not item.has("height"):
		printerr("Credits Template : item requires a field 'height'!")
		return true

	return false
