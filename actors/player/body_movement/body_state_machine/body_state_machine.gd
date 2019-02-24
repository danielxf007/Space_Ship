extends "res://actors/player/body_movement/body_state_machine/state_machine.gd"

func _ready():
	states_map = {
		"Idle" : $Idle,
		"Move" : $Move,
	}

func _change_state(state_name):
	if not _active:
		return
	if state_name in ["Stagger", "Die"]:
		states_stack.push_front(states_map[state_name])
	._change_state(state_name)
