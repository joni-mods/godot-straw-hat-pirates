extends Node2D

@export var hp = 5

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("FromPlayer"):
		hp -= 1
		print(hp)
		if hp > 0:
			$AnimatedSprite2D.play("hit")
		else:
			$AnimatedSprite2D.play("destroyed")
			$GPUParticles2D.emitting = true
			await $AnimatedSprite2D.animation_finished
			queue_free()
		
