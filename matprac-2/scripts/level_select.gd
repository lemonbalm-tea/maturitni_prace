extends Control



func _on_swamp_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level1.tscn")
	Global.checkpoint = null


func _on_forest_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level2.tscn")
	Global.checkpoint = null
func _on_castle_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level3.tscn")
	Global.checkpoint = null
func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
