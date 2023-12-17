extends Sprite2D

func _process(_delta):
	if is_pixel_opaque(Vector2(0,0)):
		print("light")
