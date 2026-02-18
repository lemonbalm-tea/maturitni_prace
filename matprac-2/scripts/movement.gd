extends Node

@export_subgroup("Settings")
@export var speed = 100.0

func do_movement_h(body: CharacterBody2D, direction:float, is_dead:bool):
	if is_dead == false:
		body.velocity.x = direction*speed
	else:body.velocity.x = 0
