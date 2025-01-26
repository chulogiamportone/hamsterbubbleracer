 extends RigidBody3D

@export var animation_speed_threshold := 5.0  # Adjust this value to determine when to play running animation
@onready var hamster_model: Node3D = $hamster  # Adjust this path to match your hamster model node
@onready var animation_player: AnimationPlayer = $hamster/AnimationPlayer  # Adjust path as needed

var previous_velocity := Vector3.ZERO
var current_acceleration := Vector3.ZERO

func _physics_process(delta: float) -> void:
	# Calculate acceleration
	var current_velocity = linear_velocity
	current_acceleration = (current_velocity - previous_velocity) / delta
	previous_velocity = current_velocity
	
	# Get the horizontal speed (ignoring vertical movement)
	var horizontal_speed = Vector2(current_velocity.x, current_velocity.z).length()
	
	# Update animation based on speed
	update_animation(horizontal_speed)

func update_animation(speed: float) -> void:
	if not animation_player:
		return
		
	if speed > animation_speed_threshold:
		if not animation_player.is_playing() or animation_player.current_animation != "run":
			animation_player.play("ArmatureAction_001")
			animation_player.speed_scale = clamp(speed / animation_speed_threshold, 0.5, 2.0)
	else:
		animation_player.stop()
