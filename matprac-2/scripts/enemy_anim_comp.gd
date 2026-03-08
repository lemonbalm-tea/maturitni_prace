extends Node
@export var anim : AnimatedSprite2D
@export var timer : Timer
var can_notice = true

func do_animation(body:CharacterBody2D, is_attack):
	var current_anim = anim.animation
	if is_attack == true and can_notice == true:
		anim.play("notice")
		body.velocity.x = 0
	elif is_attack == true and can_notice == false:
		anim.play("charge")
	else:
		anim.play("walk")
		can_notice = true
		
func _on_animated_sprite_2d_animation_finished():
	if anim.animation == "notice":
		can_notice = false
