extends Node
@onready var player: CharacterBody2D = $Player
@onready var camera_2d: Camera2D = $Camera2D
@onready var tinta_escolhida: Label = %"Tinta escolhida"
var dead=false

var cor_atual = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera_2d.position = player.position
	if cor_atual == 0:
		tinta_escolhida.text = "preto"
	if cor_atual == 1:
		tinta_escolhida.text = "azul"
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(cor_atual)
	if player.get_node("CollisionShape2D"):
		camera_2d.position.x = player.position.x
		camera_2d.position.y = player.position.y-25
	
func _on_player_mudou_tinta(cor) -> void:
	cor_atual = cor
	if is_node_ready():
		_ready()
	#if cor_atual == 0:
	#	tinta_escolhida.text = "preto"
	#if cor_atual == 1:
	#	tinta_escolhida.text = "azul"
	
func _exit_tree() -> void:
	request_ready()
