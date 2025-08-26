extends Node2D

@export var texts: Array [Label]
@export var amount = 0


var amount_to_adjust_by = 0


func _process(_delta: float) -> void:
	if amount_to_adjust_by > 0:
		amount += 1;
		amount_to_adjust_by -= 1
	if amount_to_adjust_by < 0:
		amount -= 1;
		amount_to_adjust_by += 1

	for text in texts:
		text.text = str(amount)

func get_amount():
	return amount + amount_to_adjust_by

func adjust_by(adjust_amount):
	amount_to_adjust_by += adjust_amount


