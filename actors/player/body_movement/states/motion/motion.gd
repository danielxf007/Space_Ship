extends "res://actors/player/body_movement/states/state.gd"

func handle_animation(ani_name):
	owner.get_node("AnimationPlayer").play(ani_name)

func get_move_direction():
	return owner.move_direction

func get_look_direction():
	return owner.look_direction

func is_moving(move_direction):
	if move_direction == Vector2():
		return false
	else:
		return true