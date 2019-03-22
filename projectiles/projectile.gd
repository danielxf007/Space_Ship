extends KinematicBody2D

export(float) var speed = 0.0
export(float) var push_force = 0.0 
export(int) var damage = 0
var move_direction = Vector2(-1, 0) setget set_move_direction

func _ready():
	set_as_toplevel(true)

func _physics_process(delta):
	if is_outside_view_bounds():
		queue_free()
	var velocity = move_direction * speed
	var motion = velocity * delta
	var collision_info = move_and_collide(motion)
	if collision_info:
		var collider = collision_info.collider
		if collider.has_method("take_damage"):
			collider.take_damage(damage)
		$AnimationPlayer.play("hit")
		$AnimationTimer.start()
		set_physics_process(false)

func is_outside_view_bounds():
	pass


func set_move_direction(direction):
	move_direction = direction

func _on_AnimationTimer_timeout():
	queue_free()
