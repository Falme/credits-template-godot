class_name CreditsStaff
extends VBoxContainer

@export var label_title : PackedScene

func load_data(data : Dictionary) -> void:
	write_title(data.title)

func write_title(title : String) -> void:
	var instance = label_title.instantiate()
	instance.text = title
	add_child(instance)
