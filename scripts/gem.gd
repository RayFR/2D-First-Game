extends Area2D

@onready var game_manager = %GameManager

func _on_body_entered(body):
	game_manager.gemCounter()
	print("gem gem gem")
	queue_free()
	
