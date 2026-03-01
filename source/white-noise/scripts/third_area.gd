extends Node2D
@onready var reload_timer: Timer = $"reload timer"
@onready var player: CharacterBody2D = %Player
@onready var camera_2d: Camera2D = $Player_manager/Camera2D
@onready var current_spawnpoint = Globais.player_spawn #verificar
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
@onready var ui_cargas: Node2D = %UI_Cargas
@onready var musica_terceira_fase: AudioStreamPlayer2D = $"Player_manager/Camera2D/musica terceira fase"
@onready var animation_player: AnimationPlayer = $livros/AnimationPlayer
@onready var animacao_copo: AnimationPlayer = $CopoCafePintadao/animacaoCopo
@onready var fala_1_audio: AudioStreamPlayer2D = $Player_manager/Camera2D/fala1audio
@onready var fala_2_audio: AudioStreamPlayer2D = $Player_manager/Camera2D/fala2audio
@onready var fala_3_audio: AudioStreamPlayer2D = $Player_manager/Camera2D/fala3audio
@onready var fala_4_audio: AudioStreamPlayer2D = $Player_manager/Camera2D/fala4audio
@onready var fala_5_audio: AudioStreamPlayer2D = $Player_manager/Camera2D/fala5audio
@onready var fala_6_audio: AudioStreamPlayer2D = $Player_manager/Camera2D/fala6audio
@onready var fala_7_audio: AudioStreamPlayer2D = $Player_manager/Camera2D/fala7audio
@onready var fala_8_audio: AudioStreamPlayer2D = $Player_manager/Camera2D/fala8audio
@onready var _5_segundos_constrangedores: Timer = $"5segundosConstrangedores"
@onready var livros_caindo: AudioStreamPlayer2D = $Player_manager/Camera2D/livrosCaindo
@onready var dica_depois_de_2_min: Timer = $dicaDepoisDe2Min
@onready var bossta: AnimatedSprite2D = $coisas_boss/Parallax2D/Bossta
@onready var livro_3: Sprite2D = $livros/Livro3
@onready var livro_4: Sprite2D = $livros/Livro4
@onready var livro_5: Sprite2D = $livros/Livro5
var contador1=0
var contador2=0
var contador3=0
var contador4=0
var contador5=0
var contador6=0
var contador7=0
var contador8=0
var contadorvol1=0
var contadorvol2=0
var tocar2=false
var tocar3=false
var tocar4=false
var tocar5=false
var tocar6=false
var tocar7=false
var tocar8=false
var terminou1=false
var terminou2=false
var terminou3=false
var terminou4=false
var terminou5=false
var terminou6=false
var pode_derrubar=false
var falando=true
var raiva=false
var triste=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.max_tinta=90
	player.contador_tinta=player.max_tinta
	Globais.player_spawn = origin_spawnpoint.position
	current_spawnpoint = origin_spawnpoint.position
	player.position = current_spawnpoint
	camera_2d.position = player.position
	Globais.fase_anterior=3
	teclas.visible = false
	ui_cargas.get_node("icon").play("level3")

#não precisa area 3, 8, 4

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if label_h.text == " H " && label_s.text == " S " && label_e.text == " E " && label_n.text == " N " && label_a.text == " A " && contador7==0:
		tocar4 = true
		livros_caindo.play()
		animation_player.play("cair")
		pode_derrubar = true
		livro_3.get_node("StaticBody2D").process_mode = livro_3.get_node("StaticBody2D").PROCESS_MODE_DISABLED
		livro_4.get_node("StaticBody2D").process_mode = livro_4.get_node("StaticBody2D").PROCESS_MODE_DISABLED
		livro_5.get_node("StaticBody2D").process_mode = livro_5.get_node("StaticBody2D").PROCESS_MODE_DISABLED
		contador7=1
	
	sentimentos()
	
	if contador1==0 && terminou1 && tocar2:
		falando=true
		raiva=true
		fala_2_audio.play()
		contador1=1
	if contador2==0 && terminou2 && tocar3:
		falando=true
		raiva = true
		fala_3_audio.play()
		contador2=1
	if contador3==0 && terminou3 && tocar4:
		falando=true
		triste=true
		fala_4_audio.play()
		contador3=1
	if contador4==0 && terminou4 && tocar5:
		falando=true
		raiva=true
		fala_5_audio.play()
		contador4=1
	if contador6==0 && terminou5 && tocar7:
		falando=true
		raiva=true
		fala_7_audio.play()
		contador6=1
	
	#print("terminou3: ", terminou3)
	#print("tocar4: ", tocar4)
	
func _on_reload_timer_timeout() -> void:
	player.can_ink = true 


func _on_deteccao_aparecer_teclas_body_entered(body: CharacterBody2D) -> void:
	if contador8==0:
		tocar3=true
		teclas.visible = true
		contador8=1


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


func _on_musica_terceira_fase_finished() -> void:
	musica_terceira_fase.playing = true

func _on_killzone_body_entered(body: CharacterBody2D) -> void:
	Globais.fase_atual = 4


func _on_copo_cafe_body_entered(body: CharacterBody2D) -> void:
	animacao_copo.play("derrubar")
	fala_1_audio.stop()
	fala_2_audio.stop()
	fala_3_audio.stop()
	fala_4_audio.stop()
	fala_5_audio.stop()
	fala_6_audio.stop()
	fala_7_audio.stop()
	fala_8_audio.play()
	triste = true
	falando=true

func _on_vrido_finished() -> void:
	fala_1_audio.play()


func _on_fala_1_audio_finished() -> void:
	falando=false
	terminou1=true


func _on_fala_2_audio_finished() -> void:
	falando=false
	terminou2=true


func _on_fala_3_audio_finished() -> void:
	falando=false
	terminou3=true


func _on_fala_4_audio_finished() -> void:
	falando=false
	_5_segundos_constrangedores.start()
	terminou4=true


func _on_fala_5_audio_finished() -> void:
	falando=false
	dica_depois_de_2_min.start()
	terminou5=true


func _on_fala_6_audio_finished() -> void:
	falando=false
	terminou6=true

func _on_fala_7_audio_finished() -> void:
	pass

func _on_fala_7_body_entered(body: CharacterBody2D) -> void:
	tocar7=true


func _on_segundos_constrangedores_timeout() -> void:
	tocar5=true


func _on_dica_depois_de_2_min_timeout() -> void:
	tocar6=true
	if contador5==0 && terminou5 && tocar6:
		falando = true
		fala_6_audio.play()
		contador5=1


func _on_fala_2_body_entered(body: Node2D) -> void:
	tocar2=true


func sentimentos():
	if not tocar8:
		if falando:
			contadorvol2=0
			if contadorvol1==0:
				#AudioServer.set_bus_volume_db(Globais.musica_bus, linear_to_db(AudioServer.get_bus_volume_linear(Globais.musica_bus)/5))
				contadorvol1=1
			if raiva:
				bossta.play("falando_raiva")
			else:
				bossta.play("falando")
		elif raiva:
			bossta.play("raiva")
		else:
			contadorvol1=0
			if contadorvol2==0:
				#AudioServer.set_bus_volume_db(Globais.musica_bus, linear_to_db(AudioServer.get_bus_volume_linear(Globais.musica_bus)*5))
				contadorvol2=1
			bossta.play("normal")
	else:
		bossta.play("triste triste")


func _on_fala_8_audio_finished() -> void:
	AudioServer.set_bus_volume_db(Globais.musica_bus, linear_to_db(AudioServer.get_bus_volume_linear(Globais.musica_bus)*5))
	Globais.fase_atual=8
