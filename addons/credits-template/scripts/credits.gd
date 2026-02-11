class_name CT_Credits
extends VBoxContainer

signal credits_finished

@export var credits_data: Resource

var _velocity: float
var _is_scrolling: bool = false


func _ready() -> void:
	$CreditsStaff.load_data(credits_data.data)
	set_scroll_velocity( credits_data.data.velocity )

	$CreditsPool.removed_item.connect(add_scroll)

	move_scroll_to_start()
	start()


func _process(delta: float) -> void:
	if(_is_scrolling):
		add_scroll(-_velocity * delta)


func move_scroll_to_start() -> void:
	self.position.y = get_viewport_rect().size.y


func start() -> void:
	_is_scrolling = true


func stop() -> void:
	_is_scrolling = false


func add_scroll(_y: float) -> void:
	self.position.y += _y


func set_scroll_velocity(velocity: float) -> void:
	self._velocity = velocity


func credits_ended(offset: float) -> void:
	stop()
	self.position.y -= offset
	credits_finished.emit()
