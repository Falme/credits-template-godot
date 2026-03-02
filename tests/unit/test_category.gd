extends GutTest

class Test_CT_Category_Exist:
	extends GutTest

	func test_exist():
		var _category : CT_Category = CT_Category.new()
		assert_not_null(_category, "should not be null")
		_category.free()

class Test_CT_Category_Has_Errors:
	extends GutTest

	var _category : CT_Category

	func before_each():
		_category = CT_Category.new()

	func after_each():
		_category.free()
	

	func test_item_null_return_true() -> void:
		var _item : Dictionary
		assert_true(_category.has_errors(_item), "Item cannot be null, so it returns true")
	

	func test_item_has_not_text_return_true() -> void:
		var _item : Dictionary = {"mode": "air"}
		assert_true(_category.has_errors(_item), "key 'text' not found, so it returns true")
	

	func test_item_text_wrong_case_return_true() -> void:
		var _item : Dictionary = {"Text": "air"}
		assert_true(_category.has_errors(_item), "key 'text' in wrong case, so it returns true")
	

	func test_item_text_correct_return_false() -> void:
		var _item : Dictionary = {"text" : "air"}
		assert_false(_category.has_errors(_item), "key text is correct, so it returns false")

	
	func test_item_text_in_value_instead_key_return_true() -> void:
		var _item : Dictionary = {"air" : "text"}
		assert_true(_category.has_errors(_item), "key text is in value, so it returns true")
