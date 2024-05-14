extends Node2D


var speed: float = 3.6
var spawnPosition: Vector2
var distanceTravelled: int = 0
var maxDistance: int = 100

func _ready():
#	position = spawnPosition
	global_position = spawnPosition

func _process(delta):
	print("wad")
	position += (Vector2.RIGHT * speed).rotated(rotation)
	
	distanceTravelled += 1
	
	if distanceTravelled >= maxDistance:
		queue_free()
