extends StaticBody2D

signal player_entered_house()





func _on_area_2d_area_entered(area):
	if area in get_tree().get_nodes_in_group('Character'):
		player_entered_house.emit()
		TransitionLayer.change_scene("res://Scenes/Main/Inside/inside.tscn")
