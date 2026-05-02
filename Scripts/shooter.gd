extends Node2D

@export var minWaitTime = 2
@export var maxWaitTime = 6
@export var lookLeft = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if(lookLeft == false):
		$Cannon.flip_h = true
		$FireEffect.position.x *= -1
		$FireEffect .flip_h = true
		
	while(true):
		randomize() 
		var waitTimer = randi_range(minWaitTime, maxWaitTime)
		await get_tree().create_timer(waitTimer).timeout
		fire()

func fire():
	$Cannon.play("fire")
	await get_tree().create_timer(0.2).timeout
	$FireEffect.visible = true
	$FireEffect.play("fire")
	await get_tree().create_timer(0.3).timeout
	$FireEffect.visible = false
	
