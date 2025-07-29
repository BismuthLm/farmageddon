extends Node2D

var mouse_entered: bool = false
var time_planted: int = 0
var time_since_planted: int = 0
var planted: bool = false
var growing: bool = false


func _process(_delta):
	if Input.is_action_pressed("click") and mouse_entered == true and planted == false:
		time_planted = Globals.time_of_day - 1
		planted = false

func _on_area_2d_mouse_entered():
	mouse_entered = true
	

func _on_area_2d_mouse_exited():
	mouse_entered = false


func _on_delay_timer_timeout():
	time_planted += 1
	growing = true
	

