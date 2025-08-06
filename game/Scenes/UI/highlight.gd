extends Node2D

@onready var plants = get_tree().get_nodes_in_group("Plants")
@onready var nearestPlant = plants[0]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var mousePos = get_global_mouse_position()
	
	for n in plants:
		if n.global_position.distance_to(mousePos) < nearestPlant.global_position.distance_to(mousePos):
			nearestPlant = n
	
	position.x = nearestPlant.global_position.x
	position.y = nearestPlant.global_position.y
	
	if nearestPlant.global_position.distance_to(mousePos) < 100:
		$Sprite2D.visible = true
	else :
		$Sprite2D.visible = false
