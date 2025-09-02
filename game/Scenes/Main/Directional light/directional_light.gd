extends Node2D

func _ready():
	$".".visible = true
	$AnimationPlayer.play("Time")
	await $AnimationPlayer.animation_finished
	Globals.day = true
	
func _process(_delta):
	if Globals.time_of_day == 5:
		$AnimationPlayer.play("Time")
		await $AnimationPlayer.animation_finished
		Globals.day = true
	
	if Globals.time_of_day == 19:
		$AnimationPlayer.play_backwards("Time")
		await $AnimationPlayer.animation_finished
		Globals.day = false
