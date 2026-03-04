extends Node

@export var sprite : AnimatedSprite2D
var current 

func do_flip_h(move_direction):
	if move_direction == 0:
		return
	sprite.flip_h = false if move_direction > 0 else true
	
func do_move_anim(move_direction, is_dead, is_jump):
	if is_dead == false:
		do_flip_h(move_direction)
		if move_direction!= 0:
			sprite.play("run")
		if is_jump == true:
			sprite.play("jump")
		if is_dead == true:
			sprite.play("dead")
		if move_direction==0:
			sprite.play("idle")
