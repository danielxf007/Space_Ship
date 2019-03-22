extends Node2D

export (int) var detect_radius = 100
var target = null
var weapon 

func _ready():
	weapon = owner.get_node("Weapon")
	var shape = LineShape2D.new()
	shape.d = detect_radius
	var visibility = owner.get_node("Visibility")
	visibility.get_node("CollisionShape2D").shape = shape

func _physics_process(delta):
	attack()

func attack():
	if $RayCast2D.is_colliding():
		weapon.shoot()

func _on_Visibility_body_entered(body):
	if target != null or body.name != "Player":
		return
	target = body

func _on_Visibility_body_exited(body):
	if body == target:
		target = null