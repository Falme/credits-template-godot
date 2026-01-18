class_name CT_End
extends Control

signal end_reached(offset: float)

func _process(_delta: float) -> void:
	if(self.global_position.y < 0):
		end_reached.emit(self.global_position.y)
