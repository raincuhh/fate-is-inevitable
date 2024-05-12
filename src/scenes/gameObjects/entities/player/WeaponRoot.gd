extends Node2D

@onready var weapon = $weapon
@onready var player = $"../.."





func _process(_delta):
	get_input()
	handle_gun_flipping()


func get_input():
	look_at(get_global_mouse_position())

func handle_gun_flipping():
	var pos = get_global_mouse_position()
	if pos.x > player.position.x:
		weapon.flip_v = false
	elif pos.x < player.position.x:
		weapon.flip_v = true
