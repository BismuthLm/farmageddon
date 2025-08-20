extends StaticBody2D





func _on_area_2d_area_entered(area):
		if area in get_tree().get_nodes_in_group('Character'):
			Globals.sleeping = true
