extends CharacterBody2D

func _ready():
	for child in get_children():
		if child.has_node("AnimationPlayer"):
			var anim_player = child.get_node("AnimationPlayer")
			anim_player.play("rueda")
			anim_player.play("hamster_run")
