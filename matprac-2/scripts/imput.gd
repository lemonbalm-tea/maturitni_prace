extends Node

var input_h = 0.0
func _process(delta):
	input_h = Input.get_axis("left","right")
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
	if Input.is_action_just_pressed("back"):
		get_tree().call_deferred("reload_current_scene")
	
func is_jump():
	return Input.is_action_just_pressed("jump")
