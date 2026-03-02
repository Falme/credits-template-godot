extends GutTest

class Test_CT_Pool_Exist:
	extends GutTest

	func test_exist():
		var _pool : CT_Pool = CT_Pool.new()
		assert_not_null(_pool, "should not be null")
		_pool.free()

class Test_CT_Pool_Set_Height:
	extends GutTest

	var _pool : CT_Pool

	func before_each():
		_pool = CT_Pool.new()

	func after_each():
		_pool.free()
	

