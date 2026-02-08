class_name CT_CreditsStaff
extends VBoxContainer

@export var pool : CT_Pool

var load_list : Array

func load_data(data : Dictionary) -> void:
	clear()
	_draw_staff(data.items)

func _process(delta: float) -> void:

	if self.get_child_count() == 0:
		return

	var last_child : CT_Item = self.get_child(self.get_child_count()-1)

	if ( last_child.has_passed_bottom_border() && not load_list.is_empty()):
			load_list.pop_front().call()


func _draw_staff(items : Array) -> void:
	var first : bool = true
	for item in items:
		if (item.has("type")):
			load_list.push_back(func(): _draw_item(item["type"], item))

		if (first):
			load_list.pop_front().call()
			first = false

		# await get_tree().process_frame
	print(load_list.size())

func _draw_item(id : String, item : Dictionary) -> void:
	var instance = pool.get_item(id)
	add_child(instance)
	if (not instance.has_method("initialize")):
		printerr("initialize not found at "+id)

	instance.initialize(item)

func clear() -> void:
	var children = get_children()
	for child in children:
		child.free()
