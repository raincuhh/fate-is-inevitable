class_name NodeUtils 
extends Node

func getPlayer(node):
	return node.get_tree().get_first_node_in_group("player")

func getMain(node):
	return node.get_tree().get_first_node_in_group("Main")
