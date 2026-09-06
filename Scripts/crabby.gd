extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -400.0

@export var hp : =3
var direction := 1
var isDead := false
var playerInDamageZone = false

func _ready():
	checkStatus()

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	if !isDead && is_on_floor():
		if is_on_wall():
			direction *= -1
		
		if direction == 1:
			$AnimatedSprite2D.flip_h = true
		elif direction == -1:
			$AnimatedSprite2D.flip_h = false

		velocity.x = direction * SPEED

	move_and_slide()

func run():
	$AnimatedSprite2D.play("run")

func checkStatus():
	if hp <= 0:
		isDead = true
		direction = 0
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.play("death")
		await get_tree().create_timer(1).timeout
		queue_free()
	else:
		run()
	
func _on_animated_sprite_2d_animation_finished() -> void:
	checkStatus()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if !isDead && area.is_in_group("AttackArea"):
		hp -= 1
		direction = 0
		$AnimatedSprite2D.play("hit")
		print("die!")
		await get_tree().create_timer(1).timeout
		direction = 1
		checkStatus()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if !isDead and body.is_in_group("Player"):
		print("danger!")
		playerInDamageZone = true
		checkStatus()
