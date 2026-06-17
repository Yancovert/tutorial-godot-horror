extends SceneTree

func _init():
	var packed = ResourceLoader.load("res://scenery/door.tscn")
	var scene = packed.instantiate()
	var door = scene.get_node("hinge/door_wood_black_worn_014")
	print("Door 014 AABB: ", door.get_aabb())
	print("Door 014 global basis: ", door.global_transform.basis)
	quit()
