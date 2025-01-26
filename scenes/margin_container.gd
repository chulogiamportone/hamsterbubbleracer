extends MarginContainer

func _ready():
	for child in get_children():
		if child.has_node("AnimationPlayer"):
			var anim_player = child.get_node("AnimationPlayer")
			
			# Print all available animations to verify names
			print(anim_player.get_animation_list())
			
			# Check if animations exist before playing
			if "rueda" in anim_player.get_animation_list():
				anim_player.play("rueda")
			
			if "hamster_run" in anim_player.get_animation_list():
				anim_player.play("hamster_run")
