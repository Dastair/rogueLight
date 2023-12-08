extends PointLight2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if self.texture_scale > 0.1:
			self.texture_scale -= 0.1
		print(self.texture_scale)
	else:
		if self.texture_scale < 0.4:
			self.texture_scale += 0.1
		
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		look_at(get_global_mouse_position())
		self.texture = preload("res://Resources/lightParticles/flash.png")
		self.offset.x = 15
		self.texture_scale = 0.8
	else:
		self.offset.x = 0
		self.texture = preload("res://.godot/imported/pointLight.webp-631b7ae0c928feba6faed6027f2cf433.ctex")
