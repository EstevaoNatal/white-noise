extends Node2D
@onready var current_spawnpoint = Globais.player_spawn
@onready var player: CharacterBody2D = %Player
@onready var ui_cargas: Node2D = %UI_Cargas
@onready var musica_segunda_fase: AudioStreamPlayer2D = $"Player_manager/Camera2D/musica segunda fase"
@onready var empilhadeira: AudioStreamPlayer2D = $Player_manager/Camera2D/empilhadeira
var contador=0
@onready var animation_player: AnimationPlayer = $caixas_levantadas/AnimationPlayer
@onready var fala_1_fase_2: AudioStreamPlayer2D = $"Player_manager/Camera2D/fala1 fase2"
@onready var fala_2_fase_2: AudioStreamPlayer2D = $"Player_manager/Camera2D/fala2 fase2"
@onready var fala_3_fase_2: AudioStreamPlayer2D = $"Player_manager/Camera2D/fala3 fase2"
@onready var fala_4_fase_2: AudioStreamPlayer2D = $"Player_manager/Camera2D/fala4 fase2"
@onready var fala_5_fase_2: AudioStreamPlayer2D = $"Player_manager/Camera2D/fala5 fase2"
var contador1=0
var contador2=0
var contador3=0
var contador4=0
var contador5=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.max_tinta=90
	player.contador_tinta=player.max_tinta
	musica_segunda_fase.play()
	contador=0
	player.position = current_spawnpoint
	Globais.fase_anterior = 2
	ui_cargas.get_node("icon").play("level2")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if contador4==0 && Globais.terminou4_2 && Globais.tocar5_2:
		fala_5_fase_2.play()
		AudioServer.set_bus_volume_db(Globais.musica_bus, linear_to_db(AudioServer.get_bus_volume_linear(Globais.musica_bus)/5))
		contador4=1
		Globais.terminou1_2=false
		Globais.terminou2_2=false
		Globais.terminou3_2=false
	elif contador3==0 && Globais.terminou3_2 && Globais.tocar4_2:
		fala_4_fase_2.play()
		AudioServer.set_bus_volume_db(Globais.musica_bus, linear_to_db(AudioServer.get_bus_volume_linear(Globais.musica_bus)/5))
		contador3=1
		Globais.terminou1_2=false
		Globais.terminou2_2=false
	elif contador2==0 && Globais.terminou2_2 && Globais.tocar3_2:
		fala_3_fase_2.play()
		AudioServer.set_bus_volume_db(Globais.musica_bus, linear_to_db(AudioServer.get_bus_volume_linear(Globais.musica_bus)/5))
		contador2=1
		Globais.terminou1_2=false
	elif contador1==0 && Globais.terminou1_2 && Globais.tocar2_2:
		fala_2_fase_2.play()
		AudioServer.set_bus_volume_db(Globais.musica_bus, linear_to_db(AudioServer.get_bus_volume_linear(Globais.musica_bus)/5))
		contador1=1
		Globais.tocar1_2=false
	elif Globais.tocar1_2 && contador5==0:
		fala_1_fase_2.play()
		AudioServer.set_bus_volume_db(Globais.musica_bus, linear_to_db(AudioServer.get_bus_volume_linear(Globais.musica_bus)/5))
		contador5=1


func _on_killzone_body_entered(body: CharacterBody2D) -> void:
	Globais.fase_atual=4



func _on_reload_timer_timeout() -> void:
	player.can_ink = true


func _on_musica_segunda_fase_finished() -> void:
	musica_segunda_fase.playing = true


func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	Globais.tocar3_2=true
	if contador==0:
		empilhadeira.play()
		contador=1


func _on_baixar_empilhadeira_body_entered(body: CharacterBody2D) -> void:
	contador=0
	animation_player.play_backwards("subir")
	empilhadeira.play()


func _on_fala_2_body_entered(body: CharacterBody2D) -> void:
	Globais.tocar2_2=true


func _on_fala_3_body_entered(body: CharacterBody2D) -> void:
	Globais.tocar3_2=true

func _on_fala_4_body_entered(body: CharacterBody2D) -> void:
	Globais.tocar4_2=true


func _on_fala_1_fase_2_finished() -> void:
	AudioServer.set_bus_volume_db(Globais.musica_bus, linear_to_db(AudioServer.get_bus_volume_linear(Globais.musica_bus)*5))
	Globais.terminou1_2=true # Replace with function body.


func _on_fala_5_body_entered(body: Node2D) -> void:
	Globais.tocar5_2=true


func _on_fala_2_fase_2_finished() -> void:
	AudioServer.set_bus_volume_db(Globais.musica_bus, linear_to_db(AudioServer.get_bus_volume_linear(Globais.musica_bus)*5))
	Globais.terminou2_2=true


func _on_fala_3_fase_2_finished() -> void:
	AudioServer.set_bus_volume_db(Globais.musica_bus, linear_to_db(AudioServer.get_bus_volume_linear(Globais.musica_bus)*5))
	Globais.terminou3_2=true


func _on_fala_4_fase_2_finished() -> void:
	AudioServer.set_bus_volume_db(Globais.musica_bus, linear_to_db(AudioServer.get_bus_volume_linear(Globais.musica_bus)*5))
	Globais.terminou4_2=true


func _on_fala_5_fase_2_finished() -> void:
	AudioServer.set_bus_volume_db(Globais.musica_bus, linear_to_db(AudioServer.get_bus_volume_linear(Globais.musica_bus)*5))
