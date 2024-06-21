extends Control

@export var _state_machine:StateMachine

@onready var label :Label = $Label/Label2

func _ready() -> void:
	if _state_machine is StateMachine:
		_state_machine.transition.connect(update_label)

func update_label(name: String) ->void:
	label.text = name
