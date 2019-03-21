extends Node
signal manufacture_finished(good)

onready var blue_prints = $BluePrints
var manufacture_queue = [] setget set_manufacture_queue
var finished_goods = []
var manufacture_instructions setget set_manufacture_instructions

func set_manufacture_queue(queue):
	manufacture_queue = queue

func set_manufacture_instructions(instructions):
	manufacture_instructions = instructions