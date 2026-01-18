extends Node3D
@onready var timerlabel: Timer = $Timerlabel
@onready var label_timer: Label = $Camera3D/LabelTimer/LabelTimer
@onready var timer_player: Timer = $Camera3D/TimerPlayer




func _ready() -> void:
	if GlobalR.is_race_start:
		timerlabel.start()
		await timerlabel.timeout
		timer_player.start()
	

func _on_timer_timeout() -> void:
	GlobalR.is_race_start=false

func _process(delta: float) -> void:
	if GlobalR.is_race_start:
		label_timer.text=str(int(timerlabel.time_left))
	else: 
		label_timer.text=str(int(GlobalR.time_race))


func _on_timer_player_timeout() -> void:
	GlobalR.time_race+=1
