extends CharacterBody2D

@onready var healthComponent = $HealthComponent
@onready var player = $"."

func _ready():
	pass

func get_health_test():
	var health = healthComponent.get_health()
	print("health from player: %s" % health)


func _on_health_component_died():
	print("player died")
