class_name Speed extends Area3D

@export var boost:int=4


func _on_body_entered(body: Node3D) -> void:
	if body is RigidBody3D:
		body.move_speed*=boost


func _on_body_exited(body: Node3D) -> void:
	if body is RigidBody3D:
		body.move_speed=body.real_speed
