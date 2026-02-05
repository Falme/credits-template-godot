class_name CT_Pool
extends Control

@export var poolItems : Array[CT_PoolItem]

var freeItems : Dictionary[String, Array] = {}

func get_item(id : String, parent : Control):
	if not freeItems.has(id):
		freeItems[id] = []
	
	if freeItems[id].size() <= 0:
		add(id)
	
	var item = freeItems[id].pop_back()
	parent.add_child(item)
	return item

func add(id : String) -> void:
	var item = _get_item_by_id(id)
	freeItems[id].push_front(item)

func _get_item_by_id(id : String):
	for item in poolItems:
		if item.id == id:
			return item.prefab.instantiate()
	return null
