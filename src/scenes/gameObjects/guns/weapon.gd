extends Node2D

@export var rootEntity: CharacterBody2D
@export var isEnemy: bool

@onready var weaponSprite = $WeaponSprite


@onready var main = NodeUtils.get_main()
@onready var bullet = preload("res://src/scenes/gameObjects/bullets/bullet.tscn")

var player = null

func _ready():
	player = NodeUtils.get_player()

func _process(_delta):
	var target: Vector2
	
	if isEnemy == true:
		target = player.global_position
	else:
		target = get_global_mouse_position()
	
	look_at(target)
	
	match_weapon_flip(target)
	match_z_index(target)
	

func fire():
	var instance = bullet.instantiate()
	instance.global_position = rootEntity.global_position
	instance.rotation = rotation
	instance.spawnPosition = weaponSprite.global_position
	main.get_node("Bullets").add_child(instance)

func match_weapon_flip(target):
	if target.x > rootEntity.position.x:
		weaponSprite.flip_v = false
	elif target.x < rootEntity.position.x:
		weaponSprite.flip_v = true

func match_z_index(target):
	if target.y > rootEntity.position.y:
		weaponSprite.z_index = 2
	elif target.y < rootEntity.position.y:
		weaponSprite.z_index = 1
