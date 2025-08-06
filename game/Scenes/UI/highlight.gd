extends Node2D

@onready var plantMarkers = get_tree().get_nodes_in_group("Markers")
@onready var nearestMarker = plantMarkers[0]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mousePos = get_global_mouse_position()
	
	for n in plantMarkers:
		if n.global_position.distance_to(mousePos) < nearestMarker.global_position.distance_to(mousePos):
			nearestMarker = n
	
	position.x = nearestMarker.global_position.x
	position.y = nearestMarker.global_position.y
	
	if nearestMarker.global_position.distance_to(mousePos) < 50:
		$Sprite2D.visible = true
	else :
		$Sprite2D.visible = false
