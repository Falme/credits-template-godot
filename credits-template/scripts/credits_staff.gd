class_name CreditsStaff
extends VBoxContainer

@export var label_title : PackedScene
@export var label_category : PackedScene
@export var label_actor : PackedScene
@export var label_spacing : PackedScene
@export var label_image : PackedScene

func load_data(data : Dictionary) -> void:
	clear_credits()

	write_title(data.title)
	write_staff(data.items)

func write_title(title : String) -> void:
	var instance = label_title.instantiate()
	instance.text = title
	add_child(instance)

func write_staff(items : Array) -> void:
	for item in items:
		if (item.has("category")):
			write_category(item)
		if (item.has("space")):
			write_space(item)
		if (item.has("image")):
			write_image(item)

		await get_tree().process_frame

func write_category(category : Dictionary) -> void:
	var instance : Label = label_category.instantiate()
	instance.text = category.text
	add_child(instance)

	for actor in category.actors:
		write_actor(actor)

func write_actor(actor : String) -> void:
	var instance : Label = label_actor.instantiate()
	instance.text = actor 
	add_child(instance)

func write_space(space : Dictionary) -> void:
	var instance : Control = label_spacing.instantiate()
	instance.custom_minimum_size.y = space.height
	add_child(instance)

func write_image(image : Dictionary) -> void:
	var instance : TextureRect = label_image.instantiate()
	instance.texture = load("res://"+image.path)
	instance.custom_minimum_size.y = image.height
	add_child(instance)

func clear_credits() -> void:
	var children = get_children()
	for child in children:
		child.free()
