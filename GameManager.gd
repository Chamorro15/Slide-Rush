extends Node
# GAME MANAGER - Singleton
# Controla el estado global del juego (Playing, Game Over)
# Es un Singleton que significa que está presente en cualquier momento
# Enumeración de estados posibles del juego
enum State { PLAYING,    # Juego en curso
	GAME_OVER   # Juego terminado
}
# Estado actual del juego
var current_state := State.PLAYING
# Señal que se emite cuando cambia el estado
# Otros nodos (UI, Spawner) pueden conectarse para reaccionar
signal state_changed(new_state)
# _ready()
# Se ejecuta al iniciar el juego
# Inicializa el estado a PLAYING
func _ready():
	current_state = State.PLAYING
	pass
# game_over()
# Llamar cuando el jugador colisiona con un obstáculo
# Cambia el estado a GAME_OVER y emite señal
# Otros nodos pueden reaccionar a este cambio
func game_over():
	# Cambiar estado a GAME_OVER
	current_state = State.GAME_OVER
	# Emitir señal para que UI o Spawner puedan actuar
	state_changed.emit(current_state)
	# Mostrar UI de Game Over 

	# get_tree().get_first_node_in_group("ui").show_game_over() (DESCOMENTAR TEXTO CUANDO EXISTA)
	pass
# restart_game()
# Llamar cuando el jugador presiona restart
# Resetea score y recarga la escena actual
func restart_game():
	# Resetear puntuación 
	
	# ScoreManager.reset_score() (DESCOMENTAR TEXTO CUANDO EXISTA)
	
	# Recargar la escena actual para reiniciar juego
	get_tree().reload_current_scene()
	pass
