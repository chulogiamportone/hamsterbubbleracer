class_name Winner extends Control
@onready var player_img: TextureRect = $TextureRect/TextureRect/PlayerImg
@onready var label_winner: Label = $TextureRect/TextureRect/PlayerImg/TextureRect/LabelWinner
@onready var label_time: Label = $TextureRect/TextureRect/PlayerImg/TextureRect/LabelTime



func _ready() -> void:
	print(GlobalR.winner)
	if GlobalR.winner:
		player_img.texture=preload("res://Assets/h/HAMSTER NEGRO1.png")
		label_winner.text="Player 2 Winner"
	else:
		player_img.texture=preload("res://Assets/h/HAMSTER MARRON1.png")
		label_winner.text="Player 1 Winner"
	label_time.text="RECORD "+str(GlobalR.time_player)+" seg"
	
func _on_texture_button_pressed() -> void:
	GlobalR.time_player=0
	GlobalR.time_race=0
	get_tree().change_scene_to_file("res://scenes/Menu.tscn")
