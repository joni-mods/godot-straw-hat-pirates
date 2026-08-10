extends Node2D

@export var minWaitTime = 2
@export var maxWaitTime = 6
@export var lookLeft = false
@export var cannonBallSpeed = 3
@export var cannonBallDamage = 1
@export var range = 500
@export var projectileType = Global.projectileTypes.CANNON_BALL
@export var fireEffect = true

func _ready() -> void:
	if(lookLeft == false):
		$AnimatedSprite.flip_h = true
		$FireEffect.position.x *= -1
		$FireEffect .flip_h = true
		
	while(true):
		randomize() 
		var waitTimer = randi_range(minWaitTime, maxWaitTime)
		await get_tree().create_timer(waitTimer).timeout
		fire()
		

func fire():
	$AnimatedSprite.play("fire")
	await get_tree().create_timer(0.2).timeout
	
	if fireEffect:
		$FireEffect.visible = true
		$FireEffect.play("fire")
	
	spawnProjectile()
	await get_tree().create_timer(0.3).timeout
	$FireEffect.visible = false
	
func spawnProjectile():
	var p = preload("res://Actors/projectile.tscn").instantiate()
	p.position = self.position
	p.cannonBallSpeed = cannonBallSpeed
	p.cannonBallDamage = cannonBallDamage
	p.range = range
	p.type = projectileType
	
	if (lookLeft == false):
		p.directionLeft = false
	
	get_parent().add_child(p)
	
