extends CharacterBody2D


const SPEED = 150.0
const ACCELERATION = 30.0
const JUMP_VELOCITY = -350.0
@onready var sprites: AnimatedSprite2D = $Sprites


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed(&"jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis(&"left", &"right")
	velocity.x = lerp(velocity.x, direction * SPEED, delta * ACCELERATION)
	handle_anim()
	move_and_slide()


func handle_anim():
	if is_on_floor():
		
		if abs(velocity.x) > 0.1:
			sprites.flip_h = velocity.x > 0.0
			sprites.play(&"walk")
		else:
			sprites.play(&"idle")
	else:
		sprites.play(&"jump")
