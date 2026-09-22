extends CharacterBody2D

var physics_enabled = false

func _physics_process(delta: float) -> void:
	if not is_on_floor() and physics_enabled:
		velocity += get_gravity() * delta

	move_and_slide()
