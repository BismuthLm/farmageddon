extends Node2D





func _on_door_area_entry_area_entered(area):
	if area in get_tree().get_nodes_in_group("Character"):
		$"HouseTop".visible = false
		$"HouseBottom".visible = false
		$Inside.visible = true


func _on_door_area_exit_area_entered(area):
	if area in get_tree().get_nodes_in_group("Character"):
		$"HouseTop".visible = true
		$"HouseBottom".visible = true
		$Inside.visible = false
