extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -400.0

@export var hp : =3
var direction := 1

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	if is_on_floor():
		if is_on_wall():
			direction *= -1
		
		if direction == 1:
			$AnimatedSprite2D.flip_h = true
			velocity.x = direction * SPEED
		elif direction == -1:
			$AnimatedSprite2D.flip_h = false
			velocity.x = direction * SPEED
			
		if velocity.x != 0:
			$AnimatedSprite2D.play("run")

	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("AttackArea"):
		hp -= 1
		direction = 0
		$AnimatedSprite2D.play("hit")
		print("args array")
		await $AnimatedSprite2D.animation_finished
		direction = 1
