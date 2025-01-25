class_name Goal extends Area3D

func _on_body_entered(body: Node3D) -> void:
	if body.name=="hamster_ball":
		if !body.is_player_two:
			player_1_lap()
		else:
			player_2_lap()
		
func _on_body_exited(body: Node3D) -> void:
	pass

func player_1_lap():
	print("P1 LAP")
	
func player_2_lap():
	print("P2 LAP")
	
