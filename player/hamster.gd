extends Node3D

@onready var ball: RigidBody3D = $"../hamster_ball"
@export var rotation_speed := 5.0  # Speed at which hamster rotates to follow movement

var target_rotation := 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	# Update position to match ball
	global_position = ball.global_position
	
	# Get horizontal velocity for rotation calculation
	var horizontal_velocity = Vector2(ball.linear_velocity.x, ball.linear_velocity.z)
	
	# Only rotate if we're actually moving
	if horizontal_velocity.length() > 0.1:
		# Calculate target rotation based on movement direction
		target_rotation = atan2(horizontal_velocity.y, horizontal_velocity.x) - PI/2
		var current_rotation = wrapf(rotation.y, -PI, PI)
		var shortest_angle = wrapf(target_rotation - current_rotation, -PI, PI)
		
		# Smoothly rotate to face movement direction
		rotation.y += shortest_angle * rotation_speed * delta
