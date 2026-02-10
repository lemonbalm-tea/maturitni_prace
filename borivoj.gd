extends CharacterBody2D

@export_range(0.0, 5.0) var SPEED = 100
var echo_scene = preload("res://sonar test.tscn")
func get_input():
	var dir = Input.get_vector("left","right","up","down")
	velocity = dir * SPEED

func _physics_process(delta):
	get_input()
	move_and_slide()
	#if Input.is_action_just_pressed("echo"):
	#	instance_object()y
func instance_object():

	var position = $".".global_position
	
	var echo = echo_scene.instantiate()
	get_parent().add_child(echo)
	echo.position = Vector2 (position.x, position.y)
	echo.scale = Vector2 (0.2, 0.2)
