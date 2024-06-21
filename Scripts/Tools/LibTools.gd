class_name LibTools

static func start_timer(obj:Timer, time:float, shot:=true):
	obj.one_shot = shot
	obj.wait_time = time
	obj.start()
