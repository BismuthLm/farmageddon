extends CharacterBody2D

var max_speed: int = 400
var speed: int = max_speed
var hit: bool = true

var move: bool = true

#Monsters movement and visibility relative to the time of day
func _process(_delta):
	if Globals.time_of_day > 19 or Globals.time_of_day < 5:
		$".".visible = true
		$MonsterSound.play(0.0)
		if move == true:
			var direction: Vector2 = (Globals.player_pos - position).normalized()
			velocity = direction * speed
			move_and_slide()
			if direction > Vector2(0,0):
				$AnimationPlayer.play("Monster walking right")
			if direction < Vector2(0,0):
				$AnimationPlayer.play("Monster walking left")
		elif move == false:
			$AnimationPlayer.play("Monster bite")
			if hit == true:
				Globals.player_health -= 1
				hit = false
				$HitTimer.start()
	elif Globals.time_of_day < 20 or Globals.time_of_day > 4:
		$".".visible = false
		$MonsterSound.stop()

#Monster stops moving when touching player
func _on_area_2d_area_entered(area):
	if area in get_tree().get_nodes_in_group('Monster Stop'):
		move = false

func _on_area_2d_area_exited(area):
	if area in get_tree().get_nodes_in_group('Monster Stop'):
		move = true


func _on_hit_timer_timeout():
	hit = true
