extends Control
class_name ScoreUI

@onready var score_left: Label = $ScoreLeft
@onready var score_right: Label = $ScoreRight

func update_score(score: Vector2i) -> void:
	score_left.text = str(score.x)
	score_right.text = str(score.y)

func reset_score() -> void:
	score_left.text = "0"
	score_right.text = "0"
