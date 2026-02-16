extends Node

@export var jump_speed = -350.0

var is_jumping = false

func do_jump(body:CharacterBody2D, jump_input):
	if jump_input and body.is_on_floor():
		body.velocity.y = jump_speed
	is_jumping = body.velocity.y < 0 and not body.is_on_floor()
