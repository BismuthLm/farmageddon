extends StaticBody2D

func _on_area_2d_area_entered(area):
	if area in get_tree().get_nodes_in_group('Character'):
		Globals.cash_stand = true

func _on_area_2d_area_exited(area):
	if area in get_tree().get_nodes_in_group('Character'):
		Globals.cash_stand = false
