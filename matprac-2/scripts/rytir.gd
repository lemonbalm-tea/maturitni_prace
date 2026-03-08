extends CharacterBody2D

@export_subgroup("Components")
@export var gravity_comp: Node
@export var anim_comp: Node
@export var attack_comp: Node
@export var movement_comp : Node

func _physics_process(delta):
	gravity_comp.do_gravity(self, delta)
	attack_comp.finding(self)
	movement_comp.move(self, attack_comp.is_attack)
	anim_comp.do_animation(self, attack_comp.is_attack)
	move_and_slide()
