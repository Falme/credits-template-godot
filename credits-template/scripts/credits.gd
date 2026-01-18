@tool
class_name CT_Credits
extends VBoxContainer

signal credits_finished

@export var credits_data : Resource
var _velocity : float
var _isScrolling : bool = false

# Editor Buttons for Debug
@export_tool_button("Start Credits", "Callable") var roll_credits_action : Callable = start_credits
@export_tool_button("Stop Credits", "Callable") var stop_credits_action : Callable = stop_credits

func start_credits():
	scroll_to_start()
	start_scrolling()

func stop_credits():
	stop_scrolling()

# Script methods
func _ready() -> void:
	$CreditsStaff.load_data(credits_data.data)
	_velocity = credits_data.data.velocity

	if not Engine.is_editor_hint():
		scroll_to_start()
		start_scrolling()

func _process(delta: float) -> void:
	if(_isScrolling):
		scroll(delta)

func scroll_to_start() -> void:
	self.position.y = DisplayServer.screen_get_size().y

func start_scrolling() -> void:
	_isScrolling = true

func stop_scrolling() -> void:
	_isScrolling = false

func scroll_to(_y : float) -> void:
	self.position.y = _y

func scroll(delta: float) -> void:
	self.position.y += (-_velocity * delta)

func credits_ended(offset : float) -> void:
	stop_scrolling()
	scroll_to(self.position.y - offset)
	credits_finished.emit()
