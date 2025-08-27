extends StaticBody2D

func _on_area_2d_area_entered(area):
		if area in get_tree().get_nodes_in_group('Character'):
			if Globals.time_of_day >= 20 or Globals.time_of_day <= 5:
				Globals.sleeping = true
