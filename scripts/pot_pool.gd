extends Node2D

@export var text: Label

var amount_to_decrease_by = 0
var amount_to_increase_by = 0


func _process(_delta: float) -> void:
	if amount_to_decrease_by > 0:
		text.text = str(get_amount() - 1)
		amount_to_decrease_by -= 1
	if amount_to_increase_by > 0:
		text.text = str(get_amount() + 1)
		amount_to_increase_by -= 1

func get_amount():
	return int(text.text)

func decrease_by(amount):
	amount_to_decrease_by += amount

func increase_by(amount):
	amount_to_increase_by += amount

