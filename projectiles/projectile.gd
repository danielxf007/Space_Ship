extends KinematicBody2D

export(float) var speed = 0.0
export(float) var push_force = 0.0 
export(int) var damage = 0
var move_direction = Vector2() setget set_move_direction
var player_camera = null setget set_player_camera

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
			pass
		$AnimationPlayer.play("hit")
		$AnimationTimer.start()
		set_physics_process(false)

func is_outside_view_bounds():
	var out_x_bound = global_position.x > player_camera.global_position.x + OS.get_screen_size().x / 2 or global_position.x < 0.0
	var out_y_bound = global_position.y > player_camera.global_position.y + OS.get_screen_size().y /2 or global_position.y < 0.0
	return out_x_bound or out_y_bound


func set_move_direction(direction):
	move_direction = direction

func set_player_camera(camera):
	player_camera = camera

func _on_AnimationTimer_timeout():
	queue_free()
