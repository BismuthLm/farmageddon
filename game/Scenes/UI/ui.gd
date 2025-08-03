extends CanvasLayer

var selected: Color = Color("ffffff")
var not_selected: Color = Color("434343")

func _process(_delta):
	if Input.is_action_just_released("scroll down"):
		if Globals.plant_selected == 0:
			Globals.plant_selected = 1
			$Control/Beetroot.modulate = not_selected
			$Control/Carrot.modulate = selected

	if Input.is_action_just_released("scroll up"):
		if Globals.plant_selected == 1:
			Globals.plant_selected = 0
			$Control/Beetroot.modulate = selected
			$Control/Carrot.modulate = not_selected
