extends GutTest

class Test_CT_Credits_Exist:
	extends GutTest

	func test_exist():
		var _credits : CT_Credits = CT_Credits.new()
		assert_not_null(_credits, "should not be null")
		_credits.free()

class Test_CT_Credits_Add_Scroll:
	extends GutTest

	var _credits : CT_Credits

	func before_each():
		_credits = CT_Credits.new()

	func after_each():
		_credits.free()
	
	var single_move = ParameterFactory.named_parameters(
		['move', 'result'],
		[
			[1.0, 1.0],
			[11.10, 11.10],
			[-11.10, -11.10],
			[-0.0, 0.0],
		])

	func test_single_movement(params = use_parameters(single_move)) -> void:
		_credits.position = Vector2(0,0)
		_credits.add_scroll(params.move)
		assert_eq(_credits.position, Vector2(0,params.result))


	var multiple_move = ParameterFactory.named_parameters(
		['move1', 'move2', 'result'],
		[
			[0.4, 0.6, 1.0],
			[22.20, -11.10, 11.10],
			[-11.10, -11.10, -22.20],
			[-0.0, 0.0, 0.0],
		])

	func test_multiple_movement(params = use_parameters(multiple_move)) -> void:
		_credits.position = Vector2(0,0)
		_credits.add_scroll(params.move1)
		_credits.add_scroll(params.move2)
		assert_eq(_credits.position, Vector2(0,params.result))
	
	
class Test_CT_Credits_Set_Scroll_Velocity:
	extends GutTest

	var _credits : CT_Credits

	func before_each():
		_credits = CT_Credits.new()

	func after_each():
		_credits.free()
	
	
	func test_negative_velocity_set_to_0_dot_001() -> void:
		_credits.set_scroll_velocity(-10.0)
		assert_eq(_credits._velocity, 0.001, 
			"Scroll velocity cannot be negative")


	func test_0_velocity_set_to_0_dot_001() -> void:
		_credits.set_scroll_velocity(0.0)
		assert_eq(_credits._velocity, 0.001, 
			"Scroll velocity cannot be zero")


	func test_10_velocity_set_to_10() -> void:
		_credits.set_scroll_velocity(10.0)
		assert_eq(_credits._velocity, 10.0, 
			"Scroll velocity can be 10.0")
