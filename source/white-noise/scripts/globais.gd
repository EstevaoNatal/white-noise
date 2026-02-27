extends Node
var player_spawn: Vector2 = Vector2(-135,60)
var player_jump_velocidade:float = 0.0
var fase_atual:int=0
var tamanho_tela=0
var fase_anterior=0
var mudar_tamanho_tela:bool=false
var tamanho_resolucao=DisplayServer.screen_get_size()
var ligar_tutorial=false
var abrir_menu=false
var voltar_jogo=false
var master_bus = AudioServer.get_bus_index("Master")
var musica_bus = AudioServer.get_bus_index("Musica")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#if tamanho_resolucao==Vector2i(1920,1080):
	#	tamanho_tela=0
	#elif tamanho_resolucao==Vector2i(1920,1080):
	#	tamanho_tela=1
	#else:
	#	tamanho_tela=2
