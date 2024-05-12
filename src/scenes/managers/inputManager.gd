extends Node

var input: Vector2

func get_input():
	input = Input.get_vector("left", "right", "up", "down")
	return input

func get_input_normalized():
	return get_input().normalized()
