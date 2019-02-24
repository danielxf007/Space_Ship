extends Position2D

export(String) var current_weapon
var shoot_down_cool_down_timer
var reload_cool_down_timer
var weapon_information
var world
var player_camera

func _ready():
	player_camera = owner.get_node("Camera2D")
	weapon_information = $WeaponInformation
	shoot_down_cool_down_timer = $ShootCoolDown
	reload_cool_down_timer = $ReloadCoolDown
	if not current_weapon in ["weapon_type_one"]:
		change_weapon("weapon_type_one")
	for node in get_tree().get_nodes_in_group("world"):
		world = node 

func shoot():
	if weapon_information.current_bullets_in_carriage[current_weapon] <= 0:
		reload()
		return
	if not reload_cool_down_timer.is_stopped():
		return
	if not shoot_down_cool_down_timer.is_stopped():
		return
	shoot_down_cool_down_timer.start()
	weapon_information.current_bullets_in_carriage[current_weapon] -= 1
	var new_projectile = weapon_information.type_of_bullets[current_weapon].instance()
	new_projectile.global_position = global_position
	new_projectile.add_collision_exception_with(owner)
	new_projectile.set_move_direction(owner.look_direction)
	new_projectile.set_player_camera(player_camera)
	world.add_child(new_projectile)

func reload():
	$ReloadCoolDown.start()
	weapon_information.current_bullets_in_carriage[current_weapon] = weapon_information.weapons_carriage[current_weapon]

func change_weapon(weapon_name):
	current_weapon = weapon_name
	shoot_down_cool_down_timer.wait_time = weapon_information.shoot_cool_down_timers[current_weapon]
	reload_cool_down_timer.wait_time = weapon_information.reload_cool_down_timers[current_weapon]