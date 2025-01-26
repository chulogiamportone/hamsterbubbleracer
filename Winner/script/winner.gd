class_name Winner extends Control
@onready var player_img: TextureRect = $TextureRect/TextureRect/PlayerImg
@onready var label_winner: Label = $TextureRect/LabelWinner
@onready var label_time: Label = $TextureRect/LabelTime


func _ready() -> void:
	print(GlobalR.winner)
	if GlobalR.winner:
		player_img.texture=preload("res://assets/HAMSTER NEGRO.png")
		label_winner.text="Winner Playe 2"
	else:
		player_img.texture=preload("res://assets/HAMSTER MARRON.png")
		label_winner.text="Winner Playe 1"
	label_time.text=str(GlobalR.time_player)
	
func _on_texture_button_pressed() -> void:
	GlobalR.time_player=0
	GlobalR.time_race=0
	get_tree().change_scene_to_file("res://world/scenes/level_0.tscn")
