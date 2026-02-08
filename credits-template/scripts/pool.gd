class_name CT_Pool
extends Control

signal on_removed_item(height: float)

@export var pool_items : CT_Item_List

var free_items : Dictionary[String, Array] = {}

func get_item(id : String):
	if not free_items.has(id):
		free_items[id] = []
	
	if free_items[id].size() <= 0:
		add(id)
	
	var item = free_items[id].pop_back()
	remove_child(item)
	item.show()
	return item

func add(id : String) -> void:
	var item = _get_item_by_id(id)
	item.set_pool(self)
	item.set_id(id)
	item.hide()
	add_child(item)
	free_items[id].push_front(item)

func free_item(id : String, item) -> void:
	on_removed_item.emit(item.size.y)
	free_items[id].push_front(item)
	item.hide()
	item.get_parent().remove_child(item)
	add_child(item)

func _get_item_by_id(id : String):
	for item in pool_items.item_list:
		if item.id == id:
			return item.prefab.instantiate()
	return null
