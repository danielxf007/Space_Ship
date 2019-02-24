extends "res://input_handler/input_communicator/input_communicator.gd"
signal moved(move_direction)
signal weapon_changed(weapon_name)
signal look_direction_changed(direction)
signal talked(talk)
signal saved(save)
signal shooted()

func communicate_input(player_input):
	communicate_movement_input_direction(player_input)
	communicate_weapon_type_input(player_input)
	communicate_shoot_input(player_input)
	communicate_look_direction(player_input)

func communicate_movement_input_direction(player_input_data):
	var movement_direction = Vector2()
	movement_direction.x = int(player_input_data.move_right) - int(player_input_data.move_left)
	movement_direction.y = int(player_input_data.move_down) - int(player_input_data.move_up)
	emit_signal("moved", movement_direction)

func communicate_shoot_input(player_input_data):
	emit_signal("shooted") 

func communicate_weapon_type_input(player_input_data):
	if player_input_data.weapon_type_one:
		emit_signal("weapon_changed", "weapon_type_one")
		return
	if player_input_data.weapon_type_two:
		emit_signal("weapon_changed", "weapon_type_two")
		return
	if player_input_data.weapon_type_three:
		emit_signal("weapon_changed", "weapon_type_three")
		return
	if player_input_data.weapon_type_four:
		emit_signal("weapon_changed", "weapon_type_four")
		return

func communicate_look_direction(player_input_data):
	var look_direction = (player_input_data.position + Vector2(1, 0)).normalized()
	emit_signal("look_direction_changed", look_direction)

func communicate_save_input(player_input_data):
	return

func communicate_talk_input(player_input_data):
	return
