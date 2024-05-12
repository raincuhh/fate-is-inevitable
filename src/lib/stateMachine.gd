class_name StateMachine 
extends Node

var states = {}
var currentState: Callable


func add_states(state):
	states[state] = state

func update():
	if currentState:
		currentState.call()

func set_state(state):
	currentState = state

func change_state(state):
	currentState = state

func set_initial_state(state):
	currentState = state

func get_current_state():
	return currentState

class StateProcess:
	pass
