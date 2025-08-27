extends CanvasLayer

func change_scene():
	$AnimationPlayer.play("fade to black")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play_backwards("fade to black")
