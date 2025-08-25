extends Node2D

@export var player_hand: Node2D

@export var score_text: Label


func get_score():
	var score = 0
	for card in player_hand.get_children():
		score += card.get_value()

	return score

func _process(_delta: float) -> void:	
	score_text.text = str(get_score())