extends StaticBody2D

@export var draw_pile_card_prefab: PackedScene

@onready var main = get_node('/root/main')
@onready var draw_pile = main.draw_pile

var mouse_hovering = false
var mouse_down = false


func _pressed():
	var card_piedestal = get_parent()
	if not card_piedestal.can_buy():
		return

	var new_card = draw_pile_card_prefab.instantiate()
	draw_pile.add_child(new_card)
	visible = false

func _is_active():
	if get_parent().visible and visible:
		return true
	return false

func _process(_delta: float) -> void:
	mouse_down = Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_released() and event.button_index == MOUSE_BUTTON_LEFT:
			if mouse_hovering and mouse_down and _is_active():
				_pressed()

func _on_mouse_exited() -> void:
	mouse_hovering = false

func _on_mouse_entered() -> void:
	mouse_hovering = true


