extends RigidBody3D

@export var move_speed := 10.0
@export var jump_force := 5.0

@onready var camera_rig: Node3D = $"../CameraRig"

func _physics_process(delta: float) -> void:
	# Get camera's forward and right vectors, but ignore Y component for ground movement
	var camera_basis = camera_rig.global_transform.basis
	var forward = -camera_basis.z
	forward.y = 0
	forward = forward.normalized()
	
	var right = camera_basis.x
	right.y = 0
	right = right.normalized()
	
	# Get input direction
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	
	# Calculate movement direction relative to camera
	var movement = (forward * -input_dir.y + right * input_dir.x).normalized()
	
	if movement:
		# Apply force in the movement direction
		apply_central_force(movement * move_speed)
	
	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor_raycast():
		apply_central_impulse(Vector3.UP * jump_force)

func is_on_floor_raycast() -> bool:
	var space = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(global_position, global_position + Vector3.DOWN * 1.1)
	query.exclude = [self]
	return space.intersect_ray(query).size() > 0
