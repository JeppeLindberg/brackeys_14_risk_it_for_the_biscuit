extends Node2D

@export var price_text: Label

@onready var main = get_node('/root/main')
@onready var money = main.money


func set_price(new_price):
	price_text.text = str(new_price)

func _get_price():
	return int(price_text.text)


func can_buy():
	if money.get_amount() >= _get_price():
		money.adjust_by(-_get_price())
		return true
	else:
		return false
