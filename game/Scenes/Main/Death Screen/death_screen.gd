extends CanvasLayer


func _process(_delta):
	if Globals.dead == true:
		$Control/Sprite2D.visible = true
	if Globals.dead == false:
		$Control/Sprite2D.visible = false
