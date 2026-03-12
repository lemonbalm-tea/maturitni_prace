extends Area2D

@export var SPEED = 1
var player_in = false
var start_pos
signal jumpito
	
func _ready():
	start_pos = position

func _on_body_entered(body):
	if body.name == "player":
		Global.jumpito = true

func _on_body_exited(body):
	if body.name == "player":
		Global.jumpito = false

func _physics_process(delta):
	position.y = position.y+SPEED
	

func _on_timer_timeout():
	position = start_pos
	Timer
