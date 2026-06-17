extends RayCast3D


func _ready() -> void:
	add_exception(owner)

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		if is_colliding():
			var hit = get_collider()
			print("Raycast hitting: ", hit.name if hit else "null")
			if hit != null:
				var current = hit
				var interactable = null
				var chain = []
				while current != null and current != get_tree().root:
					var script_name = "None"
					if current.get_script() != null:
						script_name = current.get_script().resource_path
					chain.append(current.name + " [" + script_name + "]")
					
					if current.has_method("toggle_door"):
						interactable = current
						break
					current = current.get_parent()
					
				if interactable != null:
					print("Found interactable: ", interactable.name)
					interactable.toggle_door()
				else:
					print("Checked chain: ", chain)
					print("No toggle_door method found on ancestors")
		else:
			print("Raycast is not hitting anything")
