class_name CT_Actor
extends CT_Item

func initialize(item : Dictionary) -> void:
	$Label.text = '\n'.join(item["actors"])
