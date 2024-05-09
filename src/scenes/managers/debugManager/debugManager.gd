extends CanvasLayer

@onready var fpsLabel = $visual/MarginContainer/HBoxContainer/display/fps
@onready var debug_manager = $"."

var player = null

func _ready():
	player = NodeExtensions.getPlayer()

func _process(delta):
	if debug_manager.visible:
		var fps = Engine.get_frames_per_second()
		fpsLabel.text = "fps: %s" % fps

func _on_remove_player_hp_pressed():
	var healthComponent = player.get_node("HealthComponent")
	if player:
		healthComponent.damage(10)
		player.get_health_test()
