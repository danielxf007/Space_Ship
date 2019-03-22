extends "res://world/mob_handler/factory/states/state.gd"

var blue_prints
func enter():
	return

func exit():
	return

func update():
	return

func cancel_manufacture(good_name, quantity):
	pass

func add_to_manufacture_queue(good_name):
	var model_info = consult_blue_prints(good_name)
	owner.manufacture_queue.push_back(model_info)

func create_manufacture_queue(queue):
	var new_queue = []
	owner.set_manufacture_queue(new_queue)

func consult_blue_prints(good_name):
	return blue_prints[good_name]