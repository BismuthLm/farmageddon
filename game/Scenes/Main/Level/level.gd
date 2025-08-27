extends Node2D




#makes the inside visible
func _on_door_area_entry_area_entered(area):
	if area in get_tree().get_nodes_in_group("Character"):
		$"House Top".visible = false
		$"house bottom".visible = false
		$Inside.visible = true

#makes the outside visible
func _on_door_area_exit_area_entered(area):
	if area in get_tree().get_nodes_in_group("Character"):
		$"House Top".visible = true
		$"house bottom".visible = true
		$Inside.visible = false
