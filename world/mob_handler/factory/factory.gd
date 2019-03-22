extends Node
signal manufacture_finished(good)

var manufacture_queue = [] setget set_manufacture_queue
var finished_goods = []
var manufacture_instructions setget set_manufacture_instructions

func set_manufacture_queue(queue):
	manufacture_queue = queue

func set_manufacture_instructions(instructions):
	manufacture_instructions = instructions

func _on_Dispatch_finished_good(good):
	emit_signal("manufacture_finished", good)
