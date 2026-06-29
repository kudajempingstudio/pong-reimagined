extends Area2D

@onready var cshape: CollisionShape2D = $CollisionShape2D

enum PlayerType {ONE, TWO}

@export var player_type := PlayerType.ONE

const MAX_VELOCITY := 20.0

var velocity := 0.0
var acceleration := 50.0

var input_up := "paddle_up"
var input_down := "paddle_down"

func _ready() -> void:
	match player_type:
		PlayerType.ONE:
			input_up += "_one"
			input_down += "_one"
		PlayerType.TWO:
			input_up += "_two"
			input_down += "_two"

func _physics_process(delta: float) -> void:
	var move_dir := 0.0
	
	move_dir = Input.get_axis(input_up, input_down)
	
	velocity += move_dir * acceleration * delta
	
	if move_dir == 0.0:
		velocity = move_toward(velocity, 0, 4.0)
	
	velocity = clampf(velocity, -MAX_VELOCITY, MAX_VELOCITY)
	
	global_position.y += velocity

	global_position.y = clampf(global_position.y, 0.0 + 60, 720.0 - 60)
	
	
func _on_body_entered(body: Node2D) -> void:
	if body is Ball:
		body.bounce_from_paddle(global_position.y, cshape.shape.get_rect().size.y)
