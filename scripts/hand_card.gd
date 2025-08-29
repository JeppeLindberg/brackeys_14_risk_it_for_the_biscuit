extends Node2D

func get_value():
	var implementation = get_node_or_null('implementation')
	if implementation != null:
		if implementation.has_method('get_value'):
			return(implementation.get_value())

	return(int(get_node('visual/text').text))

func try_downgrade_value():	
	var implementation = get_node_or_null('implementation')
	if implementation != null:
		if implementation.has_method('try_downgrade_value'):
			return(implementation.try_downgrade_value())
	
	return(false)
