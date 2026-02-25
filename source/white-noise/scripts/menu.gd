extends Node2D
@onready var iniciar: Button = $Iniciar
@onready var opções: Button = $Opções
@onready var sair: Button = $Sair
@onready var menu: Node2D = $"."
@onready var comecar: TextureButton = $comecar
signal inicio
signal opcoes
signal fechar
@onready var mão: Sprite2D = $Mão
var contador=0
var contador1=0


func _ready() -> void:
	comecar.texture_normal = load("res://images/UI/btn_iniciar.png")
	comecar.texture_hover = load("res://images/objetos/carimbo.png")

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
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var carimbo = load("res://scenes/carimbo.tscn")
		var img_carimbo = carimbo.instantiate()
		img_carimbo.set_name("carimbo"+str(contador))
		img_carimbo.position = mouse_pos
		menu.add_child(img_carimbo)
		#menu.get_node("carimbo"+str(contador)).position = mouse_pos


func _on_texture_button_pressed() -> void:
	inicio.emit()
