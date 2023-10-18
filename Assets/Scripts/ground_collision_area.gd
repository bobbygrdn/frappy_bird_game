extends Area2D

signal collided

func _on_body_entered(body):
	if body.name != "BottomPipe":
		emit_signal("collided")
