extends Node2D

@onready var ball: Ball = $Ball
@onready var start_delay: Timer = $StartDelay
@onready var score_ui: ScoreUI = $CanvasLayer/ScoreUI
@onready var ball_out_sound: AudioStreamPlayer2D = $BallOutSound

var score := Vector2i.ZERO
var target_score := 2

func _ready() -> void:
	randomize()
	reset_game()


func _draw() -> void:
	draw_dashed_line(
		Vector2(640.0, 0),
		Vector2(640.0, 720),
		Color.WHITE,
		15,
		15
	)
	
func reset_game() -> void:
	score = Vector2i.ZERO
	score_ui.reset_score()
	ball.reset()

func reset_round() -> void:
	start_delay.start()
	await start_delay.timeout
	ball.reset()
	
func _on_score_detector_ball_out(is_right: bool) -> void:
	if is_right:
		score.x += 1
	else:
		score.y += 1
		
	play_ball_out_sound()
		
	if score.x == target_score || score.y == target_score:
		reset_game()
	else:
		score_ui.update_score(score)
		reset_round()

func play_ball_out_sound() -> void:
	ball_out_sound.pitch_scale = [0.5, 0.6, 0.7, 0.8, 0.9].pick_random()
	ball_out_sound.play()
	
