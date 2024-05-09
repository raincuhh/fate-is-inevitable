extends Node

@onready var vignette = $Vignette
@onready var debugManager = $debugManager
@onready var uiManager = $UiManager



func _ready():
	pass
	#var player = nodeUtils.getPlayer()
	#var camera = get_viewport().get_camera_2d()

func _process(delta):
	if Input.is_action_just_pressed("debug"):
		toggleDebugConsole()

func toggleDebugConsole():
	match debugManager.visible:
		false:
			debugManager.visible = true
		true:
			debugManager.visible = false


func toggleEsc():
	pass
