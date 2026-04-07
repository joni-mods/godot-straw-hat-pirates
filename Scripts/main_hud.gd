extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$VBoxContainer/HBoxContainer/RedDiamondsValue.text = str(Global.redDiamonds)
	$VBoxContainer/HBoxContainer2/GoldCoinsValue.text = str(Global.goldCoins) 
	
