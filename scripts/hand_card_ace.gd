extends Node2D

var value = 11



func get_value():
	return(value)

func try_downgrade_value():
	value = 1
	return(true)

