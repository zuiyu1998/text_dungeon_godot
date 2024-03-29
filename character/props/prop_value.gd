extends Node
class_name PropValue

var _max: float = 200.0
var _value: float = 10.0

func clone() -> PropValue:
	var tmp = PropValue.new()
	tmp._max = _max
	tmp._value = _value
	return tmp

func get_value() -> int:
	var value = clampf(_value, 0, _max)
	return floori(value)

func set_value(value: float):
	_value = value

func set_max(max_value: float):
	_max = max_value
