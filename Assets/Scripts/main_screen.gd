extends Node

@onready var bird = preload("res://Assets/Sprites/bird.png")
@onready var birdSprite = Sprite2D.new()

var birdPlacementOnYAxis = 0
var SPEED = 300

func _ready():
	birdSprite.texture = bird
	setBirdSpritePosition()
	add_child(birdSprite)

func _physics_process(delta):
	_inputDetection()
	randomize()
	birdSprite.position.x += SPEED * delta
	if birdSprite.position.x >= 1280:
		setBirdSpritePosition()
	
func setBirdSpritePosition():
	birdSprite.position.x = -20
	birdSprite.position.y = randi_range(0, 720)
	
func _inputDetection():
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://loading.tscn")
