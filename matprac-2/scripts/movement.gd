extends Node

@export_subgroup("Settings")
@export var speed = 100.0

func do_movement_h(body: CharacterBody2D, direction:float):
	body.velocity.x = direction*speed
