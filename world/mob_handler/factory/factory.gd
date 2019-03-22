extends Node
signal manufacture_finished(good)

var manufacture_queue = [] setget set_manufacture_queue
var finished_goods = []
var manufacture_instructions = preload("res://world/mob_handler/enemies_instructions/enemies_instructions.gd").new() setget set_manufacture_instructions
var blue_prints = preload("res://world/mob_handler/blue_print_enemies/blue_print_enemies.gd").new()

func set_manufacture_queue(queue):
	manufacture_queue = queue

func set_manufacture_instructions(instructions):
	manufacture_instructions = instructions

func _on_Dispatch_finished_good(good):
	emit_signal("manufacture_finished", good)
