extends PointLight2D
@onready var vision_cone_2d = $"../PointLightNoShadows/VisionCone2D" as VisionCone2D




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if self.texture_scale > 0.1:
			self.texture_scale -= 0.1
			vision_cone_2d.max_distance -= 5
	else:
		if self.texture_scale < 0.4:
			vision_cone_2d.max_distance += 5
			self.texture_scale += 0.1
	if Input.is_action_just_released("rightMouse"):
		self.texture_scale = 0.4
		vision_cone_2d.angle_deg = 360
		vision_cone_2d.reangle()
		vision_cone_2d.max_distance = 45
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		
		
		self.texture = preload("res://Resources/lightParticles/flash.png")
		
		self.offset.y = 15
		vision_cone_2d.angle_deg = 50
		vision_cone_2d.reangle()
		vision_cone_2d.max_distance = 90
		self.texture_scale = 0.8
	else:

		self.offset.y = 0
		self.texture = preload("res://.godot/imported/pointLight.webp-631b7ae0c928feba6faed6027f2cf433.ctex")
