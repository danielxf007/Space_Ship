extends "res://world/mob_handler/factory/states/state.gd"

var blue_prints
var instructions 

func enter():
	instructions = owner.manufacture_instructions
	blue_prints = owner.blue_prints
	create_finished_goods_queue()
	create_manufacture_queue()


func exit():
	return

func update():
	if instructions != null:
		organize_manufacture_queue()

func cancel_manufacture(good_name, quantity):
	pass

func organize_manufacture_queue():
	var goods = instructions.names
	for good_name in goods:
		var quantity = instructions.quantity[good_name]
		add_to_manufacture_queue(good_name, quantity)
	emit_signal("finished", "Manufacture")

func add_to_manufacture_queue(good_name, quantity):
	var model_info = consult_blue_prints(good_name)
	for index in range(1, quantity + 1):
		owner.manufacture_queue.push_back(model_info)

func create_manufacture_queue():
	var new_queue = []
	owner.set_manufacture_queue(new_queue)

func create_finished_goods_queue():
	var new_queue = []
	owner.finished_goods = new_queue
	
func consult_blue_prints(good_name):
	var good = blue_prints.good
	return good[good_name]