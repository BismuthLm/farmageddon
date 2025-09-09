extends StaticBody2D


func _process(_delta):
	if Globals.day == true:
		if $PointLight2D.energy > 0:
			$PointLight2D.energy -= 0.01
	if Globals.day == false:
		if $PointLight2D.energy < 2.5:
			$PointLight2D.energy += 0.005
		
