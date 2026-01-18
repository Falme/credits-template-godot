class_name CT_CreditsStaff
extends VBoxContainer

@export var item_title : PackedScene
@export var item_category : PackedScene
@export var item_actor : PackedScene
@export var item_spacing : PackedScene
@export var item_image : PackedScene

func load_data(data : Dictionary) -> void:
	clear()

	_draw_title(data.title)
	_draw_staff(data.items)

func _draw_title(title : String) -> void:
	var instance: Label = item_title.instantiate()
	instance.text = title
	add_child(instance)

func _draw_staff(items : Array) -> void:
	for item in items:
		if (item.has("category")):
			_draw_category(item)
		if (item.has("space")):
			_draw_space(item.height)
		if (item.has("image")):
			_draw_image(item)

		await get_tree().process_frame

func _draw_category(category : Dictionary) -> void:
	var instance : Label = item_category.instantiate()
	instance.text = category.text
	add_child(instance)

	if (category.categorySpacing > 0):
		_draw_space(category.categorySpacing)

	for actor in category.actors:
		_draw_actor(actor)
		if (category.actorsSpacing > 0):
			_draw_space(category.actorsSpacing)

func _draw_actor(actor : String) -> void:
	var instance : Label = item_actor.instantiate()
	instance.text = actor 
	add_child(instance)

func _draw_space(height : float) -> void:
	var instance : Control = item_spacing.instantiate()
	instance.custom_minimum_size.y = height
	add_child(instance)

func _draw_image(image : Dictionary) -> void:
	var instance : TextureRect = item_image.instantiate()
	instance.texture = load("res://"+image.path)
	instance.custom_minimum_size.y = image.height
	add_child(instance)

func clear() -> void:
	var children = get_children()
	for child in children:
		child.free()
