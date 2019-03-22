extends Node

var names = ["SmallRedShip", "RedShip", "GrayAsteroid", "AsteroidBrow",
"AsteroidDark"]

var quantity = {
	"SmallRedShip": 10,
	"RedShip": 8,
	"GrayAsteroid": 20,
	"AsteroidBrow": 20,
	"AsteroidDark": 15} 

var blue_print = preload("res://world/mob_handler/blue_print_enemies/blue_print_enemies.gd").new()