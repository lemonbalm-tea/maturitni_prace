extends Node

@export var sprite : AnimatedSprite2D
var current 

func do_flip_h(move_direction):
	if move_direction == 0:
		return
	sprite.flip_h = false if move_direction > 0 else true
	
func do_move_anim(move_direction, is_dead, is_jump, is_eating):
	do_flip_h(move_direction)
	if is_dead == true:
		sprite.play("dead")
	elif is_jump == true:
		sprite.play("jump")
	elif is_eating == true:
		sprite.play("eat")
	elif move_direction!= 0:
		sprite.play("run")
	else:
		sprite.play("idle")
