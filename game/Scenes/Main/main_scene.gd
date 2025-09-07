extends Node2D

func _on_hour_timer_timeout():
	#If time of day is smaller than 24 then it adds one to it
	if Globals.time_of_day < 24:
		Globals.time_of_day += 1
	else:
		#Otherwise it changes it to 1
		Globals.time_of_day = 1
	$HourTimer.start()
	print(Globals.time_of_day)

#When sleeping
func _process(_delta):
	#If time of day is bigger or equal to 20 then sleeping is equal to true and time of day is set to 6
	if Globals.sleeping == true:
		if Globals.time_of_day >= 20:
			Globals.sleeping = false
			Globals.time_of_day = 6
			$HourTimer.start()
			print("Sleeping")
			print(Globals.time_of_day)
		else:
			print("You Cannot Sleep Yet")
			
			
	if Input.is_action_just_released("scroll down"):
		if Globals.plant_selected == 0:
			Globals.plant_selected = 1
			print("Plant selected is Carrot")

	if Input.is_action_just_released("scroll up"):
		if Globals.plant_selected == 1:
			Globals.plant_selected = 0
			print("Plant selected is Beetroot")
