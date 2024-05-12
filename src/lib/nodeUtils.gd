extends Node

#var main = get_tree().get_first_node_in_group("main") # this did not work for me, _ready worked
var player = null
var main = null

func _ready():
	player = get_tree().get_first_node_in_group("player")
	main = get_tree().get_first_node_in_group("main")

func get_player():
	return player

func get_main():
	return main
