extends Node2D

func _ready():
	$".".visible = true
	$AnimationPlayer.play("Time")
	
func _process(_delta):
	if Globals.time_of_day == 6 or Globals.time_of_day == 7:
		$AnimationPlayer.play("Time")
