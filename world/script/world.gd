extends Node3D
@onready var timer: Timer = $Timer
@onready var label_timer: Label = $Camera3D/LabelTimer/LabelTimer

func _ready() -> void:
	if GlobalR.is_race_start:
		timer.start()
		await timer.timeout
	


func _on_timer_timeout() -> void:
	GlobalR.is_race_start=false

func _process(delta: float) -> void:
	if GlobalR.is_race_start:
		label_timer.text=str(int(timer.time_left))
	else: 
		label_timer.text=""
