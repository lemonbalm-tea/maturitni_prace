extends Node

var input_h = 0.0
func _process(delta):
	input_h = Input.get_axis("left","right")
	
func is_jump():
	return Input.is_action_just_pressed("jump")
