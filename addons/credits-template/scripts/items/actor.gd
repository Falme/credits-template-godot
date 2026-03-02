class_name CT_Actor
extends CT_Item


func initialize(item: Dictionary) -> void:
	if has_errors(item):
		return
	
	$Label.text = join_actors_array(item.actors)


func has_errors(item: Dictionary) -> bool:
	if not item.has("actors"):
		printerr("Credits Template : item requires an array field 'actors'!")
		return true

	if item.actors is not Array:
		printerr("Credits Template : item requires an array field in 'actors'!")
		return true

	return false


func join_actors_array(_array: Array) -> String:
	return '\n'.join(_array)
