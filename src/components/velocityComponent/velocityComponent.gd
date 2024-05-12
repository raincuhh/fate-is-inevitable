extends Node

@export var maxSpeed: float = 10
@export var debug: bool = false

var acceleration: float = 0.1
var friction: float = 0.1
var Velocity: Vector2

func move(entity: CharacterBody2D, delta):
	entity.velocity = Velocity
	entity.move_and_slide()

func to_velocity(velocity, type):
	Velocity = lerp(Velocity, velocity, type)

func accelerate_in_direction(direction):
	to_velocity(direction * maxSpeed, acceleration)

func decelerate():
	to_velocity(Vector2.ZERO, friction)
