extends Node2D

var mouse_entered: bool = false
var time_planted: int = 0
var time_since_planted: int = 0
var planted: bool = false
var growing: bool = false
var grown: bool = false
var plant_planted: int = 0

func _ready():
	$AnimationPlayer.play("Nothing")

func _process(_delta):
	if Input.is_action_just_pressed("click") and mouse_entered == true and planted == false:
		time_planted = Globals.time_of_day - 1
		planted = true
		
		if Globals.plant_selected == 0:
			$AnimationPlayer.play("Beetroot Seeds")
			plant_planted = 0
			
		if Globals.plant_selected == 1:
			$AnimationPlayer.play("Carrot Seeds")
			plant_planted = 1
		
	if Input.is_action_just_pressed("click") and mouse_entered == true and planted == true:
		print("Cannot plant here, plant is already here")

	if Globals.time_of_day == time_planted:
		grown = true
		
		if plant_planted == 0:
			$AnimationPlayer.play("Beetroot Grown")
			
		if plant_planted == 1:
			$AnimationPlayer.play("Carrot Grown")
			
		print("Plant Grown")

func _on_area_2d_mouse_entered():
	mouse_entered = true
	

func _on_area_2d_mouse_exited():
	mouse_entered = false


func _on_delay_timer_timeout():
	time_planted += 1
	growing = true
	

func _on_main_scene_plant_sleep():
	if plant_planted == 0 and grown == false:
		$AnimationPlayer.play("Beetroot Sprout")
		
	if plant_planted == 1 and grown == false:
		$AnimationPlayer.play("Carrot Sprout")
