class_name State
extends Node

var _state_machine :StateMachine
var _player:Player

func _ready() -> void:
	await(owner.ready)
	_state_machine = _get_state_machine(self)
	_player = owner

func enter(msg: Dictionary = {}) -> void:
	pass

func process(delta: float) -> void:
	pass

func physics_process(delta: float) -> void:
	pass

func unhandled_input(event: InputEvent) -> void:
	pass

func exit() -> void:
	pass

func _get_state_machine(node: Node) -> Node:
	if not node == null and not node is StateMachine:
		return _get_state_machine(node.get_parent())
	return node
