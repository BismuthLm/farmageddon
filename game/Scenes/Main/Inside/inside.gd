extends Node2D

func _on_sleep_sleep():
	#If time of day is bigger or equal to 20 then sleeping is equal to true and time of day is set to 6
	if Globals.time_of_day >= 20:
		Globals.sleeping = true
		Globals.time_of_day = 6
		$HourTimer.start()
