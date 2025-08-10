extends CanvasLayer

var selected: Color = Color("ffffff")
var not_selected: Color = Color("434343")

func _process(_delta):
	if Input.is_action_just_released("scroll down"):
		if Globals.plant_selected == 0:
			Globals.plant_selected = 1
			print("Plant selected is Carrot")
			$Control/Beetroot.modulate = not_selected
			$Control/Carrot.modulate = selected

	if Input.is_action_just_released("scroll up"):
		if Globals.plant_selected == 1:
			Globals.plant_selected = 0
			print("Plant selected is Beetroot")
			$Control/Beetroot.modulate = selected
			$Control/Carrot.modulate = not_selected
	
	
	$"Control/Beetroot amount".text = str(Globals.beetroot_amount)
	$"Control/Carrot amount".text = str(Globals.carrot_amount)
