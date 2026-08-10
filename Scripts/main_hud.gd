extends CanvasLayer

func _process(delta: float) -> void:
	$VBoxContainer/HBoxContainer/RedDiamondsValue.text = str(Global.redDiamonds)
	$VBoxContainer/HBoxContainer2/GoldCoinsValue.text = str(Global.goldCoins) 
	
