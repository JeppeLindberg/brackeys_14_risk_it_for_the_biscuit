extends Node2D



func _process(delta: float) -> void:
	var cards = get_children()
	cards.sort_custom(sort_cards)

	var i = 0
	for card in cards:
		card.global_position = card.global_position.move_toward(global_position + Vector2(0.0,18.0) * i, delta * 300.0)
		i += 1

func sort_cards(a, b):
	var modulated_a = a.sort_order
	if modulated_a < 0:
		modulated_a += 1000
	var modulated_b = b.sort_order
	if modulated_b < 0:
		modulated_b += 1000
	if modulated_a < modulated_b:
		return true