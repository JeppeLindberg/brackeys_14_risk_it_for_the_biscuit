extends Node2D

@export var hand_card_prefab: PackedScene

var drawn = false

func get_value():
	return(int(get_node('visual/text').text))

func get_hand_card():
	return(hand_card_prefab)



