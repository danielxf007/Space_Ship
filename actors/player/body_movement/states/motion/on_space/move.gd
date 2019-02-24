extends "res://actors/player/body_movement/states/motion/motion.gd"

const MAX_SPEED = 200.0
const MIN_SPEED = 100.0
export(float) var move_force = 0.0
var speed

func enter():
	speed = 0.0
	handle_animation("move")

func exit():
	return

func update(delta):
	var move_direction = get_move_direction()
	if is_moving(move_direction):
		move(move_direction, delta)
	else:
		emit_signal("finished", "Idle")

func move(direction, delta):
	calculate_speed(delta)
	var velocity = direction * speed
	owner.move_and_slide(velocity)
	correct_outside_view_bounds()

func calculate_speed(delta):
	speed += move_force * delta
	if speed > MAX_SPEED:
		speed = MAX_SPEED
	if speed < MIN_SPEED:
		speed = MIN_SPEED

func correct_outside_view_bounds():
	if owner.global_position.y > owner.get_viewport().size.y:
		owner.global_position.y = owner.get_viewport().size.y
	if owner.global_position.y < 0:
		owner.global_position.y = 0