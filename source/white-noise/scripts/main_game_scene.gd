extends Node2D
@onready var main_game_scene: Node2D = $"."
@onready var nivelAtual:Node
@onready var proximo:Resource
@onready var proximo_nivel
@onready var tamanhos_tela = [Vector2i(1920,1080),Vector2i(960,540),Vector2i(640,360)]
@onready var tamanho_atual=0
var contador=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("aumentar_tamanho_tela") or Input.is_action_just_pressed("diminuir_tamanho_tela"):
		if Input.is_action_just_pressed("aumentar_tamanho_tela") and tamanho_atual>0:
			tamanho_atual-=1
		if Input.is_action_just_pressed("diminuir_tamanho_tela") and tamanho_atual<tamanhos_tela.size()-1:
			tamanho_atual+=1
		DisplayServer.window_set_size(tamanhos_tela[tamanho_atual])
		print(tamanho_atual)

func _on_next_level_check_next_phase() -> void:
	nivelAtual = main_game_scene.get_node("first_area")
	main_game_scene.remove_child(nivelAtual)
	nivelAtual.call_deferred("free")
	proximo = load("res://scenes/first_stage.tscn")
	proximo_nivel = proximo.instantiate()
	main_game_scene.add_child(proximo_nivel)
