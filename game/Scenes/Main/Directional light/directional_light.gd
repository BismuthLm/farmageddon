extends Node2D


func _ready():
	$AnimationPlayer.play("Time")
	$".".visible = true

func _process(_delta):
	if Globals.time_of_day == 6:
		$AnimationPlayer.play("Time")
