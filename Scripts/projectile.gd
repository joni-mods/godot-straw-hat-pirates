extends Node2D

var directionLeft = true
var cannonBallSpeed = 5
var cannonBallDamage = 1
var canMove = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if canMove:
		if(directionLeft):
			self.position.x -= cannonBallSpeed
		else:
			self.position.x += cannonBallSpeed
				
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.playerDamage(cannonBallDamage)
		canMove = false
		$AnimatedSprite2D.play("explosion")
		await get_tree().create_timer(0.3).timeout
		queue_free()
