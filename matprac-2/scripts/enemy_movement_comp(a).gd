extends Node
@export var flip_node : Node
@export var speed = 70
@export var aspeed = 220
var direction = -1

func _ready():
	flip_node.scale.x = direction

func move(body:CharacterBody2D, is_attacking:bool):
	if body.is_on_floor():
		if is_attacking == true:
			body.velocity.x=aspeed*direction
