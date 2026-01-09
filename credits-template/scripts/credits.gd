@tool
extends Node

@export_tool_button("Hello", "Callable") var hello_action = hello
@export_tool_button("Start Credits", "Callable") var roll_credits_action : Callable = start_credits

func hello():
	print("Hello world!")
	print($Label2.owner)

func start_credits():
	print("Hello world!")

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass
