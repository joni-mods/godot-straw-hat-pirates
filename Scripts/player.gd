extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -300.0

@onready var animation = $AnimatedSprite2D

var hasSword = false

func _physics_process(delta: float) -> void:
	var swordExtra = ""
	if hasSword:
		swordExtra = "_sword"

	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("run_left", "run_right")
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction and is_on_floor():	
		animation.flip_h = (direction != 1)
		animation.play("run" + swordExtra)
	elif velocity.y > 0:
		animation.play("fall" + swordExtra)
	elif velocity.y < 0:
		animation.play("jump" + swordExtra)		
	else:
		animation.play("idle" + swordExtra)

	move_and_slide()
