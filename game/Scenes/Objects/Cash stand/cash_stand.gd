extends StaticBody2D

var cash_stand: bool = false



func _on_area_2d_body_entered(body):
	if body in get_tree().get_nodes_in_group('Character'):
		cash_stand = true
		



func _on_area_2d_body_exited(body):
	if body in get_tree().get_nodes_in_group('Character'):
		cash_stand = false
