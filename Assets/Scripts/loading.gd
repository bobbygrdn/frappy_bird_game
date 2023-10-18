extends Node

@onready var timer = $Timer
@onready var countdown = $Countdown

func _physics_process(delta):
	countdown.text = str(int(timer.time_left))
	
func _on_timer_timeout():
	get_tree().change_scene_to_file("res://world.tscn")
