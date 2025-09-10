extends Node2D


var mouse_entered_start: bool = false
var mouse_entered_tutorial: bool = false


func _process(_delta):
	if Input.is_action_just_pressed("left click") and mouse_entered_start == true:
		TransitionLayer.change_scene("res://Scenes/Main/Level/level.tscn")
	if Input.is_action_just_pressed("left click") and mouse_entered_tutorial == true:
		TransitionLayer.change_scene("res://Scenes/Main/Tutorial/tutorial.tscn")
	



func _on_start_button_mouse_entered():
	mouse_entered_start = true


func _on_start_button_mouse_exited():
	mouse_entered_start = false


func _on_tutorial_button_mouse_entered():
	mouse_entered_tutorial = true


func _on_tutorial_button_mouse_exited():
	mouse_entered_tutorial = false
