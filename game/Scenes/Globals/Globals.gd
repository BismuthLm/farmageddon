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

#How many beetroots and carrots you have in your inventory
var beetroot_amount: int = 2
var carrot_amount: int = 2

#Amount of Gold you have
var gold_amount: int = 10

#If you are able to interact with things
var interactable: bool = false

#If true the cash stand ui opens
var cash_stand: bool = false

var player_health: int = 5

#True means it is day false means it is night
var day: bool = false

var dead: bool = false
