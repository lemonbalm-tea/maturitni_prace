extends CharacterBody2D

@export_subgroup("Components")
@export var gravity_comp: Node
@export var anim_comp: Node
@export var attack_comp: Node

func _physics_process(delta):
	gravity_comp.do_gravity(self, delta)
	move_and_slide()
