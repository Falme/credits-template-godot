class_name CT_CreditsStaff
extends VBoxContainer

@export var pool : CT_Pool

func load_data(data : Dictionary) -> void:
	clear()
	_draw_staff(data.items)

func _draw_staff(items : Array) -> void:
	for item in items:
		if (item.has("type")):
			_draw_item(item["type"], item)

		await get_tree().process_frame

func _draw_item(id : String, item : Dictionary) -> void:
	var instance = pool.get_item(id)
	add_child(instance)
	if (not instance.has_method("initialize")):
		printerr("initialize not found at "+id)
	print("instatiating "+id)
	instance.initialize(item)

func clear() -> void:
	var children = get_children()
	for child in children:
		child.free()
