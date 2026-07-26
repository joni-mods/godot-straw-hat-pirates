extends Node2D

var directionLeft = true
var cannonBallSpeed = 5
var cannonBallDamage = 1
var canMove = true
var range = 500
var startX = 0
var type = Global.projectileTypes.CANNON_BALL

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startX = self.position.x

	if (type == 1):
		print("totem spike shot")
	else:
		print("cannnon ball shot")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if canMove:
		if(directionLeft):
			self.position.x -= cannonBallSpeed
			if startX - self.position.x > range:
				explode()
		else:
			self.position.x += cannonBallSpeed
			if self.position.x - startX > range:
				explode()
				
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.playerDamage(cannonBallDamage)
		explode()
		
func explode() -> void:
	canMove = false
	$AnimatedSprite2D.play("explosion")
	await get_tree().create_timer(0.3).timeout
	queue_free()
