class_name CreditsStaff
extends VBoxContainer

@export var label_title : PackedScene
@export var label_category : PackedScene
@export var label_actor : PackedScene

func load_data(data : Dictionary) -> void:
	clear_credits()

	write_title(data.title)
	write_staff(data.labels)

func write_title(title : String) -> void:
	var instance = label_title.instantiate()
	instance.text = title
	add_child(instance)

func write_staff(staff : Array) -> void:
	for category in staff:
		write_category(category[0])
		await get_tree().process_frame
		for actor in range(1, category.size()):
			write_actor(category[actor])
			await get_tree().process_frame

func write_category(category : String) -> void:
	var instance = label_category.instantiate()
	instance.text = category 
	add_child(instance)

func write_actor(actor : String) -> void:
	var instance = label_actor.instantiate()
	instance.text = actor 
	add_child(instance)

func clear_credits() -> void:
	var children = get_children()
	for child in children:
		child.free()
