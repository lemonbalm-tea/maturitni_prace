extends Control







func _on_select_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/level_select.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/options.tscn")


func _on_quit_pressed():
	get_tree().quit()
