extends Node2D
@onready var node_opcoes: Node2D = $"."
@onready var menu_button: MenuButton = $MesaMenuPapel/MenuButton
@onready var texture_button: TextureButton = $TextureButton
@onready var tutorial: Node2D = $tutorial
@onready var voltar: TextureButton = $Voltar
@onready var tutorial_2: TextureButton = $tutorial2
@onready var id:int=0
@onready var mudar:bool=false
@onready var volume: TextureButton = $Volume
@onready var controles_volume: Node2D = $ControlesVolume
@onready var master_vol: HSlider = $ControlesVolume/MasterVol
@onready var musica_vol: HSlider = $ControlesVolume/MusicaVol
@onready var camera_2d: Camera2D = $Camera2D
signal fecharOpcoes
var contador_musga

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	master_vol.value = db_to_linear(Globais.master_bus)
	musica_vol.value = db_to_linear(Globais.musica_bus)
	menu_button.get_popup().add_item("1920x1080")
	menu_button.get_popup().add_item("960x540")
	menu_button.get_popup().add_item("640x360")
	menu_button.get_popup().id_pressed.connect(self._on_popup_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if node_opcoes.visible==true:
		if Globais.ligar_tutorial==true:
			node_opcoes.get_node("tutorial").visible = true
			Globais.ligar_tutorial=false
	#if camera_2d.enabled == true and contador_musga==0:
	#	master_vol.value = db_to_linear(Globais.master_bus)
	#	musica_vol.value = db_to_linear(Globais.musica_bus)
	#	contador_musga=1
	#else:
	#	contador_musga=0


func _on_popup_pressed(botao):
	if node_opcoes.visible==true:
		if botao==0:
			Globais.tamanho_tela=0
		elif botao==1:
			Globais.tamanho_tela=1
		else:
			Globais.tamanho_tela=2
		Globais.mudar_tamanho_tela=true
	


func _on_tutorial_2_pressed() -> void:
	controles_volume.visible = false
	if node_opcoes.visible==true:
		if tutorial.visible:
			controles_volume.visible = true
			tutorial.visible=false
		else:
			tutorial.visible=true
			controles_volume.visible = false


func _on_voltar_pressed() -> void:
	if node_opcoes.visible==true:
		Globais.voltar_jogo = true
	tutorial.visible = false
	controles_volume.visible = false


func _on_master_vol_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(Globais.master_bus, linear_to_db(value))
	#Globais.master_bus = value


func _on_musica_vol_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(Globais.musica_bus, linear_to_db(value))
	#Globais.musica_bus = value


#func _on_volume_pressed() -> void:
	#master_vol.value = db_to_linear(Globais.master_bus)
	#musica_vol.value = db_to_linear(Globais.musica_bus)
#	tutorial.visible = false
#	if node_opcoes.visible==true:
#		if controles_volume.visible:
#			controles_volume.visible = false
#		else:
#			controles_volume.visible=true
