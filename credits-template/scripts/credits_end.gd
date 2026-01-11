class_name CreditsEnd
extends Control

signal end_reached

func _process(_delta: float) -> void:
	if(self.global_position.y < 0):
		end_reached.emit(self.global_position.y)
