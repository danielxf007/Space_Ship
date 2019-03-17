extends Sprite

export(float) var speed = 0.0
export(Vector2) var move_direction = Vector2()
onready var game_screen_size = get_viewport().size
onready var image_size = self.texture.get_size()

func move(delta):
	if not out_of_screen_view():
		var velocity = move_direction * speed
		global_position = global_position + (velocity * delta)
	else:
		queue_free()

func out_of_screen_view():
	return global_position.x + (image_size.x / 2) < 0