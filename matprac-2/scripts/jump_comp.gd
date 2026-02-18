extends Node

@export var jump_speed = -350.0
@export var consum_comp : Node

var is_jumping = false

func do_jump(body:CharacterBody2D, jump_input, is_dead):
	if jump_input and body.is_on_floor() and not is_dead:
		body.velocity.y = jump_speed
	is_jumping = body.velocity.y < 0 and not body.is_on_floor()
func do_double_jump(body: CharacterBody2D, jump_input):
	if jump_input and not body.is_on_floor() and consum_comp.can_double_jump():
		body.velocity.y = jump_speed
