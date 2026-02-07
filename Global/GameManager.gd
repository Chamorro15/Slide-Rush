extends Node

enum State { PLAYING,   
	GAME_OVER   
}

var current_state := State.PLAYING

signal state_changed(new_state)

func _ready():
	current_state = State.PLAYING
	pass

func game_over():
	current_state = State.GAME_OVER
	state_changed.emit(current_state)
	pass

func restart_game():
	ScoreManager.reset_score() 
	get_tree().reload_current_scene()
	pass
