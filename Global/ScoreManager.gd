extends Node

var score := 0
var max_score := 0
var points_per_second := 10.0

signal max_score_changed(new_max_score)
signal score_changed(new_score)

func _process(delta):
	if GameManager.current_state == GameManager.State.PLAYING:
		score += int(points_per_second * delta)
		score_changed.emit(score)
		
		if score > max_score:
			max_score = score
			max_score_changed.emit(max_score)
		
func reset_score():
	score = 0
	score_changed.emit(score)
	
func get_score() -> int: 
	return score
	
func get_max_score() -> int:
	return max_score
