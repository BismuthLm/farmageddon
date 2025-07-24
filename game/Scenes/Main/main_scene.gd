extends Node2D


#Time of day variable 1 - 24
var time_of_day: int = 24

func _process(_delta):
	if time_of_day == 25:
		time_of_day = 1

func _on_hour_timer_timeout():
	if time_of_day <= 23:
		time_of_day += 1
	else:
		time_of_day = 1
	$HourTimer.start()
	print(time_of_day)

func _on_sleep_sleep():
	if time_of_day >= 20:
		time_of_day = 6
		$HourTimer.start()
		print("Sleeping")
		print(time_of_day)
	else:
		print("You Cannot Sleep Yet")
