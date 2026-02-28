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
var valor_slider_master:float=1.0
var valor_slider_musica:float=1.0
var terminou1_1=false
var terminou2_1=false
var terminou3_1=false
var terminou4_1=false
var terminou1_2=false
var terminou2_2=false
var terminou3_2=false
var terminou4_2=false
var terminou1_3=false
var terminou2_3=false
var terminou3_3=false
var terminou4_3=false
var terminou5_3=false
var terminou6_3=false
var tocar1_1=true
var tocar2_1=false
var tocar3_1=false
var tocar4_1=false
var tocar5_1=false
var tocar1_2=true
var tocar2_2=false
var tocar3_2=false
var tocar4_2=false
var tocar5_2=false
var tocar1_3=true
var tocar2_3=false
var tocar3_3=false
var tocar4_3=false
var tocar5_3=false
var tocar6_3=false
var tocar7_3=false
var tocar8_3=false



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
