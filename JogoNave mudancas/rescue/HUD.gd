extends CanvasLayer

var pontos = 0

func _ready():
	$pontos.text = str(pontos)
	$combustivel.value = 100

func tomadano():
	pontos += 10
	$pontos.text = str(pontos)
	
func alterarcombustivel(valor):
	$combustivel.value = valor
