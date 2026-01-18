extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var label: Label = $Label

func _ready() -> void:
	animation_player.play("main_title")
	$VBoxContainer/Jugar.pressed.connect(_on_jugar_pressed)
	$VBoxContainer/Creditos.pressed.connect(_on_creditos_pressed) 
	$VBoxContainer/Salir.pressed.connect(_on_salir_pressed)


func _on_jugar_pressed() -> void:
	# Change to the game scene
	get_tree().change_scene_to_file("res://scenes/load_scene.tscn")



func _on_creditos_pressed() -> void:
	# Change to credits scene (you'll need to create this scene)
	get_tree().change_scene_to_file("res://Creditos/Creditos.tscn")

func _on_salir_pressed() -> void:
	# Quit the game
	get_tree().quit()
