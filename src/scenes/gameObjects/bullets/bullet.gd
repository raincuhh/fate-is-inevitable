extends Node2D


var speed: float = 150.0
var spawnPosition: Vector2
var distanceTravelled: int = 0
var maxDistance: int = 3000

func _ready():
#	position = spawnPosition
	global_position = spawnPosition

func _process(delta):
	position += (Vector2.RIGHT * speed).rotated(rotation) * delta
	
	distanceTravelled += 1
	if distanceTravelled >= maxDistance:
		queue_free()
		#print("over max distance")
