extends CharacterBody2D

class_name Player
@onready var animated_sprite = $AnimatedSprite2D
@onready var pistolSprite = $pistol/Sprite
@onready var pistol = $pistol

const SPEED = 125.0
const JUMP_VELOCITY = -300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") # Get the gravity from the project settings to be synced with RigidBody nodes.

func _ready():
	pistol.visible = false

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta 	# Add the gravity.
		
	# Player input code
		
	if Input.is_action_just_pressed("jump") and is_on_floor(): # Handle jump.
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("move_left", "move_right") 	# Get the input direction and handle the movement/deceleration.
		
	if Input.is_action_just_pressed("drop"):
		pistol.visible = false
	
	# Flips the sprite based on mouse pos
	
	if get_global_mouse_position().x > position.x:
		animated_sprite.flip_h = false
		pistolSprite.flip_v = false
		pistol.position.x = 5
		pistol.position.y = -5
	elif get_global_mouse_position().x < position.x:
		animated_sprite.flip_h = true
		pistolSprite.flip_v = true
		pistol.position.x = -3
		pistol.position.y = -5

	# Play animations
	
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	# Applys the movement in different directions
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
	
