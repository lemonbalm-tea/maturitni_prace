extends Node

@export var sprite : AnimatedSprite2D
var current 
var gone = false

func do_flip_h(move_direction):
	if move_direction == 0:
		return
	sprite.flip_h = false if move_direction > 0 else true
	
func do_move_anim(move_direction, is_dead, body, is_eating):
	if gone == false:
		do_flip_h(move_direction)
		if is_dead == true:
			sprite.play("dead")
		elif body.is_on_floor() == false:
			sprite.play("jump")
		elif is_eating == true:
			sprite.play("eat")
		elif move_direction!= 0:
			sprite.play("run")
		else:
			sprite.play("idle")


func _on_animated_sprite_2d_animation_finished():
	if sprite.animation == "dead":
		sprite.queue_free()
		gone = true
