extends Node2D

@export var hand_card_prefab: PackedScene

var clear_color = Color.WHITE
var faded_color = Color(0.5,0.5,0.5,1.0)
var from_color = clear_color
var to_color = clear_color

var drawn = false

var fade_progress = 1.0


func _process(delta: float) -> void:
	if fade_progress < 1.0:
		fade_progress += delta * 4.0
		var to_color_a = to_color
		to_color_a.a *= fade_progress
		modulate = from_color.blend(to_color_a)
	else:
		modulate = to_color

func fade_out():
	fade_progress = 0.0
	from_color = clear_color
	to_color = faded_color

func fade_in():
	fade_progress = 0.0
	from_color = faded_color
	to_color = clear_color

func get_value():
	return(int(get_node('visual/text').text))

func get_hand_card():
	return(hand_card_prefab)



