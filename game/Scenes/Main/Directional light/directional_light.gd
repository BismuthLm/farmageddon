extends Node2D

func _ready():
	$".".visible = true
	$AnimationPlayer.play("Time")
	
func _process(_delta):
	if Globals.time_of_day == 5:
		$AnimationPlayer.play("Time")
		Globals.day = true
	
	if Globals.time_of_day == 19:
		$AnimationPlayer.play_backwards("Time")
		Globals.day = false
