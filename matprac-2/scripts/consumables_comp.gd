extends Node

@export var double_jump_charge : int = 0
@export var double_jump_label : Label
var is_eating = false

func _on_area_2d_area_entered(area):
	if area.is_in_group("moucha"):
		double_jump_charge += 1
		change_double_jump_label()
		area.queue_free()
		is_eating = true
		await get_tree().create_timer(1.9).timeout
		is_eating = false
func can_double_jump():
	if double_jump_charge >= 1:
		double_jump_charge -= 1
		change_double_jump_label()
		return true

func change_double_jump_label():
	double_jump_label.text = str(double_jump_charge)

func ded(is_dead):
	if is_dead == true and Input.is_action_just_pressed("jump"):
		double_jump_charge = 0
		change_double_jump_label()
