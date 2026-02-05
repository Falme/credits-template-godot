class_name CT_Category
extends Label

func initialize(category: Dictionary) -> void:
	if(category == null):
		print("Credits Template : Category is null!")
		return

	if(not category.has("text")):
		print("Credits Template : Category is missing the field 'text'!")
		return

	_set_text(category.text)

func _set_text(new_text: String) -> void:
	self.text = new_text
