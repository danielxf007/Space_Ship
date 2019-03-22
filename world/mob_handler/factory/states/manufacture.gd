extends "res://world/mob_handler/factory/states/state.gd"

var blue_prints
var instructions

func enter():
	instructions = owner.manufacture_instructions
	blue_prints = owner.blue_prints
	print($ProductionTime.is_stopped())

func exit():
	return

func update():
	if production_finished():
		emit_signal("finished", "Dispatch")
	else:
		manufacture_good()

func manufacture_good():
	if not $ProductionTime.is_stopped():
		return
	var model = owner.manufacture_queue.pop_front()
	if model != null:
		var good = model.instance()
		$ProductionTime.wait_time = consult_blue_prints(good.name)
		$ProductionTime.start()
		owner.finished_goods.push_back(good)


func production_finished():
	return owner.manufacture_queue.size() <= 0

func consult_blue_prints(good_name):
	var production_time = blue_prints.production_time
	return production_time[good_name]

func interrupt_production():
	emit_signal("finished", "Stop")