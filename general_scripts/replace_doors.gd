@tool
extends EditorScript

func _run():
	print("Running replace_doors script...")
	var packed_scene = ResourceLoader.load("res://scenery/house_3.tscn")
	var scene = packed_scene.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
	
	var new_door_scene = ResourceLoader.load("res://scenery/door(2)_dark.tscn")
	
	var replaced_count = 0
	
	for child in scene.get_children():
		if child is MeshInstance3D and child.name.begins_with("door_wood_black_worn_"):
			# Hide the original door instead of deleting it (since it's an inherited node)
			child.visible = false
			
			var new_door = new_door_scene.instantiate()
			new_door.name = child.name + "_scripted"
			
			# Copy the transform
			new_door.transform = child.transform
			
			# Add it to the scene
			scene.add_child(new_door)
			# Essential: set the owner so it is saved in the packed scene!
			new_door.owner = scene
			
			replaced_count += 1
			
	if replaced_count > 0:
		var packed_new = PackedScene.new()
		var result = packed_new.pack(scene)
		if result == OK:
			ResourceSaver.save(packed_new, "res://scenery/house_3.tscn")
			print("Successfully replaced ", replaced_count, " dark doors!")
			print("Please reload house_3.tscn if you have it open.")
		else:
			print("Failed to pack scene: ", result)
	else:
		print("No static dark doors found to replace. They might already be replaced!")
