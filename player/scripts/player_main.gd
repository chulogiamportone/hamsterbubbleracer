extends Node3D

#@onready var ball_mesh: MeshInstance3D = $hamster_ball/mesh
#@onready var hamster_mesh: Node3D = $hamster
#@onready var hamster_ball = $hamster_ball
#
#@export var player_1_sphere: Material
#@export var player_2_sphere: Material
#@export var player_1_hamster: Material
#@export var player_2_hamster: Material
#
#func _ready() -> void:
	#if hamster_ball.is_player_two:
		#ball_mesh.material_override = player_2_sphere
		## Assuming the hamster model has a mesh named "Cube" as seen in the player.tscn
		#var hamster_body = hamster_mesh.get_node("Armature/Skeleton3D/Cube")
		#if hamster_body:
			#hamster_body.material_override = player_2_hamster
	#else:
		#ball_mesh.material_override = player_1_sphere
		#var hamster_body = hamster_mesh.get_node("Armature/Skeleton3D/Cube")
		#if hamster_body:
			#hamster_body.material_override = player_1_hamster
