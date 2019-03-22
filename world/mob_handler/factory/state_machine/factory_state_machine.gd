extends "res://world/mob_handler/factory/state_machine/state_machine.gd"

func _ready():
	states_map = {
		"Manufacture" : $Manufacture,
		"Stop" : $Stop,
		"Dispatch": $Dispatch,
		"Organize": $Organize
	}

func _change_state(state_name):
	if not _active:
		return
	._change_state(state_name)