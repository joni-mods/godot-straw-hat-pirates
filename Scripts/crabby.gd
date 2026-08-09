extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -400.0

var direction := 1

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	if is_on_floor():
		if is_on_wall():
			print("autsch!")
			direction *= -1
		
		if direction == 1:
			$AnimatedSprite2D.flip_h = true
			velocity.x = direction * SPEED
		else:
			$AnimatedSprite2D.flip_h = false
			velocity.x = direction * SPEED
			
		if velocity.x != 0:
			$AnimatedSprite2D.play("run")

	move_and_slide()
