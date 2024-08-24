extends Area2D

func _ready():
	pass

func _on_Combustvel_body_entered(body):
 # Replace with function body.
	if body.name == "Player":  # Supondo que a nave se chama "Player"
		get_parent().collect_battery(self)
