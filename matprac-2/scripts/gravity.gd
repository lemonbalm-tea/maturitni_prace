extends Node

@export_subgroup("Settings")
@export var gravity = 1000.0
var falling : bool = false


func do_gravity (body: CharacterBody2D, delta):
	if not body.is_on_floor():
		body.velocity.y += gravity * delta
	falling = body.velocity.y > 0 and not body.is_on_floor()
