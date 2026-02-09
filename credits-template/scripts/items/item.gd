@abstract
class_name CT_Item
extends Control

signal freed_item(id: String, item: CT_Item)

var _id: String


func _process(_delta: float) -> void:
	if has_passed_top_border():
		freed_item.emit(_id, self)


func initialize(_data: Dictionary) -> void:
	pass


func set_id(id: String) -> void:
	_id = id


func has_passed_top_border() -> bool:
	return global_position.y < -size.y


func has_passed_bottom_border() -> bool:
	return global_position.y <= DisplayServer.screen_get_size().y


func has_errors(_item: Dictionary) -> bool:
	return false
