class_name Player extends RigidBody3D

@export var move_speed := 20
@export var jump_force := 8.0
@export var camera_rotation_speed := 1.1 
@export var max_velocity := 60
@export var is_player_two :bool=false

@onready var camera_rig: Node3D = $CameraRig

var real_speed = 0

func _ready() -> void:
	camera_rig.top_level = true
	camera_rig.global_position = global_position
	real_speed=move_speed

func _physics_process(delta: float) -> void:
	camera_rig.global_position = global_position
	if is_player_two:
		if Input.is_action_pressed("move_left2"):  
			camera_rig.rotate_y(deg_to_rad(camera_rotation_speed)) 
		if Input.is_action_pressed("move_right2"): 
			camera_rig.rotate_y(deg_to_rad(-camera_rotation_speed))  
	else:
		if Input.is_action_pressed("move_left"):  
			camera_rig.rotate_y(deg_to_rad(camera_rotation_speed)) 
		if Input.is_action_pressed("move_right"): 
			camera_rig.rotate_y(deg_to_rad(-camera_rotation_speed)) 
	
	var camera_basis = camera_rig.global_transform.basis
	var forward = -camera_basis.z
	forward.y = 0
	forward = forward.normalized()
	
	var right = camera_basis.x
	right.y = 0
	right = right.normalized()
	var input_dir=null
	if is_player_two:
		input_dir = Input.get_vector("move_left2", "move_right2", "move_forward2", "move_backward2")
	else:
		input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
		
	var movement = (forward * -input_dir.y + right * input_dir.x).normalized()
	
	if movement:
		apply_central_force(movement * move_speed)
	
	var current_velocity = linear_velocity
	if current_velocity.length() > max_velocity:
		linear_velocity = current_velocity.normalized() * max_velocity
	
	if Input.is_action_just_pressed("jump") and is_on_floor_raycast() and !is_player_two:
		apply_central_impulse(Vector3.UP * jump_force)
	if Input.is_action_just_pressed("jump2") and is_on_floor_raycast() and is_player_two:
		apply_central_impulse(Vector3.UP * jump_force)

func is_on_floor_raycast() -> bool:
	var space = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(global_position, global_position + Vector3.DOWN * 1.1)
	query.exclude = [self]
	return space.intersect_ray(query).size() > 0
