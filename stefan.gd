extends CharacterBody2D

const GRAVITY = 300
const WALK_SPEED = 200
const JUMP_HIGHT = 200

func _physics_process(delta):
	velocity.y += delta * GRAVITY

	if Input.is_action_just_pressed("jump"):
		velocity.y -= JUMP_HIGHT
	else:
		pass
	if Input.is_action_pressed("left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("right"):
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0
	
	# "move_and_slide" already takes delta time into account.
	move_and_slide()


func _on_area_2d_body_entered(body):
	print("Ahojky")
	$"../Area2D".queue_free()
