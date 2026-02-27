extends Node2D
@onready var current_spawnpoint = Globais.player_spawn
@onready var player: CharacterBody2D = %Player
@onready var ui_cargas: Node2D = %UI_Cargas
@onready var musica_segunda_fase: AudioStreamPlayer2D = $"Player_manager/Camera2D/musica segunda fase"
@onready var empilhadeira: AudioStreamPlayer2D = $Player_manager/Camera2D/empilhadeira
var contador=0
@onready var animation_player: AnimationPlayer = $caixas_levantadas/AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	contador=0
	player.position = current_spawnpoint
	Globais.fase_anterior = 2
	ui_cargas.get_node("icon").play("level2")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_killzone_body_entered(body: CharacterBody2D) -> void:
	Globais.fase_atual=4



func _on_reload_timer_timeout() -> void:
	player.can_ink = true


func _on_musica_segunda_fase_finished() -> void:
	musica_segunda_fase.playing = true


func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	if contador==0:
		empilhadeira.play()
		contador=1


func _on_baixar_empilhadeira_body_entered(body: CharacterBody2D) -> void:
	contador=0
	animation_player.play_backwards("subir")
	empilhadeira.play()
