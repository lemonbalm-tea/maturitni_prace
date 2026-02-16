extends Node

@export var sprite : AnimatedSprite2D

func do_flip_h(move_direction):
	if move_direction == 0:
		return
	sprite.flip_h = false if move_direction > 0 else true
	
func do_move_anim(move_direction):
	do_flip_h(move_direction)
	if move_direction!= 0:
		sprite.play("idle")
	else:
		sprite.play("idle")
	
