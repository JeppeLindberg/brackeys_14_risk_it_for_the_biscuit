extends Node2D


@export var dealer_is_bust: Node2D
@export var player_is_bust: Node2D
@export var dealer_won: Node2D

@export var pot: Node2D
@export var rewind_time: Node2D
@export var hit_me_or_stay: Node2D


func _ready() -> void:
	clear()

func activate_dealer_is_bust():
	dealer_is_bust.visible = true
	pot.transfer_all_to_money()

func activate_player_is_bust():
	player_is_bust.visible = true
	hit_me_or_stay.visible = false
	rewind_time.visible = true

func activate_dealer_won():
	dealer_won.visible = true
	hit_me_or_stay.visible = false
	rewind_time.visible = true

func clear():
	dealer_won.visible = false
	player_is_bust.visible = false
	dealer_is_bust.visible = false
