extends Node2D

@export var money: Node2D
@export var bet: Node2D
@export var winnings: Node2D

@export var shop_or_double_down: Node2D

var waiting_for_transfer_complete = false


func transfer_all_to_money():
	waiting_for_transfer_complete = true
	money.adjust_by(bet.get_amount())
	money.adjust_by(winnings.get_amount())
	bet.adjust_by(-bet.get_amount())
	winnings.adjust_by(-winnings.get_amount())

func transfer_bet_to_money():
	waiting_for_transfer_complete = true
	money.adjust_by(bet.get_amount())
	bet.adjust_by(-bet.get_amount())
	winnings.adjust_by(-winnings.get_amount())

func _process(_delta: float) -> void:
	if waiting_for_transfer_complete:
		if (money.amount_to_adjust_by == 0) and (bet.amount_to_adjust_by == 0) and (winnings.amount_to_adjust_by == 0):
			waiting_for_transfer_complete = false
			_transfer_complete()

func _transfer_complete():
	shop_or_double_down.visible = true

func double_down():
	bet.adjust_by(money.get_amount())
	winnings.adjust_by(money.get_amount())
	money.adjust_by(-money.get_amount())

func start_new_battle():
	if money.get_amount() < 9:
		money.adjust_by(9 - money.get_amount())
