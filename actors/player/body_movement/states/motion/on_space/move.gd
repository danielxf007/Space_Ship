extends "res://actors/player/body_movement/states/motion/motion.gd"

const MAX_SPEED = 250.0
const MIN_SPEED = 150.0
export(float) var move_force = 0.0
export(bool) var is_player = true
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
	if is_player:
		correct_outside_view_bounds_for_player()
	else:
		outside_view_bounds_enemy()

func calculate_speed(delta):
	speed += move_force * delta
	if speed > MAX_SPEED:
		speed = MAX_SPEED
	if speed < MIN_SPEED:
		speed = MIN_SPEED

func correct_outside_view_bounds_for_player():
	var game_screen = owner.get_viewport().size
	var player_position = owner.global_position
	var player_body_scale = owner.get_node("Body").scale 
	var player_size = owner.get_node("Body").texture.get_size()
	player_size.y = player_size.y * player_body_scale.y
	player_size.x = player_size.x * player_body_scale.x
	if player_position.y + player_size.y / 2 > game_screen.y:
		owner.global_position.y = game_screen.y - player_size.y / 2
	if player_position.y - player_size.y / 2 < 0:
		owner.global_position.y = player_size.y / 2
	if player_position.x + player_size.x / 2 > game_screen.x:
		owner.global_position.x = game_screen.x - player_size.x / 2
	if player_position.x - player_size.x / 2 < 0:
		owner.global_position.x = player_size.x / 2

func outside_view_bounds_enemy():
	var game_screen = owner.get_viewport().size
	var enemy_position = owner.global_position
	var enemy_body_scale = owner.get_node("Body").scale 
	var enemy_size = owner.get_node("Body").texture.get_size()
	enemy_size.y = player_size.y * player_body_scale.y
	enemy_size.x = player_size.x * player_body_scale.x
	if enemy_position.y + enemy_size.y / 2 > game_screen.y:
		owner.global_position.y = game_screen.y - enemy_size.y / 2
	if enemy_position.y - enemy_size.y / 2 < 0:
		owner.global_position.y = enemy_size.y / 2
	if enemy_position.x + enemy_size.x / 2 < 0:
		owner.queue_free()
