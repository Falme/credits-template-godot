class_name CT_End
extends Control

signal end_reached(offset: float)


func _process(_delta: float) -> void:
	if _is_below_limit():
		end_reached.emit(self.global_position.y)


func _is_below_limit() -> bool:
	return global_position.y < 0
