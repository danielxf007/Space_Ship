extends "res://actors/player/body_movement/states/state.gd"

func handle_animation(ani_name):
	owner.get_node("AnimationPlayer").play(ani_name)

func get_move_direction():
	return owner.move_direction