extends Node3D

@export var mouse_sensitivity := 0.005
@export var min_elevation := -0.5
@export var max_elevation := 1.0
@export var camera_distance := 4
@export var follow_speed := 10.0
@export var rotation_speed := 5.0  # Speed at which camera rotates to follow ball

@onready var camera: Camera3D = $Camera3D
@onready var ball: RigidBody3D = $"../hamster_ball"

var target_rotation := 0.0

func _ready() -> void:
	
	rotation.x = -0.1 
	camera.position.z = camera_distance


func _physics_process(delta: float) -> void:
	var horizontal_velocity = Vector2(ball.linear_velocity.x, ball.linear_velocity.z)
	
	if horizontal_velocity.length() > 0.1: 
		target_rotation = atan2(horizontal_velocity.y, horizontal_velocity.x) - PI/2
		var current_rotation = wrapf(rotation.y, -PI, PI)
		var shortest_angle = wrapf(target_rotation - current_rotation, -PI, PI)
		rotation.y += shortest_angle * rotation_speed * delta
	
	# Smoothly follow the ball's position
	global_position = global_position.lerp(ball.global_position, follow_speed * delta)
