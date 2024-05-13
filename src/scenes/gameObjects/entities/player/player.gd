extends CharacterBody2D

#player is called chomps :3

@onready var velocityComponent = $VelocityComponent
@onready var healthComponent = $HealthComponent
@onready var inputManager = $InputManager
@onready var dashManager = $DashManager
@onready var animationPlayer = $AnimationPlayer
@onready var weapon = $Visuals/WeaponRoot/Weapon

@onready var player = $"."
@onready var body = $Visuals/Body
@onready var label = $Label

var stateMachine: StateMachine = StateMachine.new()

var main = null

func _ready():
	stateMachine.add_states(StateNormal)
	stateMachine.add_states(StateDash)
	stateMachine.set_initial_state(StateNormal)
	print("states: %s" %stateMachine.states)
	
	healthComponent.connect("died", on_dead)
	
	main = NodeUtils.get_main()
	var playerUi = main.get_node("PlayerUI")
	playerUi.update_health_ui()
	
	get_health_test()

func _process(delta):
	stateMachine.update()
	velocityComponent.move(player)
	
	var localMouse = get_local_mouse_position()
	var angle = snappedf(localMouse.angle(), PI/2) / (PI/2) #4 is 8 directions, 2 is 4 directions
	angle = wrapi(int(angle), 0, 4)
	label.text = "angle:%s" % angle
	
	#var direction = Vector2.RIGHT.rotated(global_rotation)#.rotated(deg_to_rad(2.0))
	#print(direction)
	if Input.is_action_just_pressed("fire"):
		weapon.fire()


func StateNormal():
	handle_body_flipping()
	var inputVector: Vector2 = inputManager.get_input()
	var direction = inputVector.normalized()
	
	if inputVector != Vector2.ZERO:
		velocityComponent.accelerate_in_direction(direction)
		animationPlayer.play("run")
	else:
		velocityComponent.decelerate()
		animationPlayer.play("idle")
	
	#if Input.is_action_just_pressed("dash"): #&& dashManager.canDash:
	#	stateMachine.change_state(StateDash)

func StateDash():
	pass

func get_health_test():
	var health = healthComponent.get_health()
	print("health from player: %s" % health)

func on_dead():
	print("player died")

func handle_body_flipping():
	var pos = get_global_mouse_position()
	if pos.x > player.position.x:
		body.flip_h = false
	elif pos.x < player.position.x:
		body.flip_h = true
