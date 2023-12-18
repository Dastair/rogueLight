extends CharacterBody2D
@onready var sprite_2d = $Sprite2D as Sprite2D
@onready var hurtbox_component = $HurtboxComponent as HurtboxComponent
@export var player: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	hurtbox_component.hurt.connect(lit_up().unbind(1))
	
	hurtbox_component.left.connect(func(hitbox: Area2D):
		velocity = Vector2(0,0)
	)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_collide(velocity)
	
	
func lit_up():
	var dif = self.position.direction_to(player.position)
	match dif.max_axis_index():
		0:
			velocity = Vector2(dif.limit_length().x,0)
		1:
			velocity = Vector2(0,dif.limit_length().y)
	pass
