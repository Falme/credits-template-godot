@tool
class_name Credits
extends VBoxContainer

@export_tool_button("Start Credits", "Callable") var roll_credits_action : Callable = start_credits

func start_credits():
	scroll_to_start()
	print("Hello world!")

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func scroll_at(_y : float) -> void:
	self.position.y = _y

func scroll_to_start() -> void:
	self.position.y = DisplayServer.screen_get_size().y
