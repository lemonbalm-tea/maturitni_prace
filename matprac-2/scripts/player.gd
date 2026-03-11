extends CharacterBody2D

@export_subgroup("Nodes")
@export var gravity_comp: Node
@export var input_comp : Node
@export var movement_comp : Node
@export var anim_comp : Node
@export var jump_comp : Node
@export var dead_comp : Node
@export var cons_comp : Node

func _physics_process(delta):
	gravity_comp.do_gravity(self, delta)
	movement_comp.do_movement_h(self, input_comp.input_h, dead_comp.is_ded_global)
	anim_comp.do_move_anim(input_comp.input_h, dead_comp.is_ded_global, self,cons_comp.is_eating)
	jump_comp.do_jump(self, input_comp.is_jump(), dead_comp.is_ded_global)
	jump_comp.do_double_jump(self, input_comp.is_jump())
	dead_comp.is_dead()
	cons_comp.ded(dead_comp.is_ded_global)
	
	move_and_slide()
	
