class_name MoveInputComponent
extends Node

@export var move_component: MoveComponent
@export var move_stats: MoveStats

func _input(_event: InputEvent) -> void:
	var input_hori = Input.get_axis("ui_left", "ui_right")
	var input_vert = Input.get_axis("ui_up", "ui_down")
	move_component.velocity = Vector2(input_hori * move_stats.speed, input_vert*move_stats.speed)
