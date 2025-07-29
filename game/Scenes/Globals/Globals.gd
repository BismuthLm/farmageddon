extends Node

signal time_change

var player_pos

#Time of day variable 1 - 24
var time_of_day: int = 24:
	set(value):
		time_of_day = value
		time_change.emit()
	
