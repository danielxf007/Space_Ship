extends "res://actors/player/body_movement/states/motion/motion.gd"

func enter():
	handle_animation("idle")

func update(delta):
	var move_direction = get_move_direction()
	if is_moving(move_direction):
		emit_signal("finished", "Move")
