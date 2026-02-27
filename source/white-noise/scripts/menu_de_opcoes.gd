extends Node2D
@onready var node_opcoes: Node2D = $"."
@onready var menu_button: MenuButton = $MesaMenuPapel/MenuButton
@onready var texture_button: TextureButton = $TextureButton
@onready var tutorial: Node2D = $tutorial
@onready var voltar: TextureButton = $Voltar
@onready var tutorial_2: TextureButton = $tutorial2
@onready var id:int=0
@onready var mudar:bool=false
signal fecharOpcoes

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	menu_button.get_popup().add_item("1920x1080")
	menu_button.get_popup().add_item("960x540")
	menu_button.get_popup().add_item("640x360")
	menu_button.get_popup().id_pressed.connect(self._on_popup_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_popup_pressed(botao):
	if botao==0:
		Globais.tamanho_resolucao=0
	elif botao==1:
		Globais.tamanho_resolucao=1
	else:
		Globais.tamanho_resolucao=2
	Globais.mudar_tamanho_tela=true
	


func _on_tutorial_2_pressed() -> void:
	if tutorial.visible:
		tutorial.visible = false
	else:
		tutorial.visible=true


func _on_voltar_pressed() -> void:
	fecharOpcoes.emit()
