extends Node2D

var floatText = load("res://src/ui/floatText.tscn")
var main = null
var mainForeground = null

func _ready():
	main = NodeUtils.get_main()
	mainForeground = main.get_node("Foreground")

func createFloatText(pos: Vector2, dmg: int):
	var instance = floatText.instantiate()
	instance.amount = dmg
	instance.spawnPosition = pos
	instance.position = pos
	mainForeground.add_child(instance)
	
