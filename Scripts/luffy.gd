extends CharacterBody2D

const SPEED = 300.0
const JUMP_FORCE = 300.0

@onready var sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -JUMP_FORCE
	
	var direction = Input.get_axis("run_left", "run_right")
	if direction != 0:
		sprite.flip_h = (direction == -1)
	
	velocity.x = direction * SPEED
	move_and_slide()
	
	update_animation(direction)
	
func update_animation(direction) -> void:
	if is_on_floor():
		if direction == 0:
			sprite.play("idle")
		else:	
			sprite.play("run")
	else:
		if velocity.y < 0:
			sprite.play("jump")
		else:
			sprite.play("fall")
