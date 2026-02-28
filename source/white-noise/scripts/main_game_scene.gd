extends Node2D
@onready var main_game_scene: Node2D = $"."
@onready var nivelAtual:Node
@onready var proximo:Resource
@onready var proximo_nivel
@onready var tamanhos_tela = [Vector2i(1920,1080),Vector2i(960,540),Vector2i(640,360)]
@onready var tamanho_atual=0
@onready var timer_fechar: Timer = $timer_fechar
@onready var menu: Node2D = $Menu
@onready var node_opcoes: Node2D = $NodeOpcoes
var contador=0
var contador1=0
var contador2=0
var contador3=0
var contador4=0
var contador11=0
var contador22=0
var contador33=0
var contador8=0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DisplayServer.window_set_size(Globais.tamanho_resolucao)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#if Globais.abrir_menu==true:
	#	if Globais.fase_anterior==0:
	#		menu.visible=true
	#		node_opcoes.visible=false
	#		Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	#	else:
	#		Globais.fase_atual=Globais.fase_anterior
	#	Globais.abrir_menu=false
	
	#print("qtd nodes: " , main_game_scene.get_child_count())
	#print("fase atual e fase anterior: ", Globais.fase_atual," ", Globais.fase_anterior)
	
	if Globais.voltar_jogo == true:
		Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
		contador11=0
		contador22=0
		contador33=0
		if Globais.fase_anterior==0:
			menu.visible = true
			node_opcoes.visible = false
		if Globais.fase_anterior==1 && contador11==0 && Globais.fase_atual!=4:
			#main_game_scene.get_node("Menu").get_node("Camera2D").enabled = false
			main_game_scene.get_node("NodeOpcoes").get_node("Camera2D").enabled = false
			nivelAtual = main_game_scene.get_child(-1)
			main_game_scene.remove_child(nivelAtual)
			nivelAtual.call_deferred("free")
			proximo = load("res://scenes/first_stage.tscn")
			proximo_nivel = proximo.instantiate()
			main_game_scene.add_child(proximo_nivel)
			main_game_scene.get_node("NodeOpcoes").visible = false
			contador11=1
		else:
			contador11=0
		if Globais.fase_anterior==2 && contador22==0 && Globais.fase_atual!=4:
			#main_game_scene.get_node("Menu").get_node("Camera2D").enabled = false
			main_game_scene.get_node("NodeOpcoes").get_node("Camera2D").enabled = false
			nivelAtual = main_game_scene.get_child(-1)
			main_game_scene.remove_child(nivelAtual)
			nivelAtual.call_deferred("free")
			proximo = load("res://scenes/second_area.tscn")
			proximo_nivel = proximo.instantiate()
			main_game_scene.add_child(proximo_nivel)
			main_game_scene.get_node("NodeOpcoes").visible = false
			contador22=1
		else:
			contador22=0
		if Globais.fase_anterior==3 && contador33==0 && Globais.fase_atual!=4:
			#main_game_scene.get_node("Menu").get_node("Camera2D").enabled = false
			main_game_scene.get_node("NodeOpcoes").get_node("Camera2D").enabled = false
			nivelAtual = main_game_scene.get_child(-1)
			main_game_scene.remove_child(nivelAtual)
			nivelAtual.call_deferred("free")
			proximo = load("res://scenes/third_area.tscn")
			proximo_nivel = proximo.instantiate()
			main_game_scene.add_child(proximo_nivel)
			main_game_scene.get_node("NodeOpcoes").visible = false
			contador33=1
		else:
			contador33=0
		
		Globais.voltar_jogo = false
	
	#print("fase atual: ", Globais.fase_atual)
	
	if Input.is_action_just_pressed("close_game") && Globais.fase_atual!=8 && Globais.fase_atual!=4 && Globais.fase_atual!=0 && main_game_scene.get_node("NodeOpcoes").get_node("Camera2D").enabled == false: #abre menu de opcoes
		main_game_scene.get_node("NodeOpcoes").get_node("Camera2D").enabled = true
		nivelAtual = main_game_scene.get_child(-1)
		main_game_scene.remove_child(nivelAtual)
		nivelAtual.call_deferred("free")
		proximo = load("res://scenes/menuDeOpcoes.tscn")
		proximo_nivel = proximo.instantiate()
		main_game_scene.add_child(proximo_nivel)
		#Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if Input.is_action_pressed("close_game") and contador4==0: #fecha o jogo dps de 3 segundos
		timer_fechar.start()
		contador4=1
	if Input.is_action_just_released("close_game"):
		timer_fechar.stop()
		contador4=0
	#if Input.is_action_just_pressed("aumentar_tamanho_tela") or Input.is_action_just_pressed("diminuir_tamanho_tela") or Globais.mudar_tamanho_tela:
	#	if (Input.is_action_just_pressed("aumentar_tamanho_tela") or get_node("menuDeOpcoes").id==1) and tamanho_atual>0:
	#		tamanho_atual-=1
	#	if (Input.is_action_just_pressed("diminuir_tamanho_tela") or get_node("menuDeOpcoes").id==0) and tamanho_atual<tamanhos_tela.size()-1:
	#		tamanho_atual+=1
	if Globais.mudar_tamanho_tela==true:
		DisplayServer.window_set_size(tamanhos_tela[Globais.tamanho_tela])
		Globais.mudar_tamanho_tela=false
	if Globais.fase_atual==1: #fase escritório
		#print("contador: ", contador)
		if contador==0:
			if not Globais.abrir_menu:
				Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
				nivelAtual = main_game_scene.get_child(-1)
				main_game_scene.remove_child(nivelAtual)
				nivelAtual.call_deferred("free")
			proximo = load("res://scenes/first_stage.tscn")
			proximo_nivel = proximo.instantiate()
			main_game_scene.add_child(proximo_nivel)
			contador=1
	else: #verificar
		contador=0
	if Globais.fase_atual==2: #fase fábrica
		if contador1==0:
			if not Globais.abrir_menu:
				Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
				nivelAtual = main_game_scene.get_child(-1)
				main_game_scene.remove_child(nivelAtual)
				nivelAtual.call_deferred("free")
			proximo = load("res://scenes/second_area.tscn")
			proximo_nivel = proximo.instantiate()
			main_game_scene.add_child(proximo_nivel)
			contador1=1
	else: #verificar
		contador1=0
	#if Globais.fase_atual==-1 && contador3==0: #transição op
	#	nivelAtual = main_game_scene.get_child(1)
	#	main_game_scene.remove_child(nivelAtual)
	#	nivelAtual.call_deferred("free")
	#	proximo = load("res://scenes/menu.tscn")
	#	proximo_nivel = proximo.instantiate()
	#	main_game_scene.add_child(proximo_nivel)
	#	Globais.fase_atual=0
	if Globais.fase_atual==3: #fase boss
		if contador2==0:
			if not Globais.abrir_menu:
				Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
				nivelAtual = main_game_scene.get_child(-1)
				main_game_scene.remove_child(nivelAtual)
				nivelAtual.call_deferred("free")
			proximo = load("res://scenes/third_area.tscn")
			proximo_nivel = proximo.instantiate()
			main_game_scene.add_child(proximo_nivel)
			contador2=1
	else:
		contador2=0
	if Globais.fase_atual==4: #tela de morte
		if contador3==0:
			Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
			nivelAtual = main_game_scene.get_child(-1)
			main_game_scene.remove_child(nivelAtual)
			nivelAtual.call_deferred("free")
			proximo = load("res://scenes/telaDeMorte.tscn")
			proximo_nivel = proximo.instantiate()
			main_game_scene.add_child(proximo_nivel)
			contador3=1
	else:
		contador3=0
	if Globais.fase_atual==8: #creditos
		if contador8==0:
			Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
			nivelAtual = main_game_scene.get_child(-1)
			main_game_scene.remove_child(nivelAtual)
			nivelAtual.call_deferred("free")
			proximo = load("res://scenes/creditos.tscn")
			proximo_nivel = proximo.instantiate()
			main_game_scene.add_child(proximo_nivel)
			contador8=1
	else:
		contador8=0

func _on_menu_inicio() -> void:
	node_opcoes.visible = false
	main_game_scene.get_node("NodeOpcoes").get_node("Camera2D").enabled = false
	nivelAtual = main_game_scene.get_node("Menu")
	main_game_scene.remove_child(nivelAtual)
	nivelAtual.call_deferred("free")
	proximo = load("res://scenes/first_stage.tscn")
	proximo_nivel = proximo.instantiate()
	main_game_scene.add_child(proximo_nivel)
	Globais.fase_atual=1
	contador=1


func _on_menu_opcoes() -> void:
	menu.visible=false
	node_opcoes.visible=true
	#Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _on_menu_fechar() -> void:
	get_tree().quit()


func _on_timer_fechar_timeout() -> void:
	get_tree().quit()


func _on_node_opcoes_fechar_opcoes() -> void:
	if Globais.fase_anterior==0:
		menu.visible=true
		node_opcoes.visible=false
		Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	else:
		Globais.fase_atual=Globais.fase_anterior
