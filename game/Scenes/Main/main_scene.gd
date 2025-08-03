extends Node2D

signal plant_sleep

var plant_scene: PackedScene = preload("res://Scenes/Objects/Plant/plant.tscn")

func _ready():

		
		var pos = $"Plant Markers/PlantMarker".position
		var plant = plant_scene.instantiate() as Node2D
		plant.global_position = pos
		$Plants.add_child(plant)
		
		pos = $"Plant Markers/PlantMarker2".position
		plant = plant_scene.instantiate() as Node2D
		plant.global_position = pos
		$Plants.add_child(plant)




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
