extends Node2D

var directionLeft = true
var cannonBallSpeed = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(directionLeft):
		self.position.x -= cannonBallSpeed
	else:
		self.position.x += cannonBallSpeed
			
