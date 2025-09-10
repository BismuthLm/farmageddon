extends Node2D





func _on_door_area_entered(area):
	if area in get_tree().get_nodes_in_group("Character"):
		Globals.carrot_amount = 2
		Globals.beetroot_amount = 0
		TransitionLayer.change_scene("res://Scenes/Main/Level/level.tscn")
