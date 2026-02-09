class_name CT_CreditsStaff
extends VBoxContainer

const TYPE = "type"
const INITIALIZE = "initialize"
const ERR_INITIALIZE_NOT_FOUND = "initialize not found at id : "

@export var pool: CT_Pool

var load_list: Array


func load_data(data: Dictionary) -> void:
	_clear()
	_draw_staff(data.items)


func _process(_delta: float) -> void:

	if get_child_count() == 0:
		return

	if _can_draw_next_item():
		load_list.pop_front().call()


func _can_draw_next_item() -> bool:
	var last_child: CT_Item = self.get_child(self.get_child_count()-1)

	return last_child.has_passed_bottom_border() and \
			not load_list.is_empty()


func _draw_staff(items: Array) -> void:
	var first := true

	for item in items:
		if item.has(TYPE):
			load_list.push_back(func(): _draw_item(item[TYPE], item))

		if first:
			load_list.pop_front().call()
			first = false

		await get_tree().process_frame


func _draw_item(id: String, item: Dictionary) -> void:
	var instance: CT_Item = pool.get_item(id)
	
	add_child(instance)

	if (not instance.has_method(INITIALIZE)):
		printerr(ERR_INITIALIZE_NOT_FOUND, id)

	instance.initialize(item)


func _clear() -> void:
	for child in get_children():
		child.free()
