extends CharacterBody2D

const JUMP_VELOCITY = -360.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var jumpSound = $JumpSound
@onready var hitSound = $HitSound
@onready var explosionSound = $ExplosionSound

signal collided

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_select"):
		velocity.y = JUMP_VELOCITY
		jumpSound.play()

	# Detect Collisions
	var collision_info = move_and_slide()
	if collision_info:
		var collided_body = get_slide_collision(0)
		if collided_body.get_collider().is_in_group("obstacle"):
			emit_signal("collided")
			hitSound.play()
			explosionSound.play()
