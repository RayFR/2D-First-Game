extends Area2D

class_name Pistol

func _process(delta):
	var mousePos = get_global_mouse_position()
	look_at(mousePos)
	
	if Input.is_action_just_pressed("shoot"):
		if visible:
			print("shoot")
			shoot()
	
	print(%ShootingPoint.position.y)

func shoot():
	const BULLET = preload("res://scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)


