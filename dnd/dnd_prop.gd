extends RefCounted
class_name DndProp

# 属性名
var name: StringName
var current: float

var current_max: float:
	set(v):
		v = minf(v, max_limit)
		current_max = v

var current_min: float:
	set(v):
		v = maxf(v, min_limit)
		current_min = v

var max_limit: float
var min_limit: float


func get_value() -> int:
	var v = clampf(current, current_min, current_max)
	return floorf(v) as int


func to_dict() -> Dictionary:
	return {
		name = name,
		current = current,
		current_max = current_max,
		current_min = current_min,
		max_limit = max_limit,
		min_limit = min_limit,
	}


func from_dict(dict: Dictionary) -> void:
	max_limit = dict.max_limit
	min_limit = dict.min_limit
	current_min = dict.current_min
	current_max = dict.current_max
	current = dict.current
	name = dict.name
