class_name HealthComponent
extends Node2D

@export var maxHealth : int = 10
@export var damageFloat : bool = true

@onready var floatingText = preload("res://src/scenes/ui/floatText/floatText.tscn")
@onready var healthComponent = $"."

var currentHealth : int
var hasDied: bool = false

signal died
signal healthChanged

#TODO, if an entity gets hit within a 0.5 scope, instead of making a new float, add it onto the current float damage

func _ready():
	init_health()

func init_health():
	currentHealth = maxHealth

func get_health():
	return currentHealth

func get_max_health():
	return maxHealth

func update():
	if currentHealth < 0:
		currentHealth = 0
	
	if currentHealth <= 0:
		emit_signal("died")
		currentHealth += 1 #for testing

func damage(amount: int):
	currentHealth -= amount
	emit_signal("healthChanged")
	update()
	if damageFloat:
		FloatTextUtil.createFloatText(healthComponent.global_position, amount)

func heal(amount: int):
	damage(-amount)
