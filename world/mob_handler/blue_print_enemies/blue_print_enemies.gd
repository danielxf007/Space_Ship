extends Node

var good = {
	"SmallRedShip": preload("res://actors/enemies/small_red_ship/SmallRedShip.tscn"),
	"RedShip": preload("res://actors/enemies/red_ship/RedShip.tscn"),
}

var production_time = {
	"SmallRedShip": 0.1,
	"RedShip": 0.3,
}

var dispatch_time = {
	"SmallRedShip": 2,
	"RedShip": 3,
}
