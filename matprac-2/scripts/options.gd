extends Control

func _on_mute_toggled(toggled_on):
	AudioServer.set_bus_mute(0,toggled_on)


func _on_resolution_item_selected(index):
	match index:
		0:
			set_resolution(1920,1080)
		1:
			set_resolution(1280,720)
		2:
			set_resolution(1280,960)
	
func set_resolution(width:int, height:int):
	DisplayServer.window_set_size(Vector2i(width, height))
	get_window().move_to_center()


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
