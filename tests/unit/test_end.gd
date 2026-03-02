extends GutTest

class Test_CT_End_Exist:
	extends GutTest

	func test_exist():
		var _end : CT_End = CT_End.new()
		assert_not_null(_end, "end should not be null")
		_end.free()

class Test_CT_End_Is_Below_Limit:
	extends GutTest

	var _end : CT_End

	func before_each():
		_end = CT_End.new()

	func after_each():
		_end.free()

	func test_less_than_zero_true():
		_end.global_position = Vector2(0, -0.1)
		assert_true(_end._is_below_limit(), "_below_limit should be true")

	func test_equals_zero_false():
		_end.global_position = Vector2(0, 0)
		assert_false(_end._is_below_limit(), "_below_limit should be false")

	func test_more_than_zero_false():
		_end.global_position = Vector2(0, 0.1)
		assert_false(_end._is_below_limit(), "_below_limit should be false")
