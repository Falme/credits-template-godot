extends GutTest

class Test_CT_Space_Exist:
	extends GutTest

	func test_exist():
		var _space : CT_Space = CT_Space.new()
		assert_not_null(_space, "should not be null")
		_space.free()

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
