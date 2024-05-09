class_name HealthComponent
extends Node2D

@export var maxHealth : int
@export var damageFloat : bool
@onready var floatingText = preload("res://src/ui/floatText.tscn")

var health : int

signal died

func _ready():
	health = maxHealth

func get_health():
	return health

func _process(_delta):
	if health < 0:
		health = 0
	
	if health <= 0:
		emit_signal("died")
		health += 1 #for testing

func damage(amount: int):
	health = health - amount
	if damageFloat:
		#TODO, if an entity gets hit within a 0.5 scope, instead of making a new float, add it onto the current float amount
		var floatingTextInstance = floatingText.instantiate()
		floatingTextInstance.amount = amount
		floatingTextInstance.type = "health"
		add_child(floatingTextInstance)
