extends Node2D

@export var hp = 1

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("AttackArea"):
		hp -= 1
		if hp > 0:
			$AnimatedSprite2D.play("hit")
		else:
			$AnimatedSprite2D.play("destroyed")
			$GPUParticles2D.emitting = true
			await $AnimatedSprite2D.animation_finished
			spawnRandomItem(self.position)
			queue_free()
		
func spawnRandomItem(targetLocation):
	var newItem = null
	randomize()
	var randomItemSpawner = randi_range(0,2)
	match (randomItemSpawner):
		1: newItem = preload("res://Actors/gold_coin.tscn")
		2: newItem = preload("res://Actors/red_diamond.tscn")

	if newItem != null:
		var newItemInstance = newItem.instantiate()
		newItemInstance.position = targetLocation
		get_parent().add_child(newItemInstance)
