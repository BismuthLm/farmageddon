extends Area2D

signal sleep




func _on_area_entered(_area):
	sleep.emit()
