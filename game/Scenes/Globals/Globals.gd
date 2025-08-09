extends Node


var player_pos

#Time of day variable 1 - 24
var time_of_day: int = 6

#Each plant has a different value when selected
#Beetroot = 0
#Carrot = 1
var plant_selected: int = 1

#Is set true for a small amount of time when sleeping
var sleeping = false


var beetroot_amount: int = 2
var carrot_amount: int = 2
