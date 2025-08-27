extends Node2D


@export var text: Label
@export var display_text_timeout: Timer

@export var score_counter: Node2D
@export var hit_me_or_stay: Node2D

var pending_go_to_count_score = false


func _ready() -> void:
	clear()

func activate_player_is_bust():
	display_text('PLAYER IS BUST');
	hit_me_or_stay.visible = false
	pending_go_to_count_score = true

func display_text(tex):
	text.text = tex;
	display_text_timeout.start()

func clear():
	text.text = ''


func _on_display_text_timeout_timeout() -> void:
	clear()
	if pending_go_to_count_score:
		score_counter.begin_count_score()
	pending_go_to_count_score = false
