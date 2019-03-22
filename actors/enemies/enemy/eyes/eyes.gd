extends Node2D

export (int) var detect_radius = 100
var vis_color = Color(.867, .91, .247, 0.1)
var laser_color = Color(1.0, .329, .298)
var target = null

func _ready():
	var shape = CircleShape2D.new()
	shape.radius = detect_radius
	var visibility = owner.get_node("Visibility")
	visibility.get_node("CollisionShape2D").shape = shape


func _on_Visibility_body_entered(body):
	if target != null or body.name != "Player":
		return
	target = body

func _on_Visibility_body_exited(body):
	if body == target:
		target = null