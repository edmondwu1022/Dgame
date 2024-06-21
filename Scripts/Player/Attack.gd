extends State

func enter(msg: Dictionary = {}) -> void:
	match msg:
		{"velocity" : var v}:
			print(v)
	
	_player.anim_tree.set(_player.ANIM_COND[_player.anim_cond_lists.attack], true)
	print(_player.anim_tree.get(_player.ANIM_COND[_player.anim_cond_lists.attack]))
func physics_process(delta: float) -> void:
	get_parent().physics_process(delta)

	#if _player.is_on_floor():
		#

func unhandled_input(event: InputEvent) -> void:
	get_parent().unhandled_input(event)


func exit() -> void:
	_player.anim_tree.set(_player.ANIM_COND[_player.anim_cond_lists.jump], false)

	#if event is InputEventMouseButton:
		#if event.is_action_pressed("attack"):
			#if _player.timer.is_stopped():
				#LibTools.start_timer(_player.timer, 1.0)
				#_player.anim_state.travel(attack_combo["attack01"])
				#return
#
			#LibTools.start_timer($Timer, 1.0)
#
			#match anim_state.get_current_node():
				#attack_combo["attack01"]:
					#anim_state.travel(attack_combo["attack02"])
				#attack_combo["attack02"]:
					#anim_state.travel(attack_combo["attack03"])
				#attack_combo["attack03"]:
					#anim_state.travel(attack_combo["attack04"])
