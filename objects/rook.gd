extends CharacterBody2D

@onready var hurtbox_component = $HurtboxComponent as HurtboxComponent
@export var player: CharacterBody2D
@export var speed: float = 80.0

var _is_lit := false

func _ready():
	hurtbox_component.hurt.connect(_on_hurt)
	hurtbox_component.left.connect(_on_left)

func _on_hurt(_hitbox):
	_is_lit = true

func _on_left(_hitbox):
	_is_lit = false

func _process(delta):
	if _is_lit and player and Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		var dir := self.position.direction_to(player.position)
		if abs(dir.x) >= abs(dir.y):
			velocity = Vector2(sign(dir.x) * speed, 0.0)
		else:
			velocity = Vector2(0.0, sign(dir.y) * speed)
	else:
		velocity = Vector2.ZERO
	move_and_collide(velocity * delta)
