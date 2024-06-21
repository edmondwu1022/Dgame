class_name StateMachine
extends Node

signal transition
@export var initial_state: State

var states := {}
var _current_state: State :
	set = _set_current_state

func _ready() -> void:
	await (owner.ready)
	
	for state in get_children():
		var name = state.name
		states[name] = state

		if state.get_child_count() >0:
			for child in state.get_children():
				var c_name = child.name
				states[c_name] = child
	
	self._current_state = initial_state

func _process(delta: float) -> void:
	_current_state.process(delta)

func _physics_process(delta: float) -> void:
	_current_state.physics_process(delta)

func _unhandled_input(event: InputEvent) -> void:
	_current_state.unhandled_input(event)

func transition_to(new_state:State, msg: Dictionary = {}) -> void:
	_current_state.exit()
	self._current_state = new_state
	_current_state.enter(msg)

func _set_current_state(value) -> void:
	_current_state = value
	transition.emit(_current_state.name)
