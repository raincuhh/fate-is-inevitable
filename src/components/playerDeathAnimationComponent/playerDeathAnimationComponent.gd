extends CanvasLayer

@export var healthComponent :HealthComponent

@onready var colorRect = $ColorRect
@onready var deathCamera = $Camera2D
@onready var playerDeathAnimationComponent = $"."
@onready var animationPlayer = $AnimationPlayer

var mainCamera: Camera2D
var player = null


func _ready():
	#healthComponent.connect("died", on_dead)
	
	player = NodeUtils.get_player()
	
	colorRect.visible = false
	deathCamera.enabled = false

func animate_visuals():
	colorRect.visible = true
	await get_tree().create_timer(0.3).timeout
	animationPlayer.play("toBlack")
	#var visualTween = get_tree().create_tween()

func animate_camera():
	mainCamera = get_viewport().get_camera_2d()
	mainCamera.enabled = false
	deathCamera.enabled = true
	var cameraTween = get_tree().create_tween()
	
	cameraTween.tween_property(deathCamera, "position", Vector2(player.position.x, player.position.y), 0.7)
	cameraTween.parallel().tween_property(deathCamera, "zoom", Vector2(1.5, 1.5), 0.7)
	

func on_dead():
	#get_tree().paused
	animate_camera()
	animate_visuals()
	print("dead from playerDeathAnimationComponent")
