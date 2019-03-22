extends "res://world/mob_handler/factory/states/state.gd"

signal finished_good(good)
var blue_prints
var instructions 
func enter():
	instructions = owner.manufacture_instructions
	blue_prints = owner.blue_prints

func exit():
	return

func update():
	if all_dispatched():
		emit_signal("finished", "Stop")
	else:
		dispatch_goods()

func dispatch_goods():
	if not $DispatchTime.is_stopped():
		return
	var good = owner.finished_goods.pop_back()
	if good != null:
		$DispatchTime.wait_time = consult_blue_prints(good.name)
		$DispatchTime.start()
		emit_signal("finished_good", good)

func all_dispatched():
	return owner.finished_goods.size() <= 0

func consult_blue_prints(good_name):
	var dispatch_time = blue_prints.dispatch_time
	return dispatch_time[good_name]