extends CharacterBody2D


@export var max_speed: int = 500
var speed: int = max_speed

func _process(_delta):
	
	# input 
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	Globals.player_pos = global_position
