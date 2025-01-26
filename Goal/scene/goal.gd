class_name Goal extends Area3D
@onready var chek_point_container: Node3D = $"../ChekPointContainer"

func _on_body_entered(body: Node3D) -> void:
	if body.name=="hamster_ball" and body.chekpoint_number==9:
		body.chekpoint_number=0
		player_lap(body)
		body.get_parent().get_parent().get_child(1).get_child(0).text=str(body.get_parent().get_child(0).lap)+"/3"
		

func player_lap(body):
	body.lap+=1


func _on_check_point_body_entered(body: Node3D) -> void:
	
	if body.name=="hamster_ball" :
		if body.chekpoint_number==0:
			body.chekpoint_number+=1
			body.checkpoint_position=body.position


func _on_check_point_2_body_entered(body: Node3D) -> void:
	
	if body.name=="hamster_ball" and body.chekpoint_number==1:
		body.chekpoint_number+=1
		body.checkpoint_position=body.position


func _on_check_point_3_body_entered(body: Node3D) -> void:
	if body.name=="hamster_ball" and body.chekpoint_number==2:
		body.chekpoint_number+=1
		body.checkpoint_position=body.position


func _on_check_point_4_body_entered(body: Node3D) -> void:
	if body.name=="hamster_ball" and body.chekpoint_number==3:
		body.chekpoint_number+=1
		body.checkpoint_position=body.position


func _on_check_point_5_body_entered(body: Node3D) -> void:
	if body.name=="hamster_ball" and body.chekpoint_number==4:
		body.chekpoint_number+=1
		body.checkpoint_position=body.position


func _on_check_point_6_body_entered(body: Node3D) -> void:
	if body.name=="hamster_ball" and body.chekpoint_number==5:
		body.chekpoint_number+=1
		body.checkpoint_position=body.position


func _on_check_point_7_body_entered(body: Node3D) -> void:
	if body.name=="hamster_ball" and body.chekpoint_number==6:
		body.chekpoint_number+=1
		body.checkpoint_position=body.position


func _on_check_point_8_body_entered(body: Node3D) -> void:
	if body.name=="hamster_ball" and body.chekpoint_number==7:
		body.chekpoint_number+=1
		body.checkpoint_position=body.position


func _on_check_point_9_body_entered(body: Node3D) -> void:
	if body.name=="hamster_ball" and body.chekpoint_number==8:
		body.chekpoint_number+=1
		body.checkpoint_position=body.position


func _on_check_point_10_body_entered(body: Node3D) -> void:
	if body.name=="hamster_ball" and body.chekpoint_number==9:
		body.chekpoint_number+=1
		body.checkpoint_position=body.position


func _on_died_body_entered(body: Node3D) -> void:
	if body.chekpoint_number:
		body.position=body.checkpoint_position
