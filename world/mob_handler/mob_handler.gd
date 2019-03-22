extends Node

var enemy_instructions = preload("res://world/mob_handler/enemies_instructions/enemies_instructions.gd")
var player

func _ready():
	for node in get_tree().get_nodes_in_group("player"):
		player = node

func _on_Factory_manufacture_finished(good):
	add_child(good)
	positionate(good)

func positionate(good):
	var player_pos = player.global_position
	var game_screen = get_viewport().size
	var good_position = Vector2(player_pos.x + game_screen.x, player_pos.y)
	good.global_position = good_position


func _on_Player_dead():
	var factory = $Factory/StateMachine._change_state("Stop")
