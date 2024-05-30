extends Area2D

@onready var pistol = $"../Player/pistol"

func _on_body_entered(body):
	print("chest collided")
	pistol.visible = true
