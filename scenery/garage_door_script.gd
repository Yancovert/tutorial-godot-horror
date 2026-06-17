extends Node3D

var opened = false

func toggle_door():
	# Only do something if the animation is NOT currently playing
	if not $AnimationPlayer.is_playing():
		opened = !opened
		if opened:
			$AnimationPlayer.play("garage_door_open")
		else:
			$AnimationPlayer.play("garage_door_close")
