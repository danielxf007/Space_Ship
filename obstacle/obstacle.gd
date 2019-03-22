extends KinematicBody2D

const MAX_SPEED = 250.0
const MIN_SPEED = 150.0
export(int) var damage = 20
export(float) var move_force = 100.0
var move_direction = Vector2(-1, 0)
var speed = 0.0
onready var health = $Health

func _physics_process(delta):
	move(move_direction, delta)

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

func move(direction, delta):
	calculate_speed(delta)
	var velocity = direction * speed
	move_and_slide(velocity)
	outside_view_bounds_enemy()

func calculate_speed(delta):
	speed += move_force * delta
	if speed > MAX_SPEED:
		speed = MAX_SPEED
	if speed < MIN_SPEED:
		speed = MIN_SPEED

func outside_view_bounds_enemy():
	var game_screen = get_viewport().size
	var enemy_position = global_position
	var enemy_body_scale = get_node("Body").scale 
	var enemy_size = get_node("Body").texture.get_size()
	enemy_size.y = enemy_size.y * enemy_body_scale.y
	enemy_size.x = enemy_size.x * enemy_body_scale.x
	if enemy_position.y + enemy_size.y / 2 > game_screen.y:
		global_position.y = game_screen.y - enemy_size.y / 2
	if enemy_position.y - enemy_size.y / 2 < 0:
		global_position.y = enemy_size.y / 2
	if enemy_position.x + enemy_size.x / 2 < 0:
		set_physics_process(false)
		queue_free()