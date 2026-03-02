extends GutTest

class Test_CT_Space_Exist:
	extends GutTest

	func test_exist():
		var _space : CT_Space = CT_Space.new()
		assert_not_null(_space, "should not be null")
		_space.free()

class Test_CT_Space_Set_Height:
	extends GutTest

	var _space : CT_Space
	var _control : Control

	func before_each():
		_space = CT_Space.new()
		_control = Control.new()

	func after_each():
		_space.free()
		_control.free()
	

	func test_minus_30_set_to_zero() -> void:
		_space.set_height(-30, _control)

		assert_eq(_control.custom_minimum_size.y, 0, 
			"Space height must not be below zero")
	

	func test_0_set_to_zero() -> void:
		_space.set_height(0, _control)

		assert_eq(_control.custom_minimum_size.y, 0, 
			"Space height can be 0")
	

	func test_20_half_set_to_20_half() -> void:
		_space.set_height(20.5, _control)

		assert_eq(_control.custom_minimum_size.y, 20.5, 
			"Space height can be 20.5")
		



class Test_CT_Space_Has_Errors:
	extends GutTest

	var _space : CT_Space

	func before_each():
		_space = CT_Space.new()

	func after_each():
		_space.free()
	

	func test_empty_returns_true() -> void:
		var _item : Dictionary = {}
		assert_true(_space.has_errors(_item), 
			"item is empty, must have data inside it")
	

	func test_key_height_not_exist_returns_true() -> void:
		var _item : Dictionary = {"match" : "height"}
		assert_true(_space.has_errors(_item), 
			"key 'height' must exist in the space item")


	func test_key_height_not_a_number_returns_true() -> void:
		var _item : Dictionary = {"height" : "high"}
		assert_true(_space.has_errors(_item), 
			"key 'height' must be a number")


	func test_correct_returns_false() -> void:
		var _item : Dictionary = {"height" : 100.7}
		assert_false(_space.has_errors(_item), 
			"item is correct, so it returns false")
