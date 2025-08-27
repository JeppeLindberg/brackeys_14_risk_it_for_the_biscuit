extends Node2D

@export var draw_pile: Node2D
@export var player_hand: Node2D
@export var player_score: Node2D
@export var overlay: Node2D
@export var score_counter:Node2D
@export var pot: Node2D


func draw_player():
	if score_counter.counting_score:
		return

	var draw_index = _get_draw_index()

	var new_card = draw_pile.get_child(draw_index).get_hand_card().instantiate()
	player_hand.add_child(new_card)
	new_card.global_position = global_position
	draw_pile.get_child(draw_index).drawn = true
	draw_pile.get_child(draw_index).fade_out()

	if player_score.get_score() > 21:
		overlay.activate_player_is_bust()

func begin_count_score():
	score_counter.begin_count_score()

func end_count_score():
	pot.transfer_all_to_money()

func _get_draw_index():
	var potential_indexes = []
	var i = 0
	for card in draw_pile.get_children():
		if card.drawn == false:
			potential_indexes.append(i)
		
		i += 1

	return potential_indexes.pick_random()
	
func reset():
	for child in player_hand.get_children():
		child.queue_free()
	for child in draw_pile.get_children():
		child.drawn = false
		child.fade_in()
