extends Node

var good = {
	"SmallRedShip": preload("res://actors/enemies/small_red_ship/SmallRedShip.tscn"),
	"RedShip": preload("res://actors/enemies/red_ship/RedShip.tscn"),
	"GrayAsteroid": preload("res://actors/enemies/gray_asteroid/GrayAsteroid.tscn"),
	"AsteroidBrow": preload("res://actors/enemies/asteroid_brow/AsteroidBrow.tscn"),
	"AsteroidDark": preload("res://actors/enemies/asteroid_dark/AsteroidDark.tscn")}
	
var production_time = {
	"SmallRedShip": 2.0,
	"RedShip": 3.0,
	"GrayAsteroid": 1.0,
	"AsteroidBrow": 1.0,
	"AsteroidDark": 1.0}
	
var dispatch_time = {
	"SmallRedShip": 2.0,
	"RedShip": 3.0,
	"GrayAsteroid": 1.0,
	"AsteroidBrow": 1.0,
	"AsteroidDark": 1.0}
