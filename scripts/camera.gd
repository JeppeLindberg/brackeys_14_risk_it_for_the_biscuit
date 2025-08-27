extends Camera2D

@export var shop: Node2D
@export var available_cards: Node2D
@export var board: Node2D
@export var overlay: Node2D
@export var shop_or_double_down: Node2D
@export var hit_me_or_stay: Node2D


func go_to_shop():
	overlay.clear()
	available_cards.generate()
	global_position = shop.global_position

func go_to_board():
	overlay.clear()
	global_position = board.global_position
	shop_or_double_down.visible = false
	hit_me_or_stay.visible = true
