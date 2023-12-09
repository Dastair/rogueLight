extends CharacterBody2D

@onready var point_light_2d = $PointLight2D as PointLight2D
@onready var point_light_no_shadows = $PointLight2DNoShadows as PointLight2D

@export var speed: float = 100



func get_input():
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * speed


func _physics_process(delta):
	get_input()
	move_and_slide()
