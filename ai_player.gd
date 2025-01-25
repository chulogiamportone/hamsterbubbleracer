extends RigidBody3D

@export var move_speed := 1
@export var jump_force := 8.0
@export var max_velocity := 0
@export var target_node_path: NodePath
@export var detection_range := 20.0
@export var prediction_factor := 1.5

@onready var camera_rig: Node3D = $CameraRig
var target: Node3D

func _ready() -> void:
	camera_rig.top_level = true
	camera_rig.global_position = global_position
	if not target_node_path.is_empty():
		target = get_node(target_node_path)

func _physics_process(delta: float) -> void:
	camera_rig.global_position = global_position
	
	if not target:
		return
		
	var distance_to_target = global_position.distance_to(target.global_position)
	
	if distance_to_target > detection_range:
		return
		
	# Predict target's future position based on its velocity
	var predicted_pos = target.global_position
	if target is RigidBody3D:
		predicted_pos += target.linear_velocity * prediction_factor
	
	# Calculate direction to target
	var direction = (predicted_pos - global_position).normalized()
	direction.y = 0
	
	# Apply movement force
	apply_central_force(direction * move_speed)
	
	# Limit velocity
	var current_velocity = linear_velocity
	if current_velocity.length() > max_velocity:
		linear_velocity = current_velocity.normalized() * max_velocity
	
	# Jump if target is higher and we're on the ground
	if target.global_position.y > global_position.y + 1.0 and is_on_floor_raycast():
		apply_central_impulse(Vector3.UP * jump_force)

func is_on_floor_raycast() -> bool:
	var space = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(global_position, global_position + Vector3.DOWN * 1.1)
	query.exclude = [self]
	return space.intersect_ray(query).size() > 0
