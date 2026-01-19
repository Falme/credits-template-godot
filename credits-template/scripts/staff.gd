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
		elif (item.has("space")):
			_draw_space(item.height)
		elif (item.has("image")):
			_draw_image(item)

		await get_tree().process_frame

func _draw_category(category : Dictionary) -> void:
	var instance: CT_Category = item_category.instantiate()
	add_child(instance)

	instance.OnDrawSpace.connect(_draw_space)
	instance.OnDrawActor.connect(_draw_actor)

	instance.initialize(category)

	instance.OnDrawActor.disconnect(_draw_actor)
	instance.OnDrawSpace.disconnect(_draw_space)

func _draw_actor(actor : String) -> void:
	var instance : CT_Actor = item_actor.instantiate()
	add_child(instance)
	instance.initialize(actor)

func _draw_space(height : float) -> void:
	var instance: CT_Space = item_spacing.instantiate()
	add_child(instance)
	instance.initialize(height)

func _draw_image(image : Dictionary) -> void:
	var instance: CT_Image = item_image.instantiate()
	add_child(instance)
	instance.initialize(image)

func clear() -> void:
	var children = get_children()
	for child in children:
		child.free()
