extends Node2D

var mouse_entered: bool = false
var time_planted: int = 0
var time_since_planted: int = 0
var planted: bool = false
var growing: bool = false
var grown: bool = false

func _ready():
	$AnimationPlayer.play("Nothing")
	Globals.connect("time_change", time_of_day_change)
	time_of_day_change()

func _process(_delta):
	if Input.is_action_pressed("click") and mouse_entered == true and planted == false:
		time_planted = Globals.time_of_day - 1
		planted = true
		$AnimationPlayer.play("Carrot Seeds")
	else:
		print("Cannot plant here plant is already here")
	if time_since_planted == time_planted:
		grown = true

func _on_area_2d_mouse_entered():
	mouse_entered = true
	

func _on_area_2d_mouse_exited():
	mouse_entered = false


func _on_delay_timer_timeout():
	time_planted += 1
	growing = true
	
func time_of_day_change():
	if planted == true:
		time_since_planted += 1
