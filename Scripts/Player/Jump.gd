extends State

func enter(msg: Dictionary = {}) -> void:
	match msg:
		{"jump_impulse" : var ji, "velocity" : var v}:
			_player.velocity = v + Vector3(0.0, ji, 0.0)
	
	_player.anim_tree.set(_player.ANIM_COND[_player.anim_cond_lists.jump], true)
	print(_player.velocity)

func physics_process(delta: float) -> void:
	get_parent().physics_process(delta)
	if _player.is_on_floor():
		_state_machine.transition_to(_state_machine.states["IWR"])

func unhandled_input(event: InputEvent) -> void:
	get_parent().unhandled_input(event)


func exit() -> void:
	_player.anim_tree.set(_player.ANIM_COND[_player.anim_cond_lists.jump], false)
