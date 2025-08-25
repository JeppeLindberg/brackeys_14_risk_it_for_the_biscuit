extends Node2D



func _process(delta: float) -> void:
	var i = len(get_children()) - 1
	for child in get_children():
		child.global_position = child.global_position.move_toward(global_position + Vector2(10.0,10.0) * i, delta * 300.0)
		i -= 1

