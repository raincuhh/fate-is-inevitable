extends Node

var input: Vector2

@onready var player = NodeUtils.get_player()

func get_input():
	input = Input.get_vector("left", "right", "up", "down")
	return input

func get_input_normalized():
	return get_input().normalized()

func _process(delta):
	if Input.is_action_just_pressed("fire"):
		player.get_node("Visuals").get_node("WeaponRoot").get_node("Weapon").fire()
