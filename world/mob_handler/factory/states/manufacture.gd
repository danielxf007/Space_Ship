extends "res://world/mob_handler/factory/states/state.gd"

var goods_quantity

func enter():
	return

func exit():
	return

func update():
	return

func manufacture_good(good_name):
	if $ProductionTime.stop():
		var model = consult_blue_prints(good_name)
		if model != null:
			$ProductionTime.start()
			var good = model.instance()
			owner.finished_goods.push_back(good)
			goods_quantity -= 1

func consult_blue_prints(good_name):
	pass

func production_finished():
	pass

func interrupt_production():
	pass