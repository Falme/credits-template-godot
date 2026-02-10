class_name CT_Category
extends CT_Item


func initialize(item: Dictionary) -> void:
	if has_errors(item):
		return

	_set_text(item.text)


func _set_text(text: String) -> void:
	$Label.text = text


func has_errors(item: Dictionary) -> bool:
	if(item == null):
		printerr("Credits Template : Category is null!")
		return true

	if not item.has("text"):
		printerr("Credits Template : Category is missing the field 'text'!")
		return true

	return false
