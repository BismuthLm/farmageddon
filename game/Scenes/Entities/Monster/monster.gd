extends CharacterBody2D

var max_speed: int = 350
var speed: int = max_speed

var move: bool = true


func _process(_delta):
	if Globals.time_of_day > 19 or Globals.time_of_day < 5:
		$".".visible = true
		if move == true:
			$AnimationPlayer.play("Monster walking right")
			var direction: Vector2 = (Globals.player_pos - position).normalized()
			velocity = direction * speed
			move_and_slide()
		elif move == false:
			$AnimationPlayer.play("Monster bite")
	elif Globals.time_of_day < 20 or Globals.time_of_day > 4:
		$".".visible = false


func _on_area_2d_area_entered(area):
	if area in get_tree().get_nodes_in_group('Monster Stop'):
		move = false
		print("monster not moving")


func _on_area_2d_area_exited(area):
	if area in get_tree().get_nodes_in_group('Monster Stop'):
		move = true
	
