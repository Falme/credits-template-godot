@tool
class_name Credits
extends VBoxContainer

@export_tool_button("Start Credits", "Callable") var roll_credits_action : Callable = start_credits
@export_tool_button("Stop Credits", "Callable") var stop_credits_action : Callable = stop_credits

var _isScrolling : bool = false
@export var velocity : float

func start_credits():
	scroll_to_start()
	start_scrolling()

func stop_credits():
	stop_scrolling()


func _ready() -> void:
	scroll_to_start()
	start_scrolling()

func _process(_delta: float) -> void:
	if(_isScrolling):
		scroll(_delta)

func scroll_at(_y : float) -> void:
	self.position.y = _y

func scroll_to_start() -> void:
	self.position.y = DisplayServer.screen_get_size().y

func scroll(delta: float) -> void:
	scroll_at(self.position.y + (-velocity * delta))

func start_scrolling() -> void:
	_isScrolling = true

func stop_scrolling() -> void:
	_isScrolling = false
