extends Node2D
@onready var player: CharacterBody2D = $Player_manager/Player
@onready var platforms: Node = $platforms
@onready var cargas_de_tinta: Label = %"Cargas de tinta"
@onready var origin_spawnpoint: Marker2D = $spawnpoints/origin_spawnpoint
@onready var player_manager: Node = $Player_manager
@onready var current_spawnpoint = Globais.player_spawn
@onready var camera_2d: Camera2D = $Player_manager/Camera2D
@onready var first_area: Node2D = $"."
@onready var musica_primeira_fase: AudioStreamPlayer2D = $"Player_manager/Camera2D/musica primeira fase"
signal load_second_level
@onready var porta: Node2D = $Porta
@onready var porta_abrindo: AudioStreamPlayer2D = $"Player_manager/Camera2D/porta abrindo"
@onready var carimbando: AudioStreamPlayer2D = $Player_manager/Camera2D/carimbando
@onready var fala_2_fase_1: AudioStreamPlayer2D = $"Player_manager/Camera2D/fala2 fase1"
@onready var fala_1_fase_1: AudioStreamPlayer2D = $"Player_manager/Camera2D/fala1 fase1"
@onready var fala_3_fase_1: AudioStreamPlayer2D = $"Player_manager/Camera2D/fala3 fase1"
@onready var fala_4_fase_1: AudioStreamPlayer2D = $"Player_manager/Camera2D/fala4 fase 1"
@onready var fala_5_fase_1: AudioStreamPlayer2D = $"Player_manager/Camera2D/fala5 fase1"
var contador1=0
var contador2=0
var contador3=0
var contador4=0
var tocar2=false
var tocar3=false
var tocar4=false
var tocar5=false
var terminou1=false
var terminou2=false
var terminou3=false
var terminou4=false


var jogador = preload("res://scenes/player.tscn")

# Called when the node enters the scene tree for the first time. # Replace with function body.

func _ready() -> void:
	player.position = current_spawnpoint
	camera_2d.position = player.position
	print(DisplayServer.screen_get_size())
	Globais.fase_anterior = 1
	
func _process(delta: float) -> void:
	if contador1==0 && terminou1 && tocar2:
		fala_2_fase_1.play()
		AudioServer.set_bus_volume_db(Globais.musica_bus, linear_to_db(AudioServer.get_bus_volume_linear(Globais.musica_bus)/5))
		contador1=1
	if contador2==0 && terminou2 && tocar3:
		fala_3_fase_1.play()
		AudioServer.set_bus_volume_db(Globais.musica_bus, linear_to_db(AudioServer.get_bus_volume_linear(Globais.musica_bus)/5))
		contador2=1
	if contador3==0 && terminou3 && tocar4:
		fala_4_fase_1.play()
		AudioServer.set_bus_volume_db(Globais.musica_bus, linear_to_db(AudioServer.get_bus_volume_linear(Globais.musica_bus)/5))
		contador3=1
	if contador4==0 && terminou4 && tocar5:
		fala_5_fase_1.play()
		AudioServer.set_bus_volume_db(Globais.musica_bus, linear_to_db(AudioServer.get_bus_volume_linear(Globais.musica_bus)/5))
		contador4=1
	

func _on_player_ready() -> void:
	pass # Replace with function body.

#func _on_platforms_cargas() -> void:
	#get_node("Player_manager/Player").diminuir_cargas = true
	#cargas_de_tinta.text = "Cargas tem:" + str()



func _on_reload_timer_timeout() -> void:
	player.can_ink = true


func _on_killzone_body_entered(body: CharacterBody2D) -> void:
	Globais.fase_atual=4


func _on_musica_primeira_fase_finished() -> void:
	musica_primeira_fase.playing = true

func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	porta.visible = true
	porta_abrindo.play()
	carimbando.play()
	tocar4=true


func _on_fala_1_fase_1_finished() -> void:
	musica_primeira_fase.play()
	terminou1=true


func _on_tocar_fala_2_body_entered(body: CharacterBody2D) -> void:
	tocar2=true


func _on_fala_2_fase_1_finished() -> void:
	terminou2=true
	AudioServer.set_bus_volume_db(Globais.musica_bus, linear_to_db(AudioServer.get_bus_volume_linear(Globais.musica_bus)*5))


func _on_fala_3_fase_1_finished() -> void:
	terminou3=true
	AudioServer.set_bus_volume_db(Globais.musica_bus, linear_to_db(AudioServer.get_bus_volume_linear(Globais.musica_bus)*5))


func _on_fala_4_fase_1_finished() -> void:
	terminou4=true
	AudioServer.set_bus_volume_db(Globais.musica_bus, linear_to_db(AudioServer.get_bus_volume_linear(Globais.musica_bus)*5))


func _on_fala_5_fase_1_finished() -> void:
	AudioServer.set_bus_volume_db(Globais.musica_bus, linear_to_db(AudioServer.get_bus_volume_linear(Globais.musica_bus)*5))
	#terminou5=true


func _on_tocar_fala_3_body_entered(body: CharacterBody2D) -> void:
	tocar3=true


func _on_tocar_fala_5_body_entered(body: Node2D) -> void:
	tocar5=true
