extends CharacterBody2D


@export var max_speed: int = 325
var speed: int = max_speed

func _process(_delta):
	
	#Input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	Globals.player_pos = global_position
	
	#walking diagonally needed
	if Input.is_action_pressed("left"):
		$AnimationPlayer.play("Walking Left")
		
	if Input.is_action_just_released("left"):
		$AnimationPlayer.pause()
		$AnimationPlayer.seek(0.2, true)
		
		
	if Input.is_action_pressed("right"):
		$AnimationPlayer.play("Walking Right")
		
	if Input.is_action_just_released("right"):
		$AnimationPlayer.pause()
		$AnimationPlayer.seek(0.2, true)
		
		
	if Input.is_action_pressed("up") and not Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		$AnimationPlayer.play("Walking Backwards")
		
	if Input.is_action_just_released("up"):
		$AnimationPlayer.pause()
		$AnimationPlayer.seek(0.2, true)
		
		
	if Input.is_action_pressed("down") and not Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		$AnimationPlayer.play("Walking Forward")
		
	if Input.is_action_just_released("down"):
		$AnimationPlayer.pause()
		$AnimationPlayer.seek(0.4, true)
