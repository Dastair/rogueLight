extends Area2D

signal hit_hurtbox
signal left_hurtbox
# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect on area entered to our hurtbox entered function
	area_entered.connect(_on_hurtbox_entered)
	area_exited.connect(_on_hurtbox_left)

func _on_hurtbox_entered(hurtbox: HurtboxComponent):
	# Make sure the area we are overlapping is a hurtbox
	if not hurtbox is HurtboxComponent: return
	# Make sure the hurtbox isn't invincible
	if hurtbox.is_invincible: return
	# Signal out that we hit a hurtbox (this is useful for destroying projectiles when they hit something)
	hit_hurtbox.emit(hurtbox)
	# Have the hurtbox signal out that it was hit
	hurtbox.hurt.emit(self)
	
func _on_hurtbox_left(hurtbox:HurtboxComponent):
	left_hurtbox.emit(hurtbox)
	hurtbox.left.emit(self)
