class_name HealthComponent
extends Node2D

@export var maxHealth : int = 10
@export var damageFloat : bool = true

@onready var floatingText = preload("res://src/ui/floatText.tscn")
@onready var healthComponent = $"."

var currentHealth : int
var hasDied: bool = false

signal died

func _ready():
	init_health()

func init_health():
	currentHealth = maxHealth

func get_health():
	return currentHealth

func update_health():
	if currentHealth < 0:
		currentHealth = 0
	
	if currentHealth <= 0:
		emit_signal("died")
		currentHealth += 1 #for testing


func damage(damage: int):
	currentHealth -= damage
	#if damageFloat:
		#TODO, if an entity gets hit within a 0.5 scope, instead of making a new float, add it onto the current float damage
	#	var floatingTextInstance = floatingText.instantiate()
	#	floatingTextInstance.damage = amount
	#	floatingTextInstance.position = healthComponent.global_position
	#	var instancePos = floatingTextInstance.position
	#	print(instancePos)
	#	floatingTextInstance.spawnPosition = healthComponent.global_position
	#	mainForeground.add_child(floatingTextInstance)
	#	
	update_health()
