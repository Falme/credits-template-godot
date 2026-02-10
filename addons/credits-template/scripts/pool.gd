class_name CT_Pool
extends Control

signal removed_item(height: float)

@export var pool_items: CT_Item_List

var free_items: Dictionary[String, Array] = {}


func get_item(id: String) -> CT_Item:
	if not free_items.has(id):
		free_items[id] = []
	
	if free_items[id].size() <= 0:
		add(id)
	
	var item: CT_Item = free_items[id].pop_back()
	remove_child(item)
	item.show()
	return item


func add(id: String) -> void:
	var item: CT_Item = _get_item_by_id(id)
	item.freed_item.connect(free_item)
	item.set_id(id)
	_push_pool_item(id, item)


func free_item(id: String, item: CT_Item) -> void:
	removed_item.emit(item.size.y)
	_push_pool_item(id, item)


func _push_pool_item(id: String, item: CT_Item) -> void:
	if not item.get_parent() == null:
		item.get_parent().remove_child(item)

	add_child(item)
	item.hide()
	free_items[id].push_front(item)


func _get_item_by_id(id: String) -> CT_Item:
	for item in pool_items.item_list:
		if item.id == id:
			return item.prefab.instantiate()
	return null
