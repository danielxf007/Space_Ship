extends KinematicBody2D

var look_direction = Vector2()
var move_direction = Vector2()

func update_look_direction(mouse_position):
	look_direction = mouse_position - global_position

func update_move_direction(direction):
	move_direction = direction


