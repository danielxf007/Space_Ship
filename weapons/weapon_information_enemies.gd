extends Node

var type_of_bullets = {"weapon_type_one": preload("res://projectiles/red_projectile/RedProjectile.tscn")}
var weapons_carriage = {"weapon_type_one": 10}
var current_bullets_in_carriage = {"weapon_type_one": 10}
var shoot_cool_down_timers = {"weapon_type_one": 0.5}
var reload_cool_down_timers = {"weapon_type_one": 1}
