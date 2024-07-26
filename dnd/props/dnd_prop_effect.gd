extends RefCounted
class_name DndPropEffect

var from_prop: StringName
var to_prop: StringName
var value_rate: float
var max_value_rate: float
var min_value_rate: float

func get_key() -> String:
	return '%s-%s' % [from_prop, to_prop]

func to_dict() -> Dictionary:
	return {
		from_prop = from_prop,
		to_prop = to_prop,
		value_rate = value_rate,
		max_value_rate = max_value_rate,
		min_value_rate = min_value_rate,
	}
	
func from_dict(dict: Dictionary) -> void:
	from_prop = dict.from_prop
	to_prop = dict.to_prop
	value_rate = dict.value_rate
	max_value_rate = dict.max_value_rate
	min_value_rate = dict.min_value_rate
