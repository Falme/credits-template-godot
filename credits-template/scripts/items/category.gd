class_name CT_Category
extends Label

signal OnDrawSpace(space: float)
signal OnDrawActor(actor: String)

func initialize(category: Dictionary) -> void:
	_set_text(category.text)
	_set_spacing(category)
	_set_actors(category)

func _set_text(new_text: String) -> void:
	self.text = new_text

func _set_spacing(category: Dictionary) -> void:
	if (category.has("categorySpacing") && category.categorySpacing > 0):
		OnDrawSpace.emit(category.categorySpacing)

func _set_actors(category: Dictionary) -> void:
	for actor in category.actors:
		OnDrawActor.emit(actor)
		if (category.has("actorsSpacing") && category.actorsSpacing > 0):
			OnDrawSpace.emit(category.actorsSpacing)

