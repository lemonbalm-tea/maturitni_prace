extends CharacterBody2D
@export var ray : RayCast2D
@export var anim : AnimatedSprite2D

func _physics_process(delta):
	if ray.is_colliding():
		anim.play("love")
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://scenes/menus/win.tscn")
