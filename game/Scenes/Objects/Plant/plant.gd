extends Node2D

var mouse_entered: bool = false
var time_planted: int = 0
var planted: bool = false


func _process(_delta):
	if Input.is_action_pressed("click") and mouse_entered == true and planted == false:
		time_planted = Globals.time_of_day - 1
		planted = false

func _on_area_2d_mouse_entered():
	mouse_entered = true
	
	
#plus one
