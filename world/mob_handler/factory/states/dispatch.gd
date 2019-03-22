extends "res://world/mob_handler/factory/states/state.gd"

signal finished_good(good)

func enter():
	return

func exit():
	return

func update():
	if all_dispatched():
		emit_signal("finished", "Stop")
	else:
		dispatch_goods()

func dispatch_goods():
	if $DispatchTime.stop():
		var model = owner.manufacture_queue.pop_front()
		if model != null:
			$DispatchTime.wait_time = consult_blue_prints(model.name)
			$DispatchTime.start()
			var good = model.owner.finished_goods.push_back()
			emit_signal("finished_good", good)

func all_dispatched():
	return owner.finished_goods.size() <= 0

func consult_blue_prints(good_name):
	var dispatch_time = blue_prints.dispatch_time
	return dispatch_time[good_name]