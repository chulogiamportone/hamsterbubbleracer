extends Node3D

@onready var hamster_ball = get_parent().get_node("hamster_ball")
@onready var camera: Camera3D = $"../hamster_ball/CameraRig/Camera3D"
@onready var animation_player: AnimationPlayer = $AnimationPlayer


var rotation_speed := 100.0


func _process(delta: float) -> void:
	if hamster_ball:
		global_position = hamster_ball.global_position
		
		var camera_forward = -camera.global_transform.basis.z
		camera_forward.y = 0
		camera_forward = camera_forward.normalized()
		
		var target_rotation = atan2(camera_forward.x, camera_forward.z) - 1.5
		rotation.y = lerp_angle(rotation.y, target_rotation, 0.1)
	
	 # Check if the hamster ball is moving
		var ball_speed = hamster_ball.linear_velocity.length()
		if ball_speed > 0.1:
			if !animation_player.is_playing():
				animation_player.play("ArmatureAction_001")
			# Adjust animation speed based on ball speed
			animation_player.speed_scale = ball_speed / 10.0  # Adjust the divisor to control sensitivity
		else:
			animation_player.stop()
