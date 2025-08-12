extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Globals.time_of_day >= 12 or Globals.time_of_day <7:
		if $PointLight2D.energy < 2.5:
			$PointLight2D.energy += 0.005
	else:
		if $PointLight2D.energy > 0:
			$PointLight2D.energy -= 0.01

