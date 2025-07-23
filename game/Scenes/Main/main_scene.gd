extends Node2D


#Time of day variable 1 - 24
var time_of_day: int = 1


func _on_hour_timer_timeout():
	time_of_day += 1
