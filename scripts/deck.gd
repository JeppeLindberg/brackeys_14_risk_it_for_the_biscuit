extends Node2D

@export var draw_pile: Node2D
@export var player_hand: Node2D
@export var dealer_hand: Node2D
@export var player_score: Node2D
@export var dealer_score: Node2D
@export var overlay: Node2D

@export var dealer_draw_cooldown: Timer

var dealer_is_drawing = false



func draw_player():
	if dealer_is_drawing:
		return

	var draw_index = _get_draw_index()

	var new_card = draw_pile.get_child(draw_index).get_hand_card().instantiate()
	player_hand.add_child(new_card)
	new_card.global_position = global_position
	draw_pile.get_child(draw_index).drawn = true

	if player_score.get_score() > 21:
		overlay.activate_player_is_bust()

func begin_draw_dealer():
	dealer_is_drawing = true

	dealer_draw_cooldown.start()

func _draw_dealer():
	if not dealer_is_drawing:
		return

	var draw_index = _get_draw_index()

	var new_card = draw_pile.get_child(draw_index).get_hand_card().instantiate()
	dealer_hand.add_child(new_card)
	new_card.global_position = global_position
	draw_pile.get_child(draw_index).drawn = true

	if dealer_score.get_score() > 21:
		overlay.activate_dealer_is_bust()
	elif dealer_score.get_score() > player_score.get_score():
		overlay.activate_dealer_won()
	else:
		dealer_draw_cooldown.start()

func _get_draw_index():
	var potential_indexes = []
	var i = 0
	for card in draw_pile.get_children():
		if card.drawn == false:
			potential_indexes.append(i)
		
		i += 1

	return potential_indexes.pick_random()

func _on_dealer_draw_cooldown_timeout() -> void:
	_draw_dealer()		
	
func reset():
	dealer_is_drawing = false
	for child in player_hand.get_children():
		child.queue_free()
	for child in dealer_hand.get_children():
		child.queue_free()
	for child in draw_pile.get_children():
		child.drawn = false
