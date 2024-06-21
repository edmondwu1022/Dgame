extends State

var gravity: float = ProjectSettings.get("physics/3d/default_gravity")
var falling_speed: float = 2

func physics_process(delta: float) -> void:
	_player.velocity.y += -gravity * falling_speed * delta
	_get_move_input(delta)
	_player.move_and_slide()
	
	if _player.velocity.length()>1.0:
		_player.model.rotation.y = lerp_angle(_player.model.rotation.y, _player.spring_arm.rotation.y, _player.rotation_speed * delta)

func unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		# check rotation
		_player.spring_arm.rotation.x -= event.relative.y * _player.mouse_sensitivity
		_player.spring_arm.rotation_degrees.x = clamp(_player.spring_arm.rotation_degrees.x, -90,30)
		_player.spring_arm.rotation.y -= event.relative.x * _player.mouse_sensitivity

func get_input() -> Vector2:
	return Input.get_vector("left", "right", "forward", "backward")

func _get_move_input(delta:float) ->void:
	var input := get_input()
	var direction := Vector3(input.x, 0.0, input.y).rotated(Vector3.UP, _player.spring_arm.rotation.y)
	if direction.length() > 1.0:
		direction = direction.normalized()
	
	_player.velocity = lerp(_player.velocity, direction * _player.speed, _player.acceleration * delta)
