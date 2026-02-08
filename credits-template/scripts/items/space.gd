class_name CT_Space
extends CT_Item

func initialize(item : Dictionary) -> void:
	$Space.custom_minimum_size.y = item["height"]
