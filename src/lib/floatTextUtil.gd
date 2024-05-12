extends Node2D

var floatText = load("res://src/ui/floatText.tscn")
var main = null

func _ready():
	main = NodeUtils.get_main()

func createFloatText():
	var mainForeground = main.get_node("Foreground")
	var instance = floatText.instantiate()
	
