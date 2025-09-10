extends Node2D

var mouse_entered_restart: bool = false

func _process(_delta):
	if Input.is_action_just_pressed("left click") and mouse_entered_restart == true:
		Globals.carrot_amount = 2
		Globals.beetroot_amount = 0
		Globals.time_of_day = 6
		Globals.player_health = 5
		TransitionLayer.change_scene("res://Scenes/Main/Level/level.tscn")


func _on_restart_button_mouse_entered():
	mouse_entered_restart = true


func _on_restart_button_mouse_exited():
	mouse_entered_restart = false
