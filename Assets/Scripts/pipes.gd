extends Node2D

signal playerScored

@export var SPEED = 200

func _physics_process(delta):
	if position.x <= -730:
		emit_signal("playerScored")
		
	position.x += -SPEED * delta
	
	if position.x <= -1380:
		queue_free()
