extends Node

var ded = preload("res://scenes/ded.tscn")
var ded_inst = ded.instantiate()
var is_ded = false
var is_ded_global = false 

func _on_area_2d_area_entered(area):
	if area.is_in_group("dead"):
		is_ded = true
		is_ded_global = true
	if area.is_in_group("checkpoint"):
		Global.checkpoint = area.global_position
	if area.is_in_group("finish"):
		get_tree().change_scene_to_file("res://scenes/menus/level_select.tscn")
		Global.checkpoint = null
func is_dead():
	if is_ded == true:
		await get_tree().create_timer(1.2).timeout
		add_child(ded_inst)
		is_ded = false

func _process(delta):
	if is_ded_global == true and Input.is_action_just_pressed("jump"):
		get_tree().call_deferred("reload_current_scene")
		
func _ready():
	if Global.checkpoint != null:
		$"..".global_position = Global.checkpoint
