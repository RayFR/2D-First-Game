extends Area2D

@onready var pistol = $"../Player/pistol"
@onready var animated_sprite = $AnimatedSprite2D

var inChestRange = false

func _on_body_entered(body):
	if body is Player:
		inChestRange = true
		
func _on_body_exited(body):
	if body is Player:
		inChestRange = false
		animated_sprite.play("closed")

func _physics_process(delta):
	
	if Input.is_action_just_pressed("pick") and inChestRange:
		pistol.visible = true
		animated_sprite.play("opened")
