extends CharacterBody2D

@export_range(0.0, 5.0) var SPEED = 3.0

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		position.x = position.x + SPEED
	if Input.is_action_pressed("left"):
		position.x = position.x - SPEED
	if Input.is_action_pressed("up"):
		position.y = position.y - SPEED
	if Input.is_action_pressed("down"):
		position.y = position.y + SPEED
