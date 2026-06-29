extends CharacterBody2D
class_name Ball

@onready var pop_sound: AudioStreamPlayer2D = $PopSound

const INITIAL_SPEED := 350.0
const MAX_SPEED := 800

var speed := INITIAL_SPEED
var speed_increase_per_bounce := 50.0

var move_dir := Vector2(-1.0, 0.0)

func _physics_process(_delta: float) -> void:
	var normalize_move_dir := move_dir.normalized()
	
	velocity = normalize_move_dir * speed

	var collided: bool = move_and_slide()
	
	if collided:
		move_dir.y *= -1
		play_pop_sound()

func bounce_from_paddle(pos_y_paddle: float, paddle_height: float) -> void:
	move_dir.x *= -1
	
	var new_move_dir_y: float = 2 * (global_position.y - pos_y_paddle) / paddle_height
	move_dir.y = new_move_dir_y
	
	if speed < MAX_SPEED:
		speed += speed_increase_per_bounce
		
	play_pop_sound()

func reset() -> void:
	global_position = Vector2(640.0, 360.0)
	speed = INITIAL_SPEED
	
	var move_dir_x: float = [-1.0, 1.0].pick_random()
	var move_dir_y: float = randf() * [-1.0, 1.0].pick_random()
	move_dir = Vector2(move_dir_x, move_dir_y)
	
func play_pop_sound() -> void:
	pop_sound.pitch_scale = [1.2, 1.3, 1.4, 1.5, 1.6, 1.7].pick_random()
	pop_sound.play()
