extends Node

var first_image 
var second_image 

func _ready():
	first_image = $Images.star_field.instace()
	second_image = $Images.star_field.instace()
	positionate_image(first_image)
	positionate_image(second_image)
	$Timer.wait_time = calculate_time_on_screen(first_image)

func _physics_process(delta):
	if $Timer.stop():
		update_background()
	else:
		move_images(delta)

func move_images(delta):
	first_image.move(delta)
	second_image.move(delta)

func calculate_time_on_screen(image):
	var image_speed = image.speed
	var image_tale_position = get_image_tale_position(image)
	var time = image_tale_position / image_speed
	return time

func get_image_tale_position(image):
	var image_size = image.texture.get_size()
	var image_scale = image.scale
	image_size.x = image_size.x * image_scale.x
	image_size.y = image_size.y * image_scale.y
	var image_tale_position = image.global_position + Vector2(image_size.x / 2, 0)
	return image_tale_position

func positionate_first_image(image):
	var game_screen_size = get_viewport().size
	var center = game_screen_size * 0.5
	image.global_position = center

func positionate_second_image(image):
	var game_screen_size = get_viewport().size
	var first_image_size_x = first_image.texture.get_size().x * first_image.scale.x 
	var center = game_screen_size * 0.5
	center.x = center.x + first_image_size_x
	image.global_position = center

func update_background():
	update_first_image()
	update_second_image()
	$Timer.start()

func update_first_image():
	first_image = second_image

func update_second_image():
	second_image = create_image()
	positionate_second_image(second_image)

func create_image():
	return $Images.star_field.instance()

