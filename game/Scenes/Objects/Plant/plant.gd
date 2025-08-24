extends Node2D

var mouse_entered: bool = false
var time_planted: int = 0
var time_since_planted: int = 0
var planted: bool = false
var grown: bool = false
var plant_planted: int = 9

func _ready():
	$AnimationPlayer.play("Nothing")

func _process(_delta):
	if Input.is_action_just_pressed("left click") and mouse_entered == true and Globals.interactable == true and planted == false:
		time_planted = Globals.time_of_day - 1
		planted = true
		
		if Globals.plant_selected == 0 and Globals.beetroot_amount > 0:
			$AnimationPlayer.play("Beetroot Seeds")
			$DelayTimer.start()
			plant_planted = 0
			Globals.beetroot_amount -= 1
			print("Plant Planted is Beetroot")
			
		elif Globals.plant_selected == 0 and Globals.beetroot_amount == 0:
			print("No beetroots left to plant")
			time_planted = 0
			planted = false
			
		if Globals.plant_selected == 1 and Globals.carrot_amount > 0:
			$AnimationPlayer.play("Carrot Seeds")
			$DelayTimer.start()
			plant_planted = 1
			Globals.carrot_amount -= 1
			print("Plant planted is Carrot")
			
		elif Globals.plant_selected == 1 and Globals.carrot_amount == 0:
			print("No carrots left to plant")
			time_planted = 0
			planted = false
		
	if Input.is_action_just_pressed("left click") and mouse_entered == true and Globals.interactable == true and planted == true:
		print("Cannot plant here, plant is already here")
		
		
		
		
	if plant_planted == 0 and grown == false and Globals.sleeping == true and planted == true:
		$AnimationPlayer.play("Beetroot Sprout")
		
	if plant_planted == 1 and grown == false and Globals.sleeping == true and planted == true:
		$AnimationPlayer.play("Carrot Sprout")
		
	if plant_planted == 0 and grown == false and Globals.time_of_day == 5 and planted == true:
		$AnimationPlayer.play("Beetroot Sprout")
		
	if plant_planted == 1 and grown == false and Globals.time_of_day == 5 and planted == true:
		$AnimationPlayer.play("Carrot Sprout")
		
		
	if plant_planted == 0 and Globals.time_of_day == time_planted and grown == false:
		$AnimationPlayer.play("Beetroot Grown")
		grown = true
		print("Beetroot Grown")
	
	if plant_planted == 1 and Globals.time_of_day == time_planted and grown == false:
		$AnimationPlayer.play("Carrot Grown")
		grown = true
		print("Carrot Grown")
		
		
	if Input.is_action_just_pressed("right click") and mouse_entered == true and Globals.interactable == true and grown == true:
		
		if plant_planted == 0:
			Globals.beetroot_amount += 5
			print("Beetroot Harvested")
			
		if plant_planted == 1:
			Globals.carrot_amount += 3
			print("Carrot Harvested")
		
		
		time_planted = 0
		time_since_planted = 0
		planted = false
		grown = false
		$AnimationPlayer.play("Nothing")
		
func _on_area_2d_mouse_entered():
	mouse_entered = true
	

func _on_area_2d_mouse_exited():
	mouse_entered = false


func _on_delay_timer_timeout():
	time_planted += 1
	
