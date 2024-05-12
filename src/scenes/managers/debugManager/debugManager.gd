extends CanvasLayer

@onready var fpsLabel = $visual/MarginContainer/HBoxContainer/display/fps
@onready var debugManager = $"."
@onready var playerVelocity = $visual/MarginContainer/HBoxContainer/display/playerVelocity
@onready var playerInput = $visual/MarginContainer/HBoxContainer/display/playerInput
@onready var cameraOffset = $visual/MarginContainer/HBoxContainer/display/cameraOffset



var player = null
var main = null

func _ready():
	player = NodeUtils.get_player()
	main = NodeUtils.get_main()

func _process(delta):
	if debugManager.visible:
		var fps = Engine.get_frames_per_second()
		fpsLabel.text = "fps: %s" % fps
		playerVelocity.text = "velocity: %.2f, %.2f" % [player.velocity.x, player.velocity.y]
		var input = player.get_node("InputManager").input
		playerInput.text = "input: %.2f, %.2f" % [input.x, input.y] 
		var mainCameraOffset = main.get_node("GameCamera").camera.offset
		cameraOffset.text = "offset: %.2f, %.2f" % [mainCameraOffset.x, mainCameraOffset.y]

func _on_remove_player_hp_pressed():
	var playerHealthComponent = player.get_node("HealthComponent")
	if player:
		playerHealthComponent.damage(10)
		player.get_health_test()
