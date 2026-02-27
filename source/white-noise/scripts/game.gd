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

var jogador = preload("res://scenes/player.tscn")

# Called when the node enters the scene tree for the first time. # Replace with function body.

func _ready() -> void:
	player.position = current_spawnpoint
	camera_2d.position = player.position
	print(DisplayServer.screen_get_size())
	Globais.fase_anterior = 1

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

func _on_area_2d_body_entered(body: Node2D) -> void:
	porta.visible = true
	porta_abrindo.play()
	carimbando.play()
