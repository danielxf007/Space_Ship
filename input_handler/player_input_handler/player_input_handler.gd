extends "res://input_handler/input_handler.gd"
signal got_input(player_input)

var player_input_data = preload("res://input_handler/input/player_input.gd").new()

func _physics_process(delta):
	get_input()
	emit_signal("got_input", player_input_data)

func get_input():
	player_input_data.move_right = Input.is_action_pressed("right")
	player_input_data.move_left = Input.is_action_pressed("left")
	player_input_data.move_up = Input.is_action_pressed("up")
	player_input_data.move_down = Input.is_action_pressed("down")
	player_input_data.shoot = Input.is_action_pressed("shoot")
	player_input_data.weapon_type_one = Input.is_action_pressed("weapon_type_1")
	player_input_data.weapon_type_two = Input.is_action_pressed("weapon_type_2")
	player_input_data.weapon_type_three = Input.is_action_pressed("weapon_type_3")
	player_input_data.weapon_type_four = Input.is_action_pressed("weapon_type_4")
	player_input_data.save = Input.is_action_pressed("save")
	player_input_data.talk = Input.is_action_pressed("talk")
	player_input_data.position = owner.global_position