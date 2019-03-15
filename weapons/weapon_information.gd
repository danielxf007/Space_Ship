extends Node

var type_of_bullets = {"weapon_type_one": preload("res://projectiles/blue_projectile/BlueProjectile.tscn"),
"weapon_type_two": preload("res://projectiles/space_bomb_blue/BlueBomb.tscn")}
var weapons_carriage = {"weapon_type_one": 10, "weapon_type_two": 2}
var current_bullets_in_carriage = {"weapon_type_one": 10, "weapon_type_two": 2}
var shoot_cool_down_timers = {"weapon_type_one": 0.5, "weapon_type_two": 2}
var reload_cool_down_timers = {"weapon_type_one": 1, "weapon_type_two": 1.5}
