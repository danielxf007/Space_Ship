extends KinematicBody2D
signal dead()
var look_direction = Vector2(1, 0)
var move_direction = Vector2()
onready var health = $Health

func update_look_direction(direction):
	look_direction = direction

func update_move_direction(direction):
	move_direction = direction

func take_damage(amount):
	health.take_damage(amount)

func set_dead(value):
	set_physics_process(not value)
	$CollisionShape2D.disabled = value
	$AnimationPlayer.play("dead")
	$InputHandler.desactivate_input()
	$DeathTime.start()
	emit_signal("dead")

func _on_DeathTime_timeout():
	pass
