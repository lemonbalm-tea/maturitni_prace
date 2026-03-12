extends Node

@export var a_ray : RayCast2D
var is_attack = false

func finding(body: CharacterBody2D):
	if a_ray.is_colliding():
		var obj = a_ray.get_collider()
		if obj.is_in_group("player"):
			is_attack = true
