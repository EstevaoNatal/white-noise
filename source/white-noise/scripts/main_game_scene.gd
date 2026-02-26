extends Node2D
@onready var main_game_scene: Node2D = $"."
@onready var nivelAtual:Node
@onready var proximo:Resource
@onready var proximo_nivel
@onready var tamanhos_tela = [Vector2i(1920,1080),Vector2i(960,540),Vector2i(640,360)]
@onready var tamanho_atual=0
@onready var timer_fechar: Timer = $timer_fechar
var contador=0
var contador1=0
var contador2=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DisplayServer.window_set_size(tamanhos_tela[tamanho_atual])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("close_game") and contador2==0:
		timer_fechar.start()
		contador2=1
	if Input.is_action_just_released("close_game"):
		timer_fechar.stop()
		contador2=0
	#if Input.is_action_just_pressed("aumentar_tamanho_tela") or Input.is_action_just_pressed("diminuir_tamanho_tela") or Globais.mudar_tamanho_tela:
	#	if (Input.is_action_just_pressed("aumentar_tamanho_tela") or get_node("menuDeOpcoes").id==1) and tamanho_atual>0:
	#		tamanho_atual-=1
	#	if (Input.is_action_just_pressed("diminuir_tamanho_tela") or get_node("menuDeOpcoes").id==0) and tamanho_atual<tamanhos_tela.size()-1:
	#		tamanho_atual+=1
	if Globais.mudar_tamanho_tela==true:
		DisplayServer.window_set_size(tamanhos_tela[Globais.tamanho_resolucao])
		Globais.mudar_tamanho_tela=false
	if Globais.fase_atual==2 && contador==0:
		nivelAtual = main_game_scene.get_node("first_area")
		main_game_scene.remove_child(nivelAtual)
		nivelAtual.call_deferred("free")
		proximo = load("res://scenes/second_area.tscn")
		proximo_nivel = proximo.instantiate()
		main_game_scene.add_child(proximo_nivel)
		Globais.fase_atual=1
		contador=1
	if Globais.fase_atual==4:
		if contador1==0:
			nivelAtual = main_game_scene.get_child(1)
			main_game_scene.remove_child(nivelAtual)
			nivelAtual.call_deferred("free")
			proximo = load("res://scenes/telaDeMorte.tscn")
			proximo_nivel = proximo.instantiate()
			main_game_scene.add_child(proximo_nivel)
			Globais.fase_atual=1
			contador1=1
	else:
		contador1=0

func _on_menu_inicio() -> void:
	nivelAtual = main_game_scene.get_node("Menu")
	main_game_scene.remove_child(nivelAtual)
	nivelAtual.call_deferred("free")
	proximo = load("res://scenes/first_stage.tscn")
	proximo_nivel = proximo.instantiate()
	main_game_scene.add_child(proximo_nivel)
	Globais.fase_atual=1


func _on_menu_opcoes() -> void:
	nivelAtual = main_game_scene.get_node("Menu")
	main_game_scene.remove_child(nivelAtual)
	nivelAtual.call_deferred("free")
	proximo = load("res://scenes/menuDeOpcoes.tscn")
	proximo_nivel = proximo.instantiate()
	main_game_scene.add_child(proximo_nivel)
	Globais.fase_atual=5


func _on_menu_fechar() -> void:
	get_tree().quit()


func _on_timer_fechar_timeout() -> void:
	get_tree().quit()
