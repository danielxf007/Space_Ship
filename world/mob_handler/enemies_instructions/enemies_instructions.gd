extends Node

var enemy_names = ["small_ship", "normal_ship", "gray_asteroid", "brow_asteroid",
"dark_asteroid"]

var enemies_quantity = {
	"small_ship": 10,
	"normal_ship": 8,
	"gray_asteroid": 20,
	"brow_asteroid": 20,
	"dark_asteroid": 15} 

var enemies_blue_print = preload("res://world/mob_handler/blue_print_enemies/blue_print_enemies.gd").new()