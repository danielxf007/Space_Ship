extends Node

var enemies = {
	"small_ship": preload("res://actors/enemies/small_red_ship/SmallRedShip.tscn"),
	"normal_ship": preload("res://actors/enemies/red_ship/RedShip.tscn"),
	"gray_asteroid": preload("res://actors/enemies/gray_asteroid/GrayAsteroid.tscn"),
	"brow_asteroid": preload("res://actors/enemies/asteroid_brow/AsteroidBrow.tscn"),
	"dark_asteroid": preload("res://actors/enemies/asteroid_dark/AsteroidDark.tscn")}
	
var production_time = {
	"small_ship": 2.0,
	"normal_ship": 3.0,
	"gray_asteroid": 1.0,
	"brow_asteroid": 1.0,
	"dark_asteroid": 1.0}
	
var spawning_time = {
	"small_ship": 2.0,
	"normal_ship": 3.0,
	"gray_asteroid": 1.0,
	"brow_asteroid": 1.0,
	"dark_asteroid": 1.0}
