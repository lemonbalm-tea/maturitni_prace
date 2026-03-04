extends Area2D

@export var SPEED = 1
var player_in = false
var start_pos
signal jumpito
	
func _ready():
	start_pos = position

func _on_body_entered(body):
	if body.name == "player":
		player_in = true

func _on_body_exited(body):
	if body.name == "player":
		player_in = false

func _physics_process(delta):
	if player_in == true:
		Global.jumpito = true
	else:
		Global.jumpito = false
	position.y = position.y+SPEED
	

func _on_timer_timeout():
	position = start_pos
	Timer
