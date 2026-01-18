class_name Goal extends Area3D
@onready var chek_point_container: Node3D = $"../ChekPointContainer"
@onready var label_poistion: Label = $"../Camera3D/SubViewportContainer/SubViewportP/Player1_UI/Label_laps1"
@onready var label_poistion_2: Label = $"../Camera3D/SubViewportContainer2/SubViewport2/Player2_UI/Label_laps2"

@onready var hamster_ball: Player = $"../Camera3D/SubViewportContainer/SubViewportP/player1/hamster_ball"
@onready var hamster_ball2: Player = $"../Camera3D/SubViewportContainer2/SubViewport2/player2/hamster_ball"

@onready var texture_rectp_1: TextureRect = $"../Camera3D/SubViewportContainer/SubViewportP/Player1_UI/TextureRectp1"
@onready var texture_rectp_2: TextureRect = $"../Camera3D/SubViewportContainer2/SubViewport2/Player2_UI/TextureRectp2"

@onready var sprite_position_1: TextureRect = $"../Camera3D/SubViewportContainer/SubViewportP/Player1_UI/GridContainer/SpritePosition1"
@onready var sprite_position_2: TextureRect = $"../Camera3D/SubViewportContainer/SubViewportP/Player1_UI/GridContainer/SpritePosition2"

@onready var sprite2_position_1: TextureRect = $"../Camera3D/SubViewportContainer2/SubViewport2/Player2_UI/GridContainer/SpritePosition1"
@onready var sprite2_position_2: TextureRect = $"../Camera3D/SubViewportContainer2/SubViewport2/Player2_UI/GridContainer/SpritePosition2"

@export var timer_for_stop: Timer


var texture_1=preload("res://Assets/uno.png")
var texture_2=preload("res://Assets/dos plata.png")
var players_finished=0

func _on_body_entered(body: Node3D) -> void:
	
	if body.name=="hamster_ball" and body.lap==3:
		body.fin_race=true
		players_finished+=1
	else:
		if body.name=="hamster_ball" and body.chekpoint_number==10:
			body.chekpoint_number=0
			body.lap+=1
			if body.is_player_two:
				label_poistion_2.text=str(body.get_parent().get_child(0).lap)
			else:
				label_poistion.text=str(body.get_parent().get_child(0).lap)
			body.checkpoint_position=body.position
	if players_finished==1:
		GlobalR.winner=body.is_player_two
		GlobalR.time_player=GlobalR.time_race
		timer_for_stop.stop()
		get_tree().change_scene_to_file("res://Winner/scene/winner.tscn")
	if players_finished==2:
		timer_for_stop.stop()
		get_tree().change_scene_to_file("res://Winner/scene/winner.tscn")
		
		
	
func _process(delta: float) -> void:
	
	if hamster_ball.lap>hamster_ball2.lap:
		player_1_first()
	if hamster_ball.lap<hamster_ball2.lap:
		player_2_first()
	if hamster_ball.lap==hamster_ball2.lap:
		if hamster_ball.chekpoint_number>hamster_ball2.chekpoint_number:
			player_1_first()
		if hamster_ball.chekpoint_number<hamster_ball2.chekpoint_number:
			player_2_first()
		if hamster_ball.chekpoint_number==hamster_ball2.chekpoint_number:
			
			var checkpoint
			if hamster_ball.chekpoint_number==0:
				checkpoint=$"../ChekPointContainer/CheckPoint/CollisionShape3D"
			if hamster_ball.chekpoint_number==1:
				checkpoint=$"../ChekPointContainer/CheckPoint2/CollisionShape3D"
			if hamster_ball.chekpoint_number==2:
				checkpoint=$"../ChekPointContainer/CheckPoint3/CollisionShape3D"
			if hamster_ball.chekpoint_number==3:
				checkpoint=$"../ChekPointContainer/CheckPoint4/CollisionShape3D"
			if hamster_ball.chekpoint_number==4:
				checkpoint=$"../ChekPointContainer/CheckPoint5/CollisionShape3D"
			if hamster_ball.chekpoint_number==5:
				checkpoint=$"../ChekPointContainer/CheckPoint6/CollisionShape3D"
			if hamster_ball.chekpoint_number==6:
				checkpoint=$"../ChekPointContainer/CheckPoint7/CollisionShape3D"
			if hamster_ball.chekpoint_number==7:
				checkpoint=$"../ChekPointContainer/CheckPoint8/CollisionShape3D"
			if hamster_ball.chekpoint_number==8:
				checkpoint=$"../ChekPointContainer/CheckPoint9/CollisionShape3D"
			if hamster_ball.chekpoint_number==9:
				checkpoint=$"../ChekPointContainer/CheckPoint10/CollisionShape3D"
			if hamster_ball.chekpoint_number==10:
				checkpoint=$"../Died/CollisionShape3D"
			var p1_distance=abs(hamster_ball.position.distance_to(checkpoint.position))
			var p2_distance=abs(hamster_ball2.position.distance_to(checkpoint.position))
			if p1_distance>p2_distance:
				player_1_first()
			else:
				player_2_first()
			
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
	if body.name=="hamster_ball":
		body.position=body.checkpoint_position

func player_1_first():
	
	texture_rectp_1.texture=texture_1
	texture_rectp_2.texture=texture_2
	sprite_position_1.texture=preload("res://Assets/h/HAMSTER MARRON1.png")
	sprite_position_2.texture=preload("res://Assets/h/HAMSTER NEGRO MAD1.png")
	sprite2_position_1.texture=preload("res://Assets/h/HAMSTER MARRON1.png")
	sprite2_position_2.texture=preload("res://Assets/h/HAMSTER NEGRO MAD1.png")

func player_2_first():
	texture_rectp_2.texture=texture_1
	texture_rectp_1.texture=texture_2
	sprite_position_1.texture=preload("res://Assets/h/HAMSTER NEGRO1.png")
	sprite_position_2.texture=preload("res://Assets/h/HAMSTER MARRON MAD1.png")
	sprite2_position_1.texture=preload("res://Assets/h/HAMSTER NEGRO1.png")
	sprite2_position_2.texture=preload("res://Assets/h/HAMSTER MARRON MAD1.png")


	
