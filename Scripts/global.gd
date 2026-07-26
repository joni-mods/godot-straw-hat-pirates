extends Node

var redDiamonds = 0
var goldCoins = 0 

enum projectileTypes {CANNON_BALL, TOTEM_SPIKE}

func playerDamage(value):
	print("damage: " + str(value))

func addRedDiamond():
	redDiamonds += 1

func removeRedDiamond():
	redDiamonds -= 1

func addGoldCoin():
	goldCoins += 1

func removeGoldCoin():
	goldCoins -= 1
