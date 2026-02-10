class_name CT_Title
extends CT_Item


func initialize(item : Dictionary) -> void:
	if has_errors(item):
		return

	$Label.text = item.text


func has_errors(item: Dictionary) -> bool:
	if not item.has("text"):
		printerr("Credits Template : item requires a field 'text'!")
		return true

	return false
