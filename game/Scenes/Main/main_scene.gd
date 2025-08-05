extends Node2D

signal plant_sleep

var plant_scene: PackedScene = preload("res://Scenes/Objects/Plant/plant.tscn")

func _ready():

		#Instantiating plants at each marker
		var pos = $"Plant Markers/PlantMarker".position
		var plant = plant_scene.instantiate() as Node2D
		plant.global_position = pos
		$Plants.add_child(plant)
		
		pos = $"Plant Markers/PlantMarker2".position
		plant = plant_scene.instantiate() as Node2D
		plant.global_position = pos
		$Plants.add_child(plant)


#Get rid of this:
func _process(_delta):
	if Globals.time_of_day == 25:
		Globals.time_of_day = 1


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
func _on_sleep_sleep():
	#If time of day is bigger or equal to 20 then sleeping is equal to true and time of day is set to 6
	if Globals.time_of_day >= 20:
		Globals.sleeping = true
		Globals.time_of_day = 6
		$HourTimer.start()
		print("Sleeping")
		print(Globals.time_of_day)
	else:
		print("You Cannot Sleep Yet")
