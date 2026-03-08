extends Node
@export var flip_node : Node
@export var speed = 70
@export var aspeed = 220
var direction = 1


func move(body:CharacterBody2D, is_attacking:bool):
	if body.is_on_wall():
		direction *= -1
		flip_node.scale.x = direction
	if body.is_on_floor():
		if is_attacking == false:
			body.velocity.x=speed*direction
		else:
			body.velocity.x=aspeed*direction
