extends Node

@onready var vignette = $Vignette
@onready var debugManager = $DebugManager
@onready var uiManager = $UiManager



func _ready():
	pass
	#var player = nodeUtils.getPlayer()
	#var camera = get_viewport().get_camera_2d()

func _process(_delta):
	if Input.is_action_just_pressed("debug"):
		toggle_debug_console()

func toggle_debug_console():
	match debugManager.visible:
		false:
			debugManager.visible = true
		true:
			debugManager.visible = false

func toggle_escape():
	pass
