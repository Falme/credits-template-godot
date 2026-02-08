@abstract 
class_name CT_Item
extends Control

var _id : String
var _pool : CT_Pool

func initialize(_data : Dictionary) -> void:
	pass

func set_pool(pool : CT_Pool):
	_pool = pool

func set_id(id : String):
	_id = id

func _process(_delta: float) -> void:
	if (has_passed_top_border()):
		_pool.free_item(_id, self)

func has_passed_top_border() -> bool:
	return global_position.y < -size.y

func has_passed_bottom_border() -> bool:
	return global_position.y <= DisplayServer.screen_get_size().y
