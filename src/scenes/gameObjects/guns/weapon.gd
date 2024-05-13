extends Node2D

@export var rootEntity: CharacterBody2D
@export var lookAtPlayer: bool

@onready var weapon = $WeaponSprite
@onready var root = $"."

var target = null

func _ready():
	target = NodeUtils.get_player()

func _process(_delta):
	var pos
	
	if lookAtPlayer == true:
		pos = target.global_position
	else:
		pos = get_global_mouse_position()
	root.look_at(pos)
	
	match_weapon_flip(pos)
	match_z_index(pos)

func match_weapon_flip(pos):
	if pos.x > rootEntity.position.x:
		weapon.flip_v = false
	elif pos.x < rootEntity.position.x:
		weapon.flip_v = true

func match_z_index(pos):
	if pos.y > rootEntity.position.y:
		weapon.z_index = 2
	elif pos.y < rootEntity.position.y:
		weapon.z_index = 1


func fire():
	pass
