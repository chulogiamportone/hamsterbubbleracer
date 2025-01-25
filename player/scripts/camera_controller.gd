extends Node3D

@export var mouse_sensitivity := 0.005
@export var min_elevation := -0.5
@export var max_elevation := 1.0
@export var camera_distance := 8.0
@export var follow_speed := 10.0

@onready var camera: Camera3D = $Camera3D
@onready var ball: RigidBody3D = $"../hamster_ball"

func _ready() -> void:
	# Capture the mouse
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _physics_process(delta: float) -> void:
	# Smoothly follow the ball's position
	global_position = global_position.lerp(ball.global_position, follow_speed * delta)
	camera.position.z = camera_distance
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		# Vertical rotation (pitch)
		rotation.x -= event.relative.y * mouse_sensitivity
		rotation.x = clamp(rotation.x, min_elevation, max_elevation)
		
		# Horizontal rotation (yaw)
		rotation.y -= event.relative.x * mouse_sensitivity
		
	# Press Escape to free the mouse
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE) 
