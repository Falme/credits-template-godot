extends GutTest

class Test_CT_Actor_Exist:
	extends GutTest

	func test_exist():
		var _actor : CT_Actor = CT_Actor.new()
		assert_not_null(_actor, "should not be null")
		_actor.free()

class Test_CT_Actor_Has_Errors:
	extends GutTest

	var _actor : CT_Actor

	func before_each():
		_actor = CT_Actor.new()

	func after_each():
		_actor.free()

	func test_actor_correct_return_true() -> void:
		var _dict : Dictionary = {"actors": ["p"]}
		assert_false(_actor.has_errors(_dict), "No errors, so should be false")

	func test_actor_missing_key_return_false() -> void:
		var _dict : Dictionary = {"bollec": ["p"]}
		assert_true(_actor.has_errors(_dict), "No key, so should be true")

	func test_actor_wrong_case_return_false() -> void:
		var _dict : Dictionary = {"Actors": ["p"]}
		assert_true(_actor.has_errors(_dict), "key should be lower case, so should be true")

	func test_actor_not_array_return_false() -> void:
		var _dict : Dictionary = {"actors": "p"}
		assert_true(_actor.has_errors(_dict), "should be an array, so should be true")

	func test_actor_null_return_false() -> void:
		var _dict : Dictionary
		assert_true(_actor.has_errors(_dict), "should be a populated dictionary, so should be true")


class Test_Join_Actors_Array:
	extends GutTest

	var _actor : CT_Actor

	func before_each():
		_actor = CT_Actor.new()

	func after_each():
		_actor.free()
	

	func test_empty_array_return_empty_string() -> void:
		var _array = []
		assert_eq(_actor.join_actors_array(_array), "", "If array is empty, should return empty string")

	func test_array_with_one_actor_return_actor_string() -> void:
		var _array = ["actor1"]
		assert_eq(_actor.join_actors_array(_array), "actor1", "If array have 1 actor, should return string actor in one line")

	func test_array_with_three_actors_return_multiline_actor_string() -> void:
		var _array = ["actor1", "actor2", "actor3"]
		assert_eq(_actor.join_actors_array(_array), "actor1\nactor2\nactor3", "If array have 3 actors, should return string actors in multiline")
