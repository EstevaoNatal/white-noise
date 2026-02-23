extends Node2D
@onready var iniciar: Button = $Iniciar
@onready var opções: Button = $Opções
@onready var sair: Button = $Sair
signal inicio
signal opcoes
signal fechar
@onready var mão: Sprite2D = $Mão


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
