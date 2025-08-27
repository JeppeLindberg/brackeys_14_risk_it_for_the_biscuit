extends Node2D

@export var score: Node2D
@export var overlay: Node2D
@export var player_score: Node2D
@export var deck: Node2D
@export var player_hand: Node2D

@export var score_count_cooldown: Timer


var counting_score = false
var index = -1



func begin_count_score():
	counting_score = true
	index = -1
	_progress_count_score()

func _progress_count_score():
	index += 1

	if index == 0:
		if player_score.get_score() == 21:
			overlay.display_text('PLAYER SCORE 21! +21 SCORE')
			score.adjust_by(21)
		else:
			index += 1
	if index == 1:
		var i = 0
		for card in player_hand.get_children():
			i += 1
		overlay.display_text('PLAYER CARDS! +1 SCORE FOR EACH')
		score.adjust_by(i)
	if index == 2:
		if player_score.get_score() > 21:
			overlay.display_text('BUST! HALF SCORE!')
			score.adjust_by(-int(score.get_amount() / 2))
	if index == 3:
		end_count_score()
		return

	score_count_cooldown.start()

func end_count_score():
	counting_score = false
	deck.end_count_score()

func _on_score_count_cooldown_timeout() -> void:
	_progress_count_score()
