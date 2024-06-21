extends State

func enter(msg: Dictionary = {}) -> void:
	_player.anim_tree.set(_player.ANIM_COND[_player.anim_cond_lists.ground], true)
	_player.anim_state.travel("IWR")

func physics_process(delta: float) -> void:
	get_parent().physics_process(delta)
	
	var IWR_anim_blend := (_player.velocity * _player.model.basis) / _player.speed
	_player.anim_tree.set(_player.IWR,Vector2(IWR_anim_blend.x, -IWR_anim_blend.z))
	
	#if not _player.is_on_floor():
		#_state_machine.transition_to(_state_machine.states["Jump"])

func unhandled_input(event: InputEvent) -> void:
	get_parent().unhandled_input(event)
	if _player.is_on_floor() and event.is_action_pressed("jump"):
		_state_machine.transition_to(_state_machine.states["Jump"], {"jump_impulse" = _player.jump_impulse, "velocity" = _player.velocity})
	if event.is_action_pressed("attack"):
		_state_machine.transition_to(_state_machine.states["Attack"], {"velocity" : _player.velocity})
	
func exit() -> void:
	_player.anim_tree.set(_player.ANIM_COND[_player.anim_cond_lists.ground], false)
	pass
