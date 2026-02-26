extends Node2D
@onready var iniciar: Button = $Iniciar
@onready var opções: Button = $Opções
@onready var sair: Button = $Sair
@onready var menu: Node2D = $"."
@onready var comecar: TextureButton = $comecar
@onready var menu_opcoes: TextureButton = $menuOpcoes
@onready var sair_jogo: TextureButton = $sairJogo
@onready var tempo_mouse: Timer = $tempoMouse
signal inicio
signal opcoes
signal fechar
@onready var mão: Sprite2D = $Mão
var contador=0
var contador1=0
var pode_carimbar=true


func _ready() -> void:
	comecar.texture_normal = load("res://images/UI/btn_iniciar.png")
	comecar.texture_hover = load("res://images/objetos/carimbo.png")
	menu_opcoes.texture_normal = load("res://images/UI/btn_opcoes.png")
	menu_opcoes.texture_hover = load("res://images/objetos/carimbo.png")
	sair_jogo.texture_normal = load("res://images/UI/btn_sair.png")
	sair_jogo.texture_hover = load("res://images/objetos/carimbo.png")

func _on_iniciar_pressed() -> void:
	inicio.emit()

func _on_opções_pressed() -> void:
	opcoes.emit()

func _on_sair_pressed() -> void:
	fechar.emit()

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	mão.position.x = mouse_pos.x+215
	mão.position.y = mouse_pos.y+131
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and pode_carimbar:
		tempo_mouse.start()
		var carimbo = load("res://scenes/carimbo.tscn")
		var img_carimbo = carimbo.instantiate()
		img_carimbo.set_name("carimbo"+str(contador))
		img_carimbo.position = mouse_pos
		menu.add_child(img_carimbo)
		pode_carimbar=false
		#menu.get_node("carimbo"+str(contador)).position = mouse_pos


func _on_texture_button_pressed() -> void:
	inicio.emit()


func _on_tempo_mouse_timeout() -> void:
	pode_carimbar=true


func _on_menu_opcoes_pressed() -> void:
	opcoes.emit()# Replace with function body.


func _on_sair_jogo_pressed() -> void:
	fechar.emit() # Replace with function body.
