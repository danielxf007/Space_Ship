extends Node

var good = {
	"SmallRedShip": preload("res://actors/enemies/small_red_ship/SmallRedShip.tscn"),
	"RedShip": preload("res://actors/enemies/red_ship/RedShip.tscn"),
	"GrayAsteroid": preload("res://actors/enemies/gray_asteroid/GrayAsteroid.tscn"),
	"AsteroidBrow": preload("res://actors/enemies/asteroid_brow/AsteroidBrow.tscn"),
	"AsteroidDark": preload("res://actors/enemies/asteroid_dark/AsteroidDark.tscn")}

var production_time = {
	"SmallRedShip": 0.1,
	"RedShip": 0.3,
	"GrayAsteroid": 0.1,
	"AsteroidBrow": 0.1,
	"AsteroidDark": 0.1}

var dispatch_time = {
	"SmallRedShip": 2,
	"RedShip": 3,
	"GrayAsteroid": 4,
	"AsteroidBrow": 5,
	"AsteroidDark": 6}
