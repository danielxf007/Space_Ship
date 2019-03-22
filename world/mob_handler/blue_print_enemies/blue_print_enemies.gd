extends Node

var good = {
	"SmallRedShip": preload("res://actors/enemies/small_red_ship/SmallRedShip.tscn"),
	"RedShip": preload("res://actors/enemies/red_ship/RedShip.tscn"),
	"BrownAsteroid": preload("res://obstacle/brown_asteroid/BrownAsteroid.tscn"),
	"DarkAsteroid": preload("res://obstacle/dark_asteroid/DarkAsteroid.tscn"),
	"GrayAsteroid": preload("res://obstacle/gray_asteroid/GrayAsteroid.tscn"),
	"GrayAsteroid2": preload("res://obstacle/gray_asteroid_2/GrayAsteroid2.tscn"),
	"SpaceMine": preload("res://obstacle/space_mine/SpaceMine.tscn")
}

var production_time = {
	"SmallRedShip": 0.1,
	"RedShip": 0.3,
	"BrownAsteroid": 0.5,
	"DarkAsteroid": 0.45,
	"GrayAsteroid": 0.4,
	"GrayAsteroid2": 0.35,
	"SpaceMine": 0.3
}

var dispatch_time = {
	"SmallRedShip": 1,
	"RedShip": 3,
	"BrownAsteroid": 5,
	"DarkAsteroid": 4.5,
	"GrayAsteroid": 4,
	"GrayAsteroid2": 3.5,
	"SpaceMine": 1.5
}
