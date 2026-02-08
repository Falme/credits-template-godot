class_name CT_Category
extends CT_Item

func initialize(category: Dictionary) -> void:
	if(category == null):
		print("Credits Template : Category is null!")
		return

	if(not category.has("text")):
		print("Credits Template : Category is missing the field 'text'!")
		return

	_set_text(category.text)

func _set_text(new_text: String) -> void:
	$Label.text = new_text
