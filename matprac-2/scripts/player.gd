extends CharacterBody2D

@export_subgroup("Nodes")
@export var gravity_comp: Node
@export var input_comp : Node
@export var movement_comp : Node
@export var anim_comp : Node
@export var jump_comp : Node

func _physics_process(delta):
	gravity_comp.do_gravity(self, delta)
	movement_comp.do_movement_h(self, input_comp.input_h)
	anim_comp.do_move_anim(input_comp.input_h)
	jump_comp.do_jump(self, input_comp.is_jump())
	
	move_and_slide()
	
