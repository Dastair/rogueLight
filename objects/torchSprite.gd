extends AnimatedSprite2D
@onready var hurtbox_component = $"../HurtboxComponent"


# Called when the node enters the scene tree for the first time.
func _ready():
	hurtbox_component.hurt.connect(func(hitbox: Area2D):
		self.frame = 1
		)
	hurtbox_component.left.connect(func(hitbox: Area2D):
		self.frame = 0
	)
	self.ligh
