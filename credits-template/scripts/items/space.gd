class_name CT_Space
extends Control

func initialize(item : Dictionary) -> void:
	self.custom_minimum_size.y = item["height"]
