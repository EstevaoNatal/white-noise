extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globais.fase_atual = 4
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_reiniciar_pressed() -> void:
	print(Globais.fase_anterior, " ", Globais.fase_atual)
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	if Globais.fase_anterior==1:
		Globais.fase_atual=1
	elif Globais.fase_anterior==2:
		Globais.fase_atual=2
	elif Globais.fase_anterior==3:
		Globais.fase_atual=3


func _on_fechar_pressed() -> void:
	get_tree().quit()
