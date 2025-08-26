extends Node2D

@export var items: Node2D
@export var card_piedestal: PackedScene



func _ready() -> void:
	generate()

func _process(delta: float) -> void:
	var i = len(get_children()) - 1
	for child in get_children():
		child.global_position = child.global_position.move_toward(global_position + Vector2(55.0,0.0) * i, delta * 300.0)
		i -= 1

func generate():
	for child in get_children():
		child.queue_free()

	var card_indexes = range(len(items.items))
	card_indexes.shuffle()

	for i in range(3):
		var new_piedestal = card_piedestal.instantiate()

		var new_item = items.items[card_indexes.pop_front()]
		var new_card = new_item['prefab'].instantiate()
		new_piedestal.add_child(new_card)

		new_piedestal.set_price(new_item['price'])
		add_child(new_piedestal)
