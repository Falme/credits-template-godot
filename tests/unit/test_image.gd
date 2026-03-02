extends GutTest

class Test_CT_Image_Exist:
	extends GutTest

	func test_exist():
		var _image : CT_Image = CT_Image.new()
		assert_not_null(_image, "should not be null")
		_image.free()

class Test_CT_Image_Set_Height:
	extends GutTest

	var _image : CT_Image
	var _sprite : TextureRect

	func before_each():
		_sprite = TextureRect.new()
		_image = CT_Image.new()

	func after_each():
		_image.free()
		_sprite.free()
	

	func test_height_negative_100_set_zero() -> void:
		_image._set_height(-100, _sprite)
		assert_eq(_sprite.custom_minimum_size.y, 0, 
			"Image size cannot be below zero")


	func test_height_zero_set_zero() -> void:
		_image._set_height(0, _sprite)
		assert_eq(_sprite.custom_minimum_size.y, 0, 
			"Image size keep at zero")


	func test_height_30_set_30() -> void:
		_image._set_height(30, _sprite)
		assert_eq(_sprite.custom_minimum_size.y, 30, 
			"Image size keep at zero")



class Test_CT_Image_Has_Errors:
	extends GutTest

	var _image : CT_Image

	func before_each():
		_image = CT_Image.new()

	func after_each():
		_image.free()
	

	func test_empty_returns_true() -> void:
		var _item : Dictionary = {}
		assert_true(_image.has_errors(_item),  
			"dictionary is empty, returns true")


	func test_not_have_key_path_returns_true() -> void:
		var _item : Dictionary = {"pooch" : "mooch"}
		assert_true(_image.has_errors(_item), 
			"key 'path' not found, returns true")


	func test_not_have_key_height_returns_true() -> void:
		var _item : Dictionary = {"path" : "mooch"}
		assert_true(_image.has_errors(_item), 
			"key 'height' not found, returns true")


	func test_path_not_string_returns_true() -> void:
		var _item : Dictionary = {"path" : 321, "height": 123}
		assert_true(_image.has_errors(_item), 
			"path key must be a string, returns true")


	func test_height_not_number_returns_true() -> void:
		var _item : Dictionary = {"path" : "address", "height": "high"}
		assert_true(_image.has_errors(_item), 
			"height key must be a number, returns true")


	func test_have_key_height_and_path_returns_false() -> void:
		var _item : Dictionary = {"path" : "address", "height": 123}
		assert_false(_image.has_errors(_item), 
			"correct, returns false")


