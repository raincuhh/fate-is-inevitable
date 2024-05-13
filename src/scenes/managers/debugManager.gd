extends CanvasLayer


@onready var debugManager = $"."
@onready var fpsLabel = $visual/MarginContainer/HBoxContainer/display/Fps
@onready var playerVelocity = $visual/MarginContainer/HBoxContainer/display/PlayerVelocity
@onready var playerInput = $visual/MarginContainer/HBoxContainer/display/PlayerInput
@onready var cameraOffset = $visual/MarginContainer/HBoxContainer/display/CameraOffset

@onready var removePlayerHpAmount = $visual/MarginContainer/HBoxContainer/commands/HBoxContainer/PlayerHpAmount


var player = null
var main = null

func _ready():
	player = NodeUtils.get_player()
	main = NodeUtils.get_main()

func _process(delta):
	if debugManager.visible:
		var fps = Engine.get_frames_per_second()
		var mainCameraOffset = main.get_node("MainCamera").camera.offset
		var input = player.get_node("InputManager").input
		
		fpsLabel.text = "fps: %s" % fps
		playerVelocity.text = "velocity: %.2f, %.2f" % [player.velocity.x, player.velocity.y]
		playerInput.text = "input: %.2f, %.2f" % [input.x, input.y] 
		cameraOffset.text = "camera offset: %.2f, %.2f" % [mainCameraOffset.x, mainCameraOffset.y]

func _on_remove_player_hp_pressed():
	var playerHealthComponent = player.get_node("HealthComponent")
	if player && !removePlayerHpAmount.text.is_empty():
		playerHealthComponent.damage(int(removePlayerHpAmount.text))
		player.get_health_test()
