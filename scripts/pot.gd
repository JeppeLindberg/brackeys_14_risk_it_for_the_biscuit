extends Node2D

@export var money: Node2D
@export var bet: Node2D
@export var winnings: Node2D

@export var shop_or_double_down: Node2D

var waiting_for_transfer_complete = false


func transfer_all_to_money():
	waiting_for_transfer_complete = true
	money.increase_by(bet.get_amount())
	money.increase_by(winnings.get_amount())
	bet.decrease_by(bet.get_amount())
	winnings.decrease_by(winnings.get_amount())

func transfer_bet_to_money():
	waiting_for_transfer_complete = true
	money.increase_by(bet.get_amount())
	bet.decrease_by(bet.get_amount())
	winnings.decrease_by(winnings.get_amount())

func _process(_delta: float) -> void:
	if waiting_for_transfer_complete:
		if (money.amount_to_decrease_by == 0) and (money.amount_to_increase_by == 0) and \
			(bet.amount_to_decrease_by == 0) and (bet.amount_to_increase_by == 0) and \
			(winnings.amount_to_decrease_by == 0) and (winnings.amount_to_increase_by == 0):

			waiting_for_transfer_complete = false
			_transfer_complete()

func _transfer_complete():
	shop_or_double_down.visible = true

func double_down():
	bet.increase_by(money.get_amount())
	winnings.increase_by(money.get_amount())
	money.decrease_by(money.get_amount())
