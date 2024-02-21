extends Node2D
class_name Player

var character: Character = Character.new()

func _init() -> void:
	var value = PropValue.new()
	value.set_value(20.0)
	
	character.props.set_prop(Initiative.new(), value)
