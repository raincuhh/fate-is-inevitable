extends Node

var player = null
var main = null

func _ready():
	player = get_tree().get_first_node_in_group("player")

func getPlayer():
	return player

func getMain():
	return get_tree().get_first_node_in_group("main")
