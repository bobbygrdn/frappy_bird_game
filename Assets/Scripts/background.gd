extends ParallaxBackground

func _process(delta):
	scroll_offset.x -= 40 * delta

func _physics_process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
