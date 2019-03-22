extends Node

export(int) var max_health = 20
var health = 0

func _ready():
	health = max_health

func take_damage(amount):
	health -= amount
	if health <= 0:
		owner.set_dead(true)