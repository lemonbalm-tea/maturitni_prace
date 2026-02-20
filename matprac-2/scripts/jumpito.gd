extends Area2D

var player_in = false
signal jumpito
	

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
