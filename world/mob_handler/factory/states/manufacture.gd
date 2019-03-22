extends "res://world/mob_handler/factory/states/state.gd"

var goods_quantity


func enter():
	return

func exit():
	return

func update():
	return

func manufacture_good():
	if $ProductionTime.stop():
		var model = owner.manufacture_queue.pop_front()
		if model != null:
			$ProductionTime.start()
			var good = model.instance()
			owner.finished_goods.push_back(good)
			goods_quantity -= 1


func production_finished():
	return goods_quantity <= 0

func interrupt_production():
	emit_signal("finished", "Stop")