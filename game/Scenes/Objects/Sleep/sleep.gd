extends Area2D

signal sleep


func _on_body_entered(_body):
	sleep.emit()
