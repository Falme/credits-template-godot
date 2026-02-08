class_name CT_Title
extends CT_Item

func initialize(item : Dictionary) -> void:
	$Label.text = item["text"]
