extends Node2D
@onready var reload_timer: Timer = $"reload timer"
@onready var player: CharacterBody2D = %Player
@onready var camera_2d: Camera2D = $Player_manager/Camera2D
@onready var current_spawnpoint = Globais.player_spawn #verificar
@onready var killzone: Area2D = $Teclado/killzone
@onready var origin_spawnpoint: Marker2D = %origin_spawnpoint
@onready var teclas: Node2D = $teclas
@onready var tecla_s: Area2D = $teclas/TecladoS/teclaS
@onready var tecla_n: Area2D = $teclas/TecladoN/teclaN
@onready var tecla_a: Area2D = $teclas/TecladoA/teclaA
@onready var tecla_e: Area2D = $teclas/TecladoE/teclaE
@onready var tecla_h: Area2D = $teclas/TecladoH/teclaH
@onready var teclado_h: Sprite2D = $teclas/TecladoH
@onready var teclado_e: Sprite2D = $teclas/TecladoE
@onready var teclado_n: Sprite2D = $teclas/TecladoN
@onready var teclado_s: Sprite2D = $teclas/TecladoS
@onready var teclado_a: Sprite2D = $teclas/TecladoA
@onready var label_s: Label = $coisas_boss/Parallax2D/LabelS
@onready var label_e: Label = $coisas_boss/Parallax2D/LabelE
@onready var label_n: Label = $coisas_boss/Parallax2D/LabelN
@onready var label_h: Label = $coisas_boss/Parallax2D/LabelH
@onready var label_a: Label = $coisas_boss/Parallax2D/LabelA

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globais.player_spawn = origin_spawnpoint.position
	current_spawnpoint = origin_spawnpoint.position
	player.position = current_spawnpoint
	camera_2d.position = player.position
	Globais.fase_anterior=3
	teclas.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_reload_timer_timeout() -> void:
	player.can_ink = true 


func _on_deteccao_aparecer_teclas_body_entered(body: CharacterBody2D) -> void:
	teclas.visible = true


func _on_tecla_a_body_entered(body: CharacterBody2D) -> void:
	if teclas.visible==true:
		label_a.text = " A "
		teclado_a.visible = false


func _on_tecla_s_body_entered(body: CharacterBody2D) -> void:
	if teclas.visible==true:
		label_s.text = " S "
		teclado_s.visible = false

func _on_tecla_n_body_entered(body: CharacterBody2D) -> void:
	if teclas.visible==true:
		label_n.text = " N "
		teclado_n.visible = false


func _on_tecla_e_body_entered(body: CharacterBody2D) -> void:
	if teclas.visible==true:
		label_e.text = " E "
		teclado_e.visible = false


func _on_tecla_h_body_entered(body: CharacterBody2D) -> void:
	if teclas.visible==true:
		label_h.text = " H "
		teclado_h.visible = false
