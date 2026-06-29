extends Area2D

@export var is_right := false

signal ball_out

func _on_body_entered(body: Node2D) -> void:
	if body is Ball:
		ball_out.emit(is_right)
