extends Node2D

var mouse_entered: bool = false
var time_planted: int = 0
var time_since_planted: int = 0
var planted: bool = false
var grown: bool = false
var plant_planted: int = 0
var harvested: bool = false

func _ready():
	$AnimationPlayer.play("Nothing")

func _process(_delta):
	if Input.is_action_just_pressed("left click") and mouse_entered == true and planted == false and Globals.time_of_day < 20 and Globals.time_of_day > 5:
		time_planted = Globals.time_of_day - 1
		planted = true
		
		if Globals.plant_selected == 0:
			$AnimationPlayer.play("Beetroot Seeds")
			plant_planted = 0
			print("Plant Planted is Beetroot")
			
		if Globals.plant_selected == 1:
			$AnimationPlayer.play("Carrot Seeds")
			plant_planted = 1
			print("Plant planted is Carrot")
		
	if Input.is_action_just_pressed("left click") and mouse_entered == true and planted == true and Globals.time_of_day < 20 and Globals.time_of_day > 5:
		print("Cannot plant here, plant is already here")
		
	if Input.is_action_just_pressed("left click") and mouse_entered == true and planted == true and Globals.time_of_day > 19 and Globals.time_of_day < 6:
		print("It is too late in the day to plant")
		
		
		
	if plant_planted == 0 and grown == false and Globals.sleeping == true:
		$AnimationPlayer.play("Beetroot Sprout")
		
	if plant_planted == 1 and grown == false and Globals.sleeping == true:
		$AnimationPlayer.play("Carrot Sprout")
		
	if plant_planted == 0 and grown == false and Globals.time_of_day == 5:
		$AnimationPlayer.play("Beetroot Sprout")
		
	if plant_planted == 1 and grown == false and Globals.time_of_day == 5:
		$AnimationPlayer.play("Carrot Sprout")
		
		
	if plant_planted == 0 and Globals.time_of_day == time_planted and grown == false:
		$AnimationPlayer.play("Beetroot Grown")
		grown = true
		print("Beetroot Grown")
	
	if plant_planted == 1 and Globals.time_of_day == time_planted and grown == false:
		$AnimationPlayer.play("Carrot Grown")
		grown = true
		print("Carrot Grown")
		
		
	if Input.is_action_just_pressed("right click") and mouse_entered == true and grown == true:
		time_planted = 0
		time_since_planted = 0
		planted = false
		grown = false
		
		harvested = true
		#Plus 3 carrots or 5 beetroots into the inventory
		#Set harvested to false
		
func _on_area_2d_mouse_entered():
	mouse_entered = true
	

func _on_area_2d_mouse_exited():
	mouse_entered = false


func _on_delay_timer_timeout():
	time_planted += 1
	
