extends Node

@onready var player = $Player
@onready var score = $Score
@onready var pipesContainer = $PipesContainer
@onready var pipesSpawnTimer = $PipesSpawnTimer
@onready var pipes = preload("res://pipes.tscn")
@onready var scoreSound = $ScoreSound

var pipeYAxisPlacement = 0

func _ready():
	updateScore()
	setPipeYAxisPlacement()
	
func _on_ground_collision_area_collided():
	changeScene()
	
func spawnPipes(yPos):
	var pipesInstance = pipes.instantiate() 
	pipesInstance.position.y = yPos
	pipesInstance.connect("playerScored", _on_player_scored, 4)
	pipesContainer.add_child(pipesInstance)

func setPipeYAxisPlacement():
	pipeYAxisPlacement = randi_range(-170, 170) 
	
func _on_pipes_initial_spawn_timer_timeout():
	pipesSpawnTimer.start()
	spawnPipes(pipeYAxisPlacement)
	setPipeYAxisPlacement()
	
func _on_pipes_spawn_timer_timeout():
	spawnPipes(pipeYAxisPlacement)
	setPipeYAxisPlacement()

func _on_player_collided():
	changeScene()
	
func _on_player_scored():
	GlobalStats.playerScore += 1
	updateScore()
	scoreSound.play()
	
func updateScore():
	score.text = "Score: " + str(GlobalStats.playerScore)
	
func changeScene():
	get_tree().change_scene_to_file("res://score.tscn")
