extends Node2D

@export var rootEntity: CharacterBody2D
@export var isEnemy: bool

@onready var weaponSprite = $WeaponSprite


@onready var main = NodeUtils.get_main()
@onready var bullet = preload("res://src/prototyping/gameObjects/bullets/projectilePrototype.tscn")

var player = null

func _ready():
	player = NodeUtils.get_player()

func _process(_delta):
	var pos: Vector2
	
	if isEnemy == true:
		pos = player.global_position
	else:
		pos = get_global_mouse_position()
	
	look_at(pos)
	
	match_weapon_flip(pos)
	match_z_index(pos)
	

func fire():
	var instance = bullet.instantiate()
	#instance.spawnPosition = rootEntity.global_position
	#instance.spawnRotation = global_rotation
	main.get_node("Bullets").add_child(instance)

func match_weapon_flip(pos):
	if pos.x > rootEntity.position.x:
		weaponSprite.flip_v = false
	elif pos.x < rootEntity.position.x:
		weaponSprite.flip_v = true

func match_z_index(pos):
	if pos.y > rootEntity.position.y:
		weaponSprite.z_index = 2
	elif pos.y < rootEntity.position.y:
		weaponSprite.z_index = 1
