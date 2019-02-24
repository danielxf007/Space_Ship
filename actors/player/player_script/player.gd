extends KinematicBody2D

var look_direction = Vector2(1, 0)
var move_direction = Vector2()

func update_look_direction(direction):
	look_direction = direction

func update_move_direction(direction):
	move_direction = direction


