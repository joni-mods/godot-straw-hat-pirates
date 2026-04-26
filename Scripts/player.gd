extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animation = $AnimatedSprite2D

var hasSword = false
var isAttacking = false
var toggleAttack = false

func checkAttack():
	if Input.is_action_just_pressed("ui_stab") || Input.is_action_just_pressed("ui_slash") || Input.is_action_just_pressed("ui_strike"):
		isAttacking = true
		$StabArea/CollisionShape2D.disabled = false
		if Input.is_action_just_pressed("ui_stab"):		
			animation.play("stab")
		elif Input.is_action_just_pressed("ui_slash"):
			animation.play("slash")
		elif Input.is_action_just_pressed("ui_strike"):
			animation.play("strike")
		if animation.flip_h:
			$StabArea/CollisionShape2D.position.x *= -1
			toggleAttack = true

func _physics_process(delta: float) -> void:
	var swordExtra = ""
	if hasSword:
		swordExtra = "_sword"

	# gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	if isAttacking == false:
		# jump  
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# run 
		var direction := Input.get_axis("run_left", "run_right")
		if direction != 0:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
		# change facing
		if direction:
			animation.flip_h = (direction != 1)
		
		# play animations	
		if direction and is_on_floor():	
			animation.play("run" + swordExtra)
		elif velocity.y > 0:
			animation.play("fall" + swordExtra)
		elif velocity.y < 0:
			animation.play("jump" + swordExtra)		
		else:
			animation.play("idle" + swordExtra)

	if hasSword:
		checkAttack()
	
	move_and_slide()

func _on_animated_sprite_2d_animation_finished() -> void:
	isAttacking = false
	$StabArea/CollisionShape2D.disabled = true
	if toggleAttack:
		$StabArea/CollisionShape2D.position.x *= -1
		toggleAttack = false
	
