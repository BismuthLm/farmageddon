extends StaticBody2D





func _on_area_2d_body_entered(body):
	print(body)
	if body in get_tree().get_nodes_in_group('Character'):
		Globals.cash_stand = true



func _on_area_2d_body_exited(body):
	if body in get_tree().get_nodes_in_group('Character'):
		Globals.cash_stand = false


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body in get_tree().get_nodes_in_group('Character'):
		Globals.cash_stand = true
