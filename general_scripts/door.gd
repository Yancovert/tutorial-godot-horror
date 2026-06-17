extends Node3D

var opened = false

func toggle_door():
	if $AnimationPlayer.current_animation != "open_door" and $AnimationPlayer.current_animation != "close_door":
		opened = !opened
		if !opened:
			$AnimationPlayer.play("close_door")
		if opened:
			$AnimationPlayer.play("open_door")
		
