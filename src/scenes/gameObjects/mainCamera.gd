extends Node2D

@onready var camera = $Camera2D

const maxDistance: Vector2 = Vector2(78, 78)

var player = null
var scaleLean: float = 0.2
var smoothLean: float = 10.0



func _ready():
	player = NodeUtils.get_player()

func _process(delta):
	lean_camera_towards_mouse(delta)
	get_player_position()

func lean_camera_towards_mouse(delta):
	var mousePosition = get_global_mouse_position()
	var dirToMouse = (mousePosition - camera.position).normalized()
	var distanceToMouse = mousePosition.distance_to(camera.position)
	var lean = dirToMouse * distanceToMouse * scaleLean
	#var maxDistance = Vector2(get_viewport().size.x / 2, get_viewport().size.y / 2) * 0.8 
	
	camera.offset = lerp(camera.offset, lean, smoothLean * delta)
	
	camera.offset.x = clamp(camera.offset.x, -maxDistance.x, maxDistance.x)
	camera.offset.y = clamp(camera.offset.y, -maxDistance.y, maxDistance.y)

func get_player_position():
	camera.position = player.position

