extends Node2D

@export var money: Node2D
@export var score: Node2D

@export var shop_or_double_down: Node2D

var waiting_for_transfer_complete = false


func transfer_all_to_money():
	waiting_for_transfer_complete = true
	money.adjust_by(score.get_amount())
	score.adjust_by(-score.get_amount())

func _process(_delta: float) -> void:
	if waiting_for_transfer_complete:
		if (money.amount_to_adjust_by == 0) and (score.amount_to_adjust_by == 0):
			waiting_for_transfer_complete = false
			_transfer_complete()

func _transfer_complete():
	shop_or_double_down.visible = true

func double_down():
	score.adjust_by(money.get_amount())
	money.adjust_by(-money.get_amount())
