extends Node2D

signal plant_sleep

func _on_hour_timer_timeout():
	if Globals.time_of_day <= 23:
		Globals.time_of_day += 1
	else:
		Globals.time_of_day = 1
	$HourTimer.start()
	print(Globals.time_of_day)

func _on_sleep_sleep():
	if Globals.time_of_day >= 20:
		Globals.time_of_day = 6
		$HourTimer.start()
		print("Sleeping")
		print(Globals.time_of_day)
		plant_sleep.emit()
	else:
		print("You Cannot Sleep Yet")
