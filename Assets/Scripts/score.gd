extends Node

var playerScore = GlobalStats.playerScore

@onready var score = $VBoxContainer/Label2

func _ready():
	score.text = "Score: " + str(playerScore)

func _physics_process(delta):
	_inputDetection()
	updateScore()
	
func _inputDetection():
	if Input.is_action_pressed("ui_accept"):
		GlobalStats.playerScore = 0
		get_tree().change_scene_to_file("res://loading.tscn")

func updateScore():
	score.text = "Score: " + str(playerScore)
