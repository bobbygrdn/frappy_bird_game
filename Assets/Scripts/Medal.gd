extends Sprite2D

var playerScore = GlobalStats.playerScore
var goldMedal = preload("res://Assets/Sprites/gold_medal.png")
var silverMedal = preload("res://Assets/Sprites/silver_medal.png")
var bronzeMedal = preload("res://Assets/Sprites/bronze_medal.png")

func _ready():
	if playerScore > 20:
		self.texture = goldMedal
	elif playerScore > 10 && playerScore < 20:
		self.texture = silverMedal
	else:
		self.texture = bronzeMedal
