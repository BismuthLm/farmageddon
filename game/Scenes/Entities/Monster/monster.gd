extends CharacterBody2D

var max_speed: int = 250
var speed: int = max_speed

var move: bool = true


func _process(_delta):
	if move == true:
		$AnimationPlayer.play("Monster walking right")
		var direction: Vector2 = (Globals.player_pos - position).normalized()
		print(direction)
		velocity = direction * speed
		move_and_slide()
	elif move == false:
		$AnimationPlayer.play("Monster bite")


func _on_area_2d_area_entered(area):
	if area in get_tree().get_nodes_in_group('Monster Stop'):
		move = false


func _on_area_2d_area_exited(area):
	if area in get_tree().get_nodes_in_group('Monster Stop'):
		move = true
	
