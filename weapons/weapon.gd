extends Position2D

export(String) var current_weapon
var world

func _ready():
	for node in get_tree().get_nodes_in_group("world"):
		world = node 

func shoot():
	return

func reload():
	return

func change_weapon(weapon_name):
	return