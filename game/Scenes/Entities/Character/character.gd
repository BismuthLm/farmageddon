extends CharacterBody2D

var max_speed: int = 375
var speed: int = max_speed

func _ready():
	$PointLight2D.energy = 1

#Player iliumination
func _process(_delta):
	if $PointLight2D.energy < 1 and Globals.day == false:
		#$PointLight2D.energy += 0.005
		$PointLight2D.energy = 1
	if $PointLight2D.energy > 0 and Globals.day == true:
		#$PointLight2D.energy -= 0.01
		$PointLight2D.energy = 0

	#Input for movement
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	Globals.player_pos = global_position

	#if Input.is_action_pressed("left"):
		#$AnimationPlayer.play("Walking Left")
		#
	##If walking left input is released then it pauses on a standing still frame
	#if Input.is_action_just_released("left"): 
		#$AnimationPlayer.pause()
		#$AnimationPlayer.seek(0.2, true)
		#
	#if Input.is_action_pressed("right"):
		#$AnimationPlayer.play("Walking Right")
		#
	##If walking right input is released then it pauses on a standing still frame
	#if Input.is_action_just_released("right"):
		#$AnimationPlayer.pause()
		#$AnimationPlayer.seek(0.2, true)
		#
	#if Input.is_action_pressed("up") and not Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		#$AnimationPlayer.play("Walking Backwards")
		#
	##If walking backward input is released then it pauses on a standing still frame
	#if Input.is_action_just_released("up"):
		#$AnimationPlayer.pause()
		#$AnimationPlayer.seek(0.2, true)
		#
	#if Input.is_action_pressed("down") and not Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		#$AnimationPlayer.play("Walking Forward")
		#
	##If walking forward input is released then it pauses on a standing still frame
	#if Input.is_action_just_released("down"):
		#$AnimationPlayer.pause()
		#$AnimationPlayer.seek(0.4, true)
		#
	if velocity.x == -375:
		$AnimationPlayer.play("Walking Left")
	if velocity.x == 375:
		$AnimationPlayer.play("Walking Right")
		
	if velocity.y == -375:
		$AnimationPlayer.play("Walking Backwards")
	if velocity.y == 375:
		$AnimationPlayer.play("Walking Forward")
		
	if velocity.x != -375 and velocity.x < 0:
		$AnimationPlayer.play("Walking Left")
	if velocity.x != 375 and velocity.x >0:
		$AnimationPlayer.play("Walking Right")

	if velocity.x == 0 and velocity.y == 0:
		$AnimationPlayer.pause()
		$AnimationPlayer.seek(0.2, true)
		
	if Input.is_action_just_released("down"):
		$AnimationPlayer.pause()
		$AnimationPlayer.seek(0.4, true)
#If the mouse is inside the area of interactability it lets you interact with things and if the mouse is outside the area of interactability you can't interact with things
func _on_interactable_area_mouse_entered():
	Globals.interactable = true

func _on_interactable_area_mouse_exited():
	Globals.interactable = false
