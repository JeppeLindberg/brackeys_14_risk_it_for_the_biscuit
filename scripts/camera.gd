extends Camera2D

@export var shop: Node2D
@export var available_cards: Node2D
@export var board: Node2D
@export var overlay: Node2D


func go_to_shop():
	overlay.clear()
	available_cards.generate()
	global_position = shop.global_position

func go_to_board():
	overlay.clear()
	global_position = board.global_position
