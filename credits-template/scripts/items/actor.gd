class_name CT_Actor
extends CT_Item


func initialize(item: Dictionary) -> void:
	if has_errors(item):
		return
	
	var actors : Array = item.actors
	$Label.text = '\n'.join(actors)


func has_errors(item: Dictionary) -> bool:
	if not item.has("actors"):
		printerr("Credits Template : item requires an array field 'actors'!")
		return true

	return false
