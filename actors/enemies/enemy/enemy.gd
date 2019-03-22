extends KinematicBody2D

export(int) var damage = 20
var look_direction = Vector2(-1, 0)
var move_direction = Vector2(-1, 0)
onready var health = $Health

func update_look_direction(direction):
	look_direction = direction

func update_move_direction(direction):
	move_direction = direction

func take_damage(amount):
	health.take_damage(amount)

func set_dead(value):
	set_process_input(not value)
	set_physics_process(not value)
	$CollisionShape2D.disabled = value
	$AnimationPlayer.play("dead")
	$DamageZone/CollisionShape2D.disabled = value
	$DeathTime.start()

func _on_DeathTime_timeout():
	queue_free()


func _on_DamageZone_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
		set_dead(true)
